LIBNAME HWDATA 'HWDATA';

DATA HWDATA.study_gpa;
INFILE 'study_gpa.sas7bdat';
RUN;

/*part a*/
proc sgplot data = HWDATA.study_gpa;
histogram AveTime / binstart = 0 binwidth = 5;
density AveTime;
density AveTime / type = kernel;
title'Study Hours Devoted';
run;

/*part b*/

ODS CSV FILE = 'E:\Users\nsm190002\Desktop\HWDATA\question2b.csv';

/*Write SQL query to filter selected entries for section '02'*/

PROC SQL;
select * 
from HWDATA.study_gpa
WHERE Section eq '02';
quit;
ODS CSV CLOSE;

/*Use Import Wizard to create a program for importing saved questionsb.csv file*/
PROC IMPORT OUT= HWDATA.QUESTION2B1 
            DATAFILE= "E:\Users\nsm190002\Desktop\HWDATA\question2b1.csv" 
            DBMS=CSV REPLACE;
     GETNAMES=YES;
     DATAROW=2; 
RUN;

proc corr data=HWDATA.QUESTION2B1 plots=matrix(histogram);
var Units AveTime GPA;
title 'Correlation Units/AveTime/GPA';
run;

