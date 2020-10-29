
/*Question 1*/
/*Part b*/
DATA SwineFlu2009;
	INFILE 'E:\Users\nsm190002\Desktop\Assignments\SwineFlu2009.dat';
	INPUT CaseByDATE ByContinentCase Country $35.  
	  DateOfFirstCaseRep ANYDTDTE32. CummCasesRepApr 
	  CummCasesRepMay CummCasesRepJun CummCasesRepJul 
	  CummCasesRepAug LastReported ByDateDeath ANYDTDTE32. ByContinentDeath 
	  CummDeathsMay CummDeathsJun CummDeathsJul CummDeathsAug 
	  CummDeathsSep CummDeathsOct;

RUN;
PROC PRINT DATA = SwineFlu2009;
TITLE 'SAS Data Set WHO Swine FLU 2009 Report';
RUN;

/*Part d*/
/*INFORMAT function not working here*/
DATA SwineFlu2009;
	INFILE 'E:\Users\nsm190002\Desktop\Assignments\SwineFlu2009.dat';
	INPUT CaseByDATE ByContinentCase Country $35.  
	  DateOfFirstCaseRep ANYDTDTE32. CummCasesRepApr 
	  CummCasesRepMay CummCasesRepJun CummCasesRepJul 
	  CummCasesRepAug LastReported ByDateDeath ANYDTDTE32. ByContinentDeath 
	  CummDeathsMay CummDeathsJun CummDeathsJul CummDeathsAug 
	  CummDeathsSep CummDeathsOct;

	INFORMAT DateOfFirstCaseRep MMDDYY8.;
	
	DateOfFirstCaseRepSAS = INPUT(DateOfFirstCaseRep,ANYDTDTE32.);
	ByDateDeathSAS = INPUT(ByDateDeath,ANYDTDTE32.);
	INFORMAT DateOfFirstCaseRepSAS MMDDYY8.;
	INFORMAT ByDateDeathSAS MMDDYY8.;
RUN;
PROC PRINT DATA = SwineFlu2009;
TITLE 'SAS Data Set WHO Swine FLU 2009 Report';
RUN;

/*Part e*/
DATA SwineFlu2009;
	INFILE 'E:\Users\nsm190002\Desktop\Assignments\SwineFlu2009.dat';
	INPUT CaseByDATE ByContinentCase Country $35.  
	  DateOfFirstCaseRep ANYDTDTE32. CummCasesRepApr 
	  CummCasesRepMay CummCasesRepJun CummCasesRepJul 
	  CummCasesRepAug LastReported ByDateDeath ANYDTDTE32. ByContinentDeath 
	  CummDeathsMay CummDeathsJun CummDeathsJul CummDeathsAug 
	  CummDeathsSep CummDeathsOct;

	LABEL 	CaseByDATE = 'First Case date'
		ByContinentCase = 'First Case within a Continent'
		Country = 'Country'
		DateOfFirstCaseRep = 'Date First Case Reported'
		CummCasesRepApr = 'Cummulative Cases Reported on First Day - April'
		CummCasesRepMay = 'Cummulative Cases Reported on First Day - May'
		CummCasesRepJun = 'Cummulative Cases Reported on First Day - June'
		CummCasesRepJul = 'Cummulative Cases Reported on First Day - July'
		CummCasesRepAug = 'Cummulative Cases Reported on First Day - August'
		LastReported = 'Last Reported Cummulative Cases'
		ByDateDeath = 'First Death by Continent'
		CummDeathsMay = 'Cummulative Death Reported on First Day - May'
		CummDeathsJun = 'Cummulative Death Reported on First Day - June'
		CummDeathsJul = 'Cummulative Death Reported on First Day - July'
		CummDeathsAug = 'Cummulative Death Reported on First Day - August'
		CummDeathsSep = 'Cummulative Death Reported on First Day - September'
		CummDeathsOct = 'Cummulative Death Reported on First Day - October'
		DateOfFirstCaseRepSAS = 'Date First Case Reported(SAS)'
		ByDateDeathSAS = 'First Death by Continent(SAS)';
	
	
		DateOfFirstCaseRepSAS = INPUT(DateOfFirstCaseRep,ANYDTDTE32.);
		ByDateDeathSAS = INPUT(ByDateDeath,ANYDTDTE32.);
		INFORMAT DateOfFirstCaseRepSAS MMDDYY8.;
		INFORMAT ByDateDeathSAS MMDDYY8.;

RUN;
PROC PRINT DATA = SwineFlu2009;
TITLE 'SAS Data Set WHO Swine FLU 2009 Report';
RUN;
/*Part F*/
DATA SwineFlu2009;
	INFILE 'E:\Users\nsm190002\Desktop\Assignments\SwineFlu2009.dat';
	INPUT CaseByDATE ByContinentCase Country $35.  
	  DateOfFirstCaseRep ANYDTDTE32. CummCasesRepApr 
	  CummCasesRepMay CummCasesRepJun CummCasesRepJul 
	  CummCasesRepAug LastReported ByDateDeath ANYDTDTE32. ByContinentDeath 
	  CummDeathsMay CummDeathsJun CummDeathsJul CummDeathsAug 
	  CummDeathsSep CummDeathsOct;

	LABEL 	CaseByDATE = 'First Case date'
		ByContinentCase = 'First Case within a Continent'
		Country = 'Country'
		DateOfFirstCaseRep = 'Date First Case Reported'
		CummCasesRepApr = 'Cummulative Cases Reported on First Day - April'
		CummCasesRepMay = 'Cummulative Cases Reported on First Day - May'
		CummCasesRepJun = 'Cummulative Cases Reported on First Day - June'
		CummCasesRepJul = 'Cummulative Cases Reported on First Day - July'
		CummCasesRepAug = 'Cummulative Cases Reported on First Day - August'
		LastReported = 'Last Reported Cummulative Cases'
		ByDateDeath = 'First Death by Continent'
		CummDeathsMay = 'Cummulative Death Reported on First Day - May'
		CummDeathsJun = 'Cummulative Death Reported on First Day - June'
		CummDeathsJul = 'Cummulative Death Reported on First Day - July'
		CummDeathsAug = 'Cummulative Death Reported on First Day - August'
		CummDeathsSep = 'Cummulative Death Reported on First Day - September'
		CummDeathsOct = 'Cummulative Death Reported on First Day - October'
		DateOfFirstCaseRepSAS = 'Date First Case Reported(SAS)'
		ByDateDeathSAS = 'First Death by Continent(SAS)';
	
	
		DateOfFirstCaseRepSAS = INPUT(DateOfFirstCaseRep,ANYDTDTE32.);
		ByDateDeathSAS = INPUT(ByDateDeath,ANYDTDTE32.);
		INFORMAT DateOfFirstCaseRepSAS MMDDYY8.;
		INFORMAT ByDateDeathSAS MMDDYY8.;

RUN;
PROC CONTENTS DATA = SwineFlu2009;
TITLE 'SAS Data Set WHO Swine FLU 2009 Report';
RUN;
