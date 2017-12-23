#!/usr/bin/env python

import psycopg2


DBNAME = 'news'
db = psycopg2.connect(database = DBNAME)
c = db.cursor()
c.execute("select * from article_ranks")
result = c.fetchall()
db.close()

print "Most Popular Articles with View Count"
print "-------------------------------------"

for row in result:
	print row[0] + " -- " + str(row[1])
print

DBNAME = 'news'
db = psycopg2.connect(database = DBNAME)
c = db.cursor()
c.execute("select * from popular_authors")
result = c.fetchall()
db.close()


print "Most Popular Authors with View Count"
print "------------------------------------"

for row in result:
	print row[0] + " -- " + str(row[1])
print

DBNAME = 'news'
db = psycopg2.connect(database = DBNAME)
c = db.cursor()
c.execute("select * from rates where percent >= 1")
result = c.fetchall()
db.close()


print "Days with 1% error or more"
print "------------------------------------"

for row in result:
	print str(row[0]) + " -- " + str(row[1])
print

