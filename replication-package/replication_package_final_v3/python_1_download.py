import requests
import json
import os
import datetime
import requests
import bs4
from bs4 import BeautifulSoup
import base64
import io
import pickle
import urllib2

username = 'YOUR_USERNAME'
password = 'YOUR_PASSWORD'
api_key = 'YOUR_API_KEY'

m = 1
d = 1
y = 2012

maxdlist = {1:31 ,2:28, 3:31, 4:30, 5:31, 6:30, 7:31, 8:31, 9:30, 10:31, 11:30, 12:31}

while y<=2014:
	stry = str(y)
	while m<=12:
		strm = str(m)
		for month, maxdates in maxdlist.items():
			if month == m:
				maxd = maxdates
	
		while d <= 29:
			strd = str(d)
			if m<10:
				if d<10:
					datestr = stry+"-0"+strm+"-0"+strd
				else:
					datestr = stry+"-0"+strm+"-"+strd
			else:
				if d<10:
					datestr = stry+"-"+strm+"-0"+strd
				else:
					datestr = stry+"-"+strm+"-"+strd			
	
			url = "https://api.appmonsta.com/v1/stores/android/details.json?country=US&date="+datestr
			request = urllib2.Request(url)
			# You need the replace to handle encodestring adding a trailing newline 
			# (https://docs.python.org/2/library/base64.html#base64.encodestring)
			base64string = base64.encodestring('%s:%s:%s' % (api_key, username, password)).replace('\n', '')
	
			request.add_header("Authorization", "Basic %s" % base64string)  
			try:
				result = urllib2.urlopen(request)
				if m<10:
					if d<10:
						filename = stry+"0"+strm+"0"+strd
					else:
						filename = stry+"0"+strm+strd
				else:
					if d<10:
						filename = stry+strm+"0"+strd
					else:
						filename = stry+strm+strd		
								
				filename = P_Raw_Data/filename
				f = open(filename, 'wb')
				for row in result:
					f.write(row)
				f.close()
			
				print strd
				d = d+1
			except Exception,e:
				print str(e)
				d = d+1
		d = 1
		print strm
		m = m+1
	m = 1
	d = 1
	y = y+1

