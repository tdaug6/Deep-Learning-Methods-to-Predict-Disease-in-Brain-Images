# Deep-Learning-Methods-to-Predict-Disease-in-Brain-Images

## Goals

1. Capture biologically significant insights from fMRI files

2. Generalize model

3. Make model robust to noise

5. Assess the model's performance

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

- Loops

Loops can run a piece of code for as many times as are necessary to complete analysis on data.
For example, the patient diagnosis is located in a different file for each of the sites. 
By looping through every file in the folder, it is simple to access the diagnosis for each of the sites. 
It would also be possible to add another site’s data without changing this portion of the code.
