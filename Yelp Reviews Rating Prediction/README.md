# Enhanced Document Retreival System Using ML

# Project Goal:
The goal of this project is to improve search result relevance in document retrieval systems by developing and implementing a sophisticated ranking model based on supervised machine learning techniques. Leveraging Natural Language Processing (NLP) and regression algorithms and by employing techniques such as text processing, tokenization, and feature engineering, the model enhances the accuracy of document retrieval, ultimately leading to more relevant search results for users. 

# Technologies Used:
1. Python: Programming language for data manipulation and model development.
2. Pandas: Library for data manipulation and analysis.
3. NLTK (Natural Language Toolkit): Library for natural language processing tasks.
4. XGBoost: Machine learning library for regression tasks.
5. numpy: Library for numerical computing, offering support for multidimensional arrays and mathematical operations on these arrays.

# Data Used:
The Yelp reviews dataset, obtained from Kaggle, serves as the primary data source for this project. The data includes document details such as product titles, descriptions, attributes, search terms, and relevance scores.

# Process:

### Text Processing and Tokenization:
1. Text data from the dataset is processed to remove noise, punctuation, and stopwords.
2. Tokenization is performed to split text into individual tokens or words.

### Building Corpus and TF-IDF Matrices:
1. A common vocabulary is built for all documents and search terms by combining unique tokens from product titles, descriptions, and attributes.
2. TF-IDF matrices are constructed for product titles, descriptions, attributes, and search terms using the built vocabulary.

### Feature Engineering:
1. Cosine similarity scores, Jaccard coefficients, and overlap scores are calculated for each document-query pair between product titles, descriptions, attributes, and search terms.
2. New features are constructed using these similarity metrics to represent the relevance of documents to search queries.

# Model Training:
1. XGBoost regressor is chosen as the model for training due to its effectiveness in regression tasks.
2. The model is trained on the training dataset consisting of the engineered features and relevance scores.

# Model Evaluation and Parameter Tuning:
1. Evaluated the model performance using metrics such as Root Mean Square Error (RMSE) on the validation set.
2. Performed parameter tuning on the XGBoost model to optimize performance and reduce RMSE.

# Prediction on Test Dataset:
1. The trained model is used to predict relevance scores for the test dataset.
2. Generated TF-IDF vectors and features for the test data using the vocabulary built earlier.
3. Predicted relevance scores are generated for each document-search term pair.

# Write Results to CSV:
Save the predicted relevance scores for the test data to a CSV file for further analysis.
