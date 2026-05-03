import json
import csv
import os
import datetime
import nltk 
from nltk.corpus import stopwords
from nltk.stem.porter import PorterStemmer
import re
from collections import Counter
import sklearn
from sklearn.feature_extraction.text import CountVectorizer
from sklearn.svm import LinearSVC
from sklearn.svm import SVC
from sklearn.feature_extraction.text import TfidfTransformer
from sklearn.multiclass import OneVsRestClassifier
import numpy as np
from sklearn.naive_bayes import MultinomialNB
from sklearn import preprocessing
from sklearn.pipeline import Pipeline
from sklearn.neighbors import KNeighborsClassifier
from sklearn.qda import QDA
from sklearn.base import TransformerMixin
from sklearn.ensemble import RandomForestClassifier

y_train = []
x_train = []

keyValList = ('Arcade', 'Action', 'Adventure', 'Board', 'Card', 'Casino','Educational', 'Family','Music','Puzzle','Role Playing','Simulation','Strategy','Trivia','Word')

keyValList2 = ('Arcade & Action', 'Brain & Puzzle', 'Cards & Casino')

print "GETTING THE TRAINING CASES"
training_file = P_Raw_Data / '20140501'
for line in open(training_file, 'r'):
	line = unicode(line)
	row = json.loads(line)

	# this line grabs only the description of the app and the genre of the app from the bigger dictionary
	subdict = dict((k, row[k]) for k in ('description', 'genre'))
	if subdict.get('genre') in keyValList:
		y_train.append(subdict.get('genre'))
		x_train.append(subdict.get('description'))

le = preprocessing.LabelEncoder()

y_train_vector = le.fit_transform(y_train)

class_list = list(le.classes_)

classifier = Pipeline([
    ('vectorizer', CountVectorizer(stop_words='english',min_df=9)),
    ('tfidf', TfidfTransformer()),
    ('clf', RandomForestClassifier())])

print "CLASSIFYING"
classifier.fit(x_train, y_train)

###########

m = 2
y = 2014

while y > 2011:
	stry = str(y)
	while m>0:
		strm = str(m)
		
		x_test = []
		list = []
		
		if m<10:
			filename = stry+"0"+strm+"26"
			csvfilename = "categories_"+stry+"_0"+strm+"_26.csv"
		else: 
			filename = stry+strm+"26"
			csvfilename = "categories_"+stry+"_"+strm+"_26.csv"
			
		csvfilename = P_Monthly_Data / csvfilename
		c=csv.writer(file(csvfilename,'wb'),dialect='excel')

		print "GETTING THE TEST CASES FOR"+" "+stry+" "+strm
		filename = P_Raw_Data/filename
		for line in open(filename, 'r'):
			line = unicode(line)
			row = json.loads(line)

			# this line grabs only the description of the app and the genre of the app from the bigger dictionary
			subdict = dict((k, row[k]) for k in ('id','description', 'genre'))
			if subdict.get('genre') in keyValList2:
				x_test.append(subdict.get('description'))
				list_id_genre = [subdict.get('id'), subdict.get('genre')]
				list.append(list_id_genre)


		print "PREDICTING"
		y_pred = classifier.predict(x_test)

		print "WRITING TO FILE"
		i = 0
		print len(list)
		print len(y_pred)
		while i <len(list):
			list[i].append(y_pred[i])
			row = list[i]
			c.writerow(row)
			i = i+1
		
		m = m-1
	y = y - 1
	m = 12

	
