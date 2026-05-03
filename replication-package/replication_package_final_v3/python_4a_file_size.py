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


m = 12
y = 2014

while y > 2011:
	stry = str(y)
	while m>0:
		strm = str(m)
		
		x_test = []
		list = []
		desc_list =[]
		
		if m<10:
			filename = stry+"0"+strm+"26"
			csvfilename = "appsize_"+stry+"_0"+strm+"_26.csv"
		else: 
			filename = stry+strm+"26"
			csvfilename = "appsize_"+stry+"_"+strm+"_26.csv"
			
		csvfilename = P_Monthly_Data / csvfilename
		c=csv.writer(file(csvfilename,'wb'),dialect='excel')

		print "GETTING THE TEST CASES FOR"+" "+stry+" "+strm
		filename = P_Raw_Data/filename
		for line in open(filename, 'r'):
			line = unicode(line)
			row = json.loads(line)

			# this line grabs only the description of the app and the size of the app from the bigger dictionary
			subdict = dict((k, row[k]) for k in ('id', 'file_size'))
			list_id_genre = [subdict.get('id'), subdict.get('file_size')]
			list.append(list_id_genre)

		print "WRITING TO FILE"
		
		
		i = 0
		print len(list)
		while i <len(list):
			row = list[i]
			c.writerow(row)
			i = i+1

		m = m-1
	y = y - 1
	m = 12

	
