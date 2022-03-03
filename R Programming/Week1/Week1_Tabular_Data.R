### Tabular Data
# read.table, read.csv : reading tabular data
# readLines : reading lines of a text file
# source : reading in R code files (inverse of dump)
# dget : reading in R code files (inverse of dput)
# load : reading in saved workspace
# unserialize : reading single R objects in binary form

### Writing Data
# write.table
# writeLines
# dump
# dput
# save
# serialize

### Reading Data Files with read.table
# file : the name of file, or a connection
# header : logical indicating if the file has a header line
# sep : a string indicating how the columns are seperated
# colClasses : a character vector indicating the class of each column in the dataset
# nrows : the number of rows in the dataset
# comment.char : a character string indicating the comment character
# skip : the number of lines to skip from the beginning
# stringsAsFactors : should character variables be coded as factors?

data <- read.table('foo.txt')

### Reading in Larger Datasets with read.table
intial <- read.table('database.txt', nrows=100)
classes <- sapply(initial, class)
tabAll <- read.table('datatable.txt', colClasses=classes)

### Textual Data Formats
# dumping and dputing : useful because the resulting textual format is editable, and in the case of corruption, potentially recoverable
# Unlike writing out a table or csv file, [dump] and [dput] preserve the metadata (sacrificing some readability), so that another user doesn't have to specify it all over again.
# [Textual] formats can work much better with version control programs like subversion or git which can only track changes meaningfully in text files
# Textual formats can be longer-lived; if there is corruption somewhere in the file, it can be easier to fix the problem
# Textual formats adhere to the 'Unix philosophy'
# Downside : The format is not very space-efficient

### dput-ting R Objects
y <- data.frame(a=1, b='a')
y
dput(y)
dput(y, file='y.R')
new.y <- dget('y.R')
new.y

### Dumping R Objects
x <- 'foo'
y <- data.frame(a=1, b='a')
dump(c('x', 'y'), file='data.R')
rm(x, y)
source('data.R')
y
x

### Connections : Interfaces to the Outside World
# Data are read in using connection interfaces.
# Connections can be made to files (most common) or to other more exotic things
# [file] opens a connection to a file
# [gzfile] opens a connection to a file compressed with [gzip]
# [bzfile] opens a connection to a file compressed with [bzip2]
# [url] opens a connection to a webpage

str(file)
# [description] : the name of the file
# [open] is a code indicating
# [r] : read only
# [w] : writing (and initializing a new file)
# [a] : appending
# [rb], [wb], [ab] : reading, writing, or appending in binary mode (windows)

### Connections
con <- file('foo.txt', 'r')
data <- read.csv(con)
close(con)

# is the same as
data <- read.csv('foo.txt')

### Reading Lines of a Text File
con <- gzfile('words.gz')
x <- readLines(con, 10)
x

## This might take time
con <- url('http://www.jhsph.edu', 'r')
x <- readLines(con)
head(x)
tail(x)
x







