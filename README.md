# Log Analysis README
This source code analyzes a fictional news website that can be installed using the
instructions below. The source code aims to list in a concise manner through the use
of PostgreSQL and a Python Database the following questions:

1) What are the 3 highest ranking articles and their access counts?
2) What is the authors' ranking by access counts?
3) In which day did errors occur more than 1% of the transactions?

In order to enhance the readability of the program, 3 views were created to minimize
the size of queries. These views can be installed by following the instructions below.
The results file can be used to compare the final output of the program to the expected results

## Requirements
* Vagrant
* VirtualBox
* Terminal

## How to use:
(Assuming you have installed the Requirements by their **default** settings...)
1. Download reporterdb.py, Vagrantfile, views.sql, and newsdata.sql from this repository.
2. Download newsdata.sql from [link](https://d17h27t6h515a5.cloudfront.net/topher/2016/August/57b5f748_newsdata/newsdata.zip)
3. Put reporterdb.py, Vagrantfile, newsdata.sql, and views.sql into a new directory called 'vagrant' inside another directory. (ie "Downloads/logAnalysis/vagrant")
4. Open Terminal and navigate to the previous directory
5. Type "vagrant up" followed by "vagrant ssh"
7. Type in, "cd /vagrant".
8. Type in "psql -d news -f newsdata.sql". This will connect to your installed database server.
9. Now type in "psql -d news -f views.sql". This will create views needed for the python script.
10. Run the Log Analysis tool by typing "python reporterdb.py"
