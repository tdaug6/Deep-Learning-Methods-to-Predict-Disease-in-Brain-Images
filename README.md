# Deep-Learning-Methods-to-Predict-Disease-in-Brain-Images

## Goals

1. Capture biologically significant insights from fMRI files

2. Generalize model

3. Make model robust to noise

4. Assess the model's performance

## Steps to accomplish goals

The steps to accomplish the project goals follow the steps to creating and optimizing a machine learning model in most other contexts. 
Classification models generally follow the same path in every application: 
choose features, 
build a model, 
make predictions, 
evaluate accuracy, 
and refine the model.

### Goal 1: Capture biologically significant insight

- Atlas:

An atlas is a three dimensional image file that groups sections of the fMRI as regions that are related. 
Applying the atlas reduces the data from the fMRI to a vector of the average signal intensity of each region in the subject’s brain. 
This is applied to each of the fMRIs in the project to create a single subject by region intensity matrix to build a model from.

### Goal 2: Generalize model

- Atlas

The time dimension of the fMRIs varies based on how long the testing facility recorded data for. 
The atlas averages the times, eliminating different time lengths from impacting the useability of the model. 

- Functions

Functions reduce the repetitive nature that programs can have when the same tasks are performed multiple times. 
Many of the notebooks in this repository are evaluating multiple models on multiple dataframes. 
Functions reduce the lines of code that would exist by repeating the same task multiple times and ensures that the exact same operations are being carried out on each of the tests. 
In this way, using functions in the notebooks ensures that all models are measured under the same conditions.

- Loops

Loops can run a piece of code for as many times as are necessary to complete analysis on data.
For example, the patient diagnosis is located in a different file for each of the sites. 
By looping through every file in the folder, it is simple to access the diagnosis for each of the sites. 
It would also be possible to add another site’s data without changing this portion of the code.


### Goal 3: Make model robust to noise

- Feature Engineering

Modifying features is a common way to reduce the bias that may occur when models are trained on a raw dataset. 
Features with higher values than other features tend to have more weight in the prediction algorithm. 
This can be undesirable when the features are representing different scales. 
This is why many of the notebooks utilize feature engineering to convert the features to a similar scale or distribution. 
Most notebooks will use z-statistic normalization on the features and a few will scale the values to fit within 0 and 1. 
The accuracies of these methods are compared to the unchanged dataframe as a baseline.

- Feature Selection

Commonly, not all features in a dataframe are useful for training models to predict the target (ADHD diagnosis). 
This case is especially true when datasets contain 600+ features, as in the region correlation dataframe. 
To reduce the number of features, and therefore noise, features were removed based on a threshold of correlation between the features and the target. 
Observations from the results of these can be made from files with the word "Condensed" in the title.

### Goal 4: Assess the model's performance

- 100-Iteration Train/Test Split

The primary method of accuracy evaluation was from using a 100-iteration model training and prediction process. 
The features and targets are split 100 times using the train_test_split() method from scikit learn. 
Each model was trained and tested 100 times and the average accuracy was taken. 
This gives a more well-rounded understanding of how each model would likely perform on new data.

- Cross-validation

Cross-validation involves splitting the dataset into equally sized parts and training the models on all data except for one part. 
This is repeated until all data has been tested on and used to train other models. 
Cross-validation is similar to the 100-iteration train/test split in that it gives insight to how models would likely perform on new data.

- Confusion Matrices

Confusion matrices provide a more detailed understanding to the prediction accuracy of models. 
Confusion matrices reveal how the model's predictions compare the the true target values in the form of a matrix. 
This is useful to see why models are more accurate compared to the less accurate models.

- Testing Holdout

This accuracy method involves a very specific random_state for train_test_split() that is the same that was used in feature selection. 
This simulates exactly what it would be like if the model were to experience new data, since the features were selected based on the training data.
