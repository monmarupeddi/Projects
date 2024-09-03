from datetime import datetime
from airflow import DAG
from airflow.operators.python import PythonOperator


def formatData(response):
    data = {}
    data['bed'] = response["bathrooms"]
    data['bath'] = response["bedrooms"]
    data['street'] = response["streetAddress"]
    data['city'] = response["city"]
    data['country'] = response["country"]
    data['zip'] = response["zipcode"]

    data['days_on_zillow'] = response["daysOnZillow"]
    data['status'] = response["homeStatus"]
    data['type'] = response["homeType"]
    data['featured'] = response["isFeatured"]
    data['non_owner_occupied'] = response["isNonOwnerOccupied"]

    data['area'] = response["livingArea"]

    data['price'] = response["price"]
    data['rent_estimate'] = response["rentZestimate"]
    data['taxVal'] = response["taxAssessedValue"]

    data['lat'] = response["latitude"]
    data['long'] = response["longitude"]
    data['image'] = response["imgSrc"]
    print(data)
    return data


# stream the data
def inputData():
    import json
    import requests
    import requests

    url = "https://zillow56.p.rapidapi.com/search"
    querystring = {"location": "houston, tx", "output": "json", "status": "forSale", "sortSelection": "priorityscore",
                   "listing_type": "by_agent", "doz": "any"}

    headers = {
        "x-rapidapi-key": "978ce3ad5emsh84fa1680df9afd1p169328jsn90f034209c7a",
        "x-rapidapi-host": "zillow56.p.rapidapi.com"
    }

    response = requests.get(url, headers=headers, params=querystring).json()
    print(response)
   # response  = response['results'][0]
  #  response = formatData(response)
    print(json.dumps(response, indent=3))
    return response


#rint(inputData())

# default argument to attach to project for ownership
defaultArgs = {
    'owner': 'luckyMonkey',
    'start_date': datetime(2024, 8, 3, 7, 00),
    'email': ['name@email.com']
}

def kafka_producer():
    import json
    from kafka import KafkaProducer
    data = inputData()

    kafka_producer = KafkaProducer(bootstrap_servers=['broker'
                                                      ':29092'], max_block_ms=5000)
    kafka_producer.send('housingData', json.dumps(data).encode('utf-8'))

#kafka_producer()

with DAG('zllowHousesStream_dag',
         default_args=defaultArgs,
         schedule_interval='@daily',
         catchup=False) as dag:
    extractAndStream = PythonOperator(
        task_id='extract_data_from_RapidAPI',
    python_callable = kafka_producer
    )


