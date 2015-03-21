# DS_GetData_Project
This is the Project for Getting and Cleaning data

## Files

- `README.md` This file explains the repository and how you will run the script.

- `Codebook.md` This is the code book file that describes the variables of the tidy data set.

- `run_analysis.R` This is the R script that will perform transformation on the given dataset in the project.
 
- `tidy_data_set.txt` This is the output file for the project, which is also the final output of the `run_analysis.R` script.
 
## Dependencies

`run_analysis.R` script has a dependency on the dplyr library. Please make sure to install the dplyr package and load the library for the script to run.

http://cran.r-project.org/web/packages/dplyr/index.html

Also, the data set is assumed to be in the working directory, in a sub directory named "UCI HAR Dataset".
To obtain the dataset zipped file, download it from here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

And unzip it into the sub directory called "UCI HAR Dataset"

## Usage

First, set your working directroy in the R console to the location of the `run_analysis.R` file.

Second, ensure that the dataset is unzipped into the a sub directory in the working directroy called "UCI HAR Dataset"

To run the script, in the R console, type
`source("./run_analysis.R")`

After the script runs, the tidy data is avaiable in a data frame called `avg_data` and is written out to a file named `tidy_data_set.txt`.

