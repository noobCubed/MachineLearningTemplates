# -*- coding: utf-8 -*-
"""
Created on Sun Dec 24 16:11:36 2017

@author: Madhusudhan
"""

#Importing the libraries
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

#Importing the dataset
dataset = pd.read_csv('Market_Basket_Optimisation.csv', header = None)

#Changing the dataset into a list of lists as the Apriori function in Python takes only that as input 
transactions = [] #Making a transactions variable as a vector
for i in range(0, 7501):
    transactions.append([str(dataset.values[i, j]) for j in range(0,20)]) #Appending each row as a list of strings
                                                                          #(function only accepts strings) to the 
                                                                          #list called transactions

#Training Apriori on the dataset
from apyori import apriori
rules = apriori(transactions, min_support = 0.003, min_confidence = 0.2, min_lift = 3, min_length = 2)

