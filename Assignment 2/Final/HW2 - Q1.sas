/*Part a*/
/*Import Data Earth Quake*/
LIBNAME HWDATA 'HWDATA';

DATA HWDATA.earthquakes;
INFILE 'earthquakes.sas7bdat';
INPUT YEAR MONTH DAY STATE MAGNITUDE;
RUN;

PROC SQL;
select * 
from HWDATA.earthquakes
WHERE State = 'Alaska' or State = 'California'
ORDER BY State;
quit;

/*Part b*/
/*Import Data Earth Quake*/
LIBNAME HWDATA 'HWDATA';

DATA HWDATA.earthquakes;
INFILE 'earthquakes.sas7bdat';
INPUT YEAR MONTH DAY STATE MAGNITUDE;
RUN;

ODS CSV FILE = 'E:\Users\nsm190002\Desktop\HWDATA\questionb.csv';

/*Write SQL query to filter selected entries for Year(2002-2011)*/

PROC SQL;
select * 
from HWDATA.earthquakes
WHERE Year BETWEEN 2002 and 2011
ORDER BY Year;
quit;
ODS CSV CLOSE;

/*Use Import Wizard to create a program for importing saved questionsb.csv file*/
PROC IMPORT OUT= HWDATA.QUESTIONB 
            DATAFILE= "E:\Users\nsm190002\Desktop\HWDATA\questionb.csv" 
            DBMS=CSV REPLACE;
     GETNAMES=YES;
     DATAROW=2; 
RUN;

/*Print Statistics*/

PROC MEANS DATA = HWDATA.questionb n mean stddev min p25 median p75 max maxdec=2;
CLASS Year State;
VAR Magnitude;

title'Summary Statistics';
RUN;

/*Part C*/

PROC MEANS DATA = HWDATA.questionb n mean stddev min p25 median p75 max maxdec=2;
CLASS Year State;
VAR Magnitude;
by Year;

title'Summary Statistics';
RUN;

/*Part D*/

PROC TABULATE DATA = HWDATA.questionb;
CLASS Year State;
VAR Magnitude;
/*TABLE  Year*Magnitude,(n mean stddev min p25 median p75 max)*(State);*/
TABLE  (Year)*Magnitude,State*(n mean stddev min p25 median p75 max);
By Year;
title'Summary Statistics';
RUN;

/*Part E*/

/*PROC SGPANEL data = HWDATA.questionb;*/
/*PANELBY State; */
/*SERIES Y=Year X=Magnitude;*/
/*Title'Time Series State/Magnitude';*/
/**/
/*RUN;*/

proc sort data = HWDATA.questionb;
by Year State;
run;

proc means data = HWDATA.questionb mean maxdec=2 noprint;
by Year State;
var Magnitude;
output out = means
mean = AverageMagnitude;
RUN;

PROC SGPANEL data = means;
PANELBY State; 
SERIES Y=Year X=AverageMagnitude;
Title'Time Series State/Magnitude';

RUN;

/*part F*/
/*Test the following null hypothesis: Ågthe average magnitude of earthquakes in California is equal*/
/*to that of AlaskaÅh. */

/*step 1 - Import data*/
PROC IMPORT OUT= HWDATA.questione 
            DATAFILE= "E:\Users\nsm190002\Desktop\HWDATA\questione.csv" 
            DBMS=CSV REPLACE;
     GETNAMES=YES;
     DATAROW=2; 
RUN;
/*step 2 - sort data */
proc sort data = HWDATA.questione;
by Year State;
run;
/*step 3 - create Average Magnitude column*/

proc means data = HWDATA.questione mean maxdec=2 noprint;
by State;
var Magnitude;
output out = meane
mean = AverageMagnitude;
RUN;

/*Step 4 - Perform T-Test*/
proc ttest data = meane H0=0 SIDES=2;
class State;
var AverageMagnitude;
run;
