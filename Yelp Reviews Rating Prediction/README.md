# Yelp Review Star Rating Prediction

# Project Goal:
The goal of this project is to predict the star rating of consumer reviews using machine learning techniques. Leveraging Natural Language Processing (NLP) and regression algorithms, the aim is to develop a model that predicts the star rating based on the textual content of the reviews. By utilizing Python, pandas, NLTK, and XGBoost, the aim is to achieve an optimized predictive model and provide valuable insights into consumer sentiment analysis.

# Technologies Used:
Python: Programming language for data manipulation and model development.
Pandas: Library for data manipulation and analysis.
NLTK (Natural Language Toolkit): Library for natural language processing tasks.
XGBoost: Machine learning library for regression tasks.

# Data Used:
The Yelp reviews dataset, obtained from Kaggle, serves as the primary data source for this project. The dataset contains textual reviews along with corresponding star ratings (ranging from 0 to 5) provided by consumers.

# Process:
### Data Preprocessing:
1. Load the Yelp reviews dataset into a pandas DataFrame.
2. Perform data cleaning and preprocessing and tokenization.
3. Merge all reviews into a single text corpus.

### Text Processing:
1. Build a vocabulary using NLTK to represent the unique words in the corpus.
2. Generate TF-IDF (Term Frequency-Inverse Document Frequency) vectors for each review, representing the importance of each word in the corpus.

# Model Training:
1. Prepare the training dataset by combining the TF-IDF vectors with the corresponding star ratings.
2. Split the dataset into training and validation sets for model evaluation.
3. Utilize XGBoost's XGBRegressor for training a regression model to predict star ratings based on TF-IDF vectors.

# Model Evaluation and Parameter Tuning:
1. Evaluate the model performance using metrics such as Root Mean Square Error (RMSE) on the validation set.
2. Perform parameter tuning on the XGBoost model to optimize performance and reduce RMSE.

# Prediction on Test Dataset:
1. Load the test dataset containing reviews without star ratings.
2. Generate TF-IDF vectors for the test reviews using the vocabulary built earlier.
3. Use the trained XGBoost model to predict star ratings for the test reviews based on their TF-IDF vectors.

# Write Results to CSV:
Save the predicted star ratings for the test reviews along with their corresponding review texts to a CSV file for further analysis.
