# School Demonstration

The Schema Framework project is a test case and demonstration program
to illustrate the usage of linked tables in a many-to-many relationship.

A new framework feature, **xslkey** adds and uses an xsl:key element
to the XSL stylesheet to speed access to related data.

## Importing Data

In order to test the performance of this new feature, it was necessary
to have relatively large sets of data.  I created a set of little projects
that helped me to scrape data for student and course records.

These helper projects are:

- [scrape](https://www.github.com/cjungmann/scrape) to collect data from the internet.
- [namegen](https://www.github.com/cjungmann/namegen) to generate a random set of names
  using a weighted inventory of surnames, girls, and boys names.  The names inventory
  is generated using **scrape**
- [pxml2ods](https://www.github.com/cjungmann/pxml2ods) to convert an XML file to an
  ODS format spreadsheet that is widely accepted format for importing data.


### Student Database

I scraped data from [Geneanet](https://en.geneanet.org) for surnames, and boys and girls names
from the [Automated Vital Statistics System](http://www.avss.ucsb.edu/NameGB.HTM) of USCB.
Look at the [namegen builddoc](https://www.github.com/cjungmann/namegen/blob/master/builddoc)
script for how this was done.

### Course Database

I scraped this data from the
[Carleton College](https://apps.carleton.edu/campus/registrar/schedule/proposed/)
proposed course list for the 2018-2019 school year.  The contents of the page probably change from
year to year.

