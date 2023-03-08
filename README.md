# User Documentation

## Brieft Summary

Link to shiny.io page: [Project link](https://quinnnc.shinyapps.io/ps06assignment/)

The Shiny App pulls its information from [Kaggle](kaggle.com). 

The objective of the dataset is to provide information regarding different 
possible career paths if one were to have a degree in Informatics. 
This is to help myself, my pears here in informatics class, as well as any
other people who would be interested in researching this topic for their own personal reasons.

This problem set took me approsimately 12 hours to complete.

The variables in the dataframe are what we were able to find on the website 
that we were able to pull from. Here is the variable list for reference:

* **n** - ID number of each data point
* **work_year** - The year in which the data is collected from
* **experience_level** - Experience levels of worker, which can be broken down as:
  * EN : Entry level
  * MI : Mid level
  * SE : Senior level
  * EX : Expert/Executive level
* **employment_type** - Employment types, which can be broken down as:
  * PT : Part time
  * FT : Full time
  * CT : Contract
  * FL : Freelance
* **job_title** - The name of the role
* **salary** - The total gross salary amount paid
* **salary_currency** - The currency of the salary paid
* **salary_in_usd** - The salary in US Dollars
* **employee_residence** - Employee's primary countru of residence
* **remote_ratio** - The overall amount of work done remotely (%)
* **company_location** - The country of the employer's main office or contracting branch
* **company_size** - The average number of people that worked for the company during the year. The categories are:
  * S : (small) less than 50 employees
  * M : (medium) 50 to 250 employees
  * L : (large) more than 250 employees

## Details of the page 

### Page 1 - About

Provides a quick summary of what data is being used and shows a small (5 rows) sample of the dataframe.

### Page 2 - Plot 

Provides visual representation of the data with a side bar containing 3 widgets for customization and a main panel containing the plot itself and a short line of text that lets the user know how many different career/job are currently being displayed on the plot. 

The 3 widgets:

* **Show trend** - gives user the option to view the trend line of the scatterplot
* **Select Theme Color** - gives user the option to change the color theme of the plot
* **Select Career(s)** - allows user to select which job/career they would like to include in the plot. 

### Page 3 - Table

This page allows user to look into each individual career and compare the average salary across different variables like experience level or location etc. 
There is a side bar containing 2 widgets for customization and a main panel displaying a data table and a line of text. The line of text reports the amount of data points that the table is pulling from to create summaries, and also displays the range of the salaries within selected career/job.

The 2 widgets: 

* **Select Career** - allow user to pick a job/career to look at
* **Select Option** - allow user to filter out a variable to look at average salary for
