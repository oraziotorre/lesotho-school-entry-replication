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
from datetime import timedelta, date, datetime



keyValList = ('Arcade & Action', 'Brain & Puzzle', 'Cards & Casino', 'Sports', 'Sports Games', 'Casual', 'Racing', 'Arcade', 'Action', 'Adventure', 'Board', 'Card', 'Casino','Educational', 'Family','Music','Puzzle','Role Playing','Simulation','Strategy','Trivia','Word')



def datespan(startDate, endDate, delta=timedelta(days=1)):
    currentDate = startDate
    while currentDate < endDate:
        yield currentDate
        currentDate += delta

dates = []
for day in datespan(date(2012, 1, 6), date(2015, 1, 2), delta=timedelta(days=7)):
	date2 = str(day)
	date2 = re.sub('-','',date2)
	dates.append(date2)

## FOR NONGAME DATA  

for date in dates: 
	csvfilename = "weeklydata_nongames_"+date+".csv"
	csvfilename = P_Weekly_Data_Nongames / csvfilename
	c=unicodecsv.writer(file(csvfilename,'wb'),encoding="utf-8")

	print "GETTING THE DATA FOR"+" "+date
	for line in open(date, 'r'):
		line = unicode(line)
		row = json.loads(line)

		# this line grabs only the description of the app and the genre of the app from the bigger dictionary
		list_id_genre = []
		subdict = dict((k, row[k]) for k in ('id', 'genre','downloads'))
		if subdict.get('genre') not in keyValList:
			list_id_genre = [subdict.get('id'), subdict.get('genre'), subdict.get('downloads') ]
			c.writerow(list_id_genre)
	


## FOR GAME DATA  

for date in dates: 
	csvfilename = "weeklydata_games_"+date+".csv"
	csvfilename = P_Weekly_Data_Games / csvfilename
	c=unicodecsv.writer(file(csvfilename,'wb'),encoding="utf-8")

	print "GETTING THE DATA FOR"+" "+date
	for line in open(date, 'r'):
		line = unicode(line)
		row = json.loads(line)

		# this line grabs only the description of the app and the genre of the app from the bigger dictionary
		list_id_genre = []
		subdict = dict((k, row[k]) for k in ('id', 'genre','downloads'))
		if subdict.get('genre') in keyValList:
			list_id_genre = [subdict.get('id'), subdict.get('genre'), subdict.get('downloads') ]
			c.writerow(list_id_genre)
	
			