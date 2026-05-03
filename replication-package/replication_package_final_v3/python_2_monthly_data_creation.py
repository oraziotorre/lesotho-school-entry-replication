import json
import csv
import os
import datetime
import nltk 
from nltk.corpus import stopwords
from nltk.stem.porter import PorterStemmer
import re
from collections import Counter
import numpy as np
import unicodecsv


m = 12
y = 2014

while y > 2011:
	stry = str(y)
	while m>0:
		strm = str(m)
		
		if m<10:
			filename = stry+"0"+strm+"26"
			csvfilename = "monthlydata_"+stry+"_0"+strm+"_26.csv"
		else: 
			filename = stry+strm+"26"
			csvfilename = "monthlydata_"+stry+"_"+strm+"_26.csv"
			
		csvfilename = P_Monthly_Data / csvfilename 
		c=unicodecsv.writer(file(csvfilename,'wb'),encoding="utf-8")

		print "GETTING THE DATA FOR"+" "+stry+" "+strm
		filename = P_Raw_Data/filename
		for line in open(filename, 'r'):
			line = unicode(line)
			row = json.loads(line)

			if (y==2014 & m>4):
				subdict = dict((k, row[k]) for k in ('id', 'genre', 'price','file_size','publisher_id','publisher_name','all_rating','all_rating_count','downloads','status_date','app_type'))
				list_id_genre = [subdict.get('id'), subdict.get('genre'), subdict.get('price'), subdict.get('file_size'), subdict.get('publisher_id'),  subdict.get('publisher_name'), subdict.get('all_rating'), subdict.get('all_rating_count'), subdict.get('downloads'), subdict.get('status_date'), subdict.get('app_type') ]
			else:
				try:
					subdict = dict((k, row[k]) for k in ('id', 'genre', "price",'file_size','publisher_id','publisher_name','all_rating','all_rating_count','downloads','status_date'))				
					list_id_genre = [subdict.get('id'), subdict.get('genre'), subdict.get('price'), subdict.get('file_size'), subdict.get('publisher_id'),  subdict.get('publisher_name'), subdict.get('all_rating'), subdict.get('all_rating_count'), subdict.get('downloads'), subdict.get('status_date') ]
				except: 
					try:
						subdict = dict((k, row[k]) for k in ('id', 'genre', 'price','file_size','publisher_id','publisher_name','downloads','status_date'))	
						noratings = 1			
						list_id_genre = [subdict.get('id'), subdict.get('genre'),  subdict.get('price'), subdict.get('file_size'), subdict.get('publisher_id'),  subdict.get('publisher_name'), "NA", "NA", subdict.get('downloads'), subdict.get('status_date') ]
					except:
						subdict = dict((k, row[k]) for k in ('id', 'genre','file_size','publisher_id','publisher_name','all_rating','all_rating_count','downloads','status_date'))		
						list_id_genre = [subdict.get('id'), subdict.get('genre'), "NA", subdict.get('file_size'), subdict.get('publisher_id'),  subdict.get('publisher_name'), subdict.get('all_rating'), subdict.get('all_rating_count'), subdict.get('downloads'), subdict.get('status_date') ]
								
						
						
						
			c.writerow(list_id_genre)
		
		m = m-1
	y = y - 1
	m = 12

	
