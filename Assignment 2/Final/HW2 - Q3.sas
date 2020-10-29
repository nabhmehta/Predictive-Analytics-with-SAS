/*part b*/
proc contents data = HWDATA.Vite;
Title'VITE Data Content desciption';
run;


proc transpose data = HWDATA.Vite out= wide1 prefix = Visit;
by ID Treatment;
id Visit;
var Plaque;
run;

ODS CSV FILE = 'E:\Users\nsm190002\Desktop\HWDATA\question3c.csv';
proc print data = wide1;
title'Vite transposed';
run;
ODS CSV CLOSE;

/*part c*/
/*Import file from part b*/
PROC IMPORT OUT= HWDATA.QUESTION3c1 
            DATAFILE= "E:\Users\nsm190002\Desktop\HWDATA\question3c1.csv" 
            DBMS=CSV REPLACE;
     GETNAMES=YES;
     DATAROW=2; 
RUN;

proc ttest data = HWDATA.Question3c1;
paired Visit0*Visit2;
title'Treatment Analysis 3c';
run;

/*part d*/
PROC IMPORT OUT= HWDATA.QUESTION3d 
            DATAFILE= "E:\Users\nsm190002\Desktop\HWDATA\question3d.csv" 
            DBMS=CSV REPLACE;
     GETNAMES=YES;
     DATAROW=2; 
RUN;

proc ttest data = HWDATA.Question3d;
paired Visit0*Visit2;
title'Treatment Analysis 3d';
run;

/*print f*/
/*test 1*/
proc ttest data = HWDATA.Vite;
paired Alcohol*Smoke;
title'Paired T-Test Alcohol/Smoke';
run;
/*test 2*/
proc sgplot data = HWDATA.Vite;
hbox Alcohol /Category = Visit group=Treatment;
title'Alcohol Consumption';
RUN;

proc sgplot data = HWDATA.Vite;
hbox Smoke /Category = Visit group=Treatment;
title'Cigerrete Consumption';
RUN;
