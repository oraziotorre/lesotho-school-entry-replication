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
import unicodecsv


m = 1
y = 2012

while y < 2015:
	stry = str(y)
	while m<13:
		strm = str(m)
		
		if m<10:
			filename = stry+"0"+strm+"26"
			csvfilename1 = "related_apps"+stry+"_0"+strm+"_26.csv"
			csvfilename2 = "also_installed"+stry+"_0"+strm+"_26.csv"
			csvfilename3 = "more_from_developer"+stry+"_0"+strm+"_26.csv"
			
		else: 
			filename = stry+strm+"26"
			csvfilename1 = "related_apps"+stry+"_"+strm+"_26.csv"
			csvfilename2 = "also_installed"+stry+"_"+strm+"_26.csv"
			csvfilename3 = "more_from_developer"+stry+"_"+strm+"_26.csv"

		csvfilename1 = P_Monthly_Data / csvfilename1
		csvfilename2 = P_Monthly_Data / csvfilename2
		csvfilename3 = P_Monthly_Data / csvfilename3		
		a=unicodecsv.writer(file(csvfilename1,'wb'),encoding="utf-8")
		b=unicodecsv.writer(file(csvfilename2,'wb'),encoding="utf-8")
		c=unicodecsv.writer(file(csvfilename3,'wb'),encoding="utf-8")

		print "GETTING THE DATA FOR"+" "+stry+" "+strm
		filename = P_Raw_Data/filename
		for line in open(filename, 'r'):
			line = unicode(line)
			row = json.loads(line)

			subdict = dict((k, row[k]) for k in ('id', 'related'))
			
			related_list = subdict.get('related')
			
			related_apps_list = related_list.get('related_apps')
			if related_apps_list is None:
				related_apps_list = ["","","",""]
			
			
			also_installed_list = related_list.get('also_installed')
			if also_installed_list is None:
				also_installed_list = ["","","",""]
			
	
			more_from_developer_list = related_list.get('more_from_developer')
			if more_from_developer_list is None:
				more_from_developer_list = ["","","",""]			

						
			
			list_id_related = [subdict.get('id')]
			for i in related_apps_list:
				list_id_related.append(i)
			a.writerow(list_id_related)
			

			list_id_installed = [subdict.get('id')]
			for i in also_installed_list:
				list_id_installed.append(i)
			b.writerow(list_id_installed)
			
			list_id_dev = [subdict.get('id')]
			for i in more_from_developer_list:
				list_id_dev.append(i)
			c.writerow(list_id_dev)			
					
			
		
		m = m+1
	y = y +1
	m = 1

	
