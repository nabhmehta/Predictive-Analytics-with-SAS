/*Question 3 - Part a*/
DATA Hotel;
	INFILE 'E:\Users\nsm190002\Desktop\Assignments\Hotel.dat';
	INPUT roomno guestnum checkinmonth  
	  checkinday checkinyr
	  checkoutmonth checkoutday checkoutyr
	  wifiuse  wifidays roomtype roomrate;
	LABEL 	roomno = 'Room No.'
			guestnum = 'Number of Guests'
			checkinmonth = 'Check-in Month'
			checkinday = 'Check-in Day'
			checkinyr = 'Check-in Year'
			checkoutmonth = 'Check-out Month'
			checkoutday = 'Check-out Day'
			checkoutyr = 'Check-out Year'
			wifiuse = 'Use of WiFi Service'
			wifidays = 'Number of days of Internet Use'
			roomtype = 'Room Type'
			roomrate = 'Room Rate';


RUN;
PROC PRINT DATA = Hotel;
TITLE 'SAS Data Set Hotel Report';
RUN;

/*Question 3 - Part b*/
DATA Hotel;
	INFILE 'E:\Users\nsm190002\Desktop\Assignments\Hotel.dat';
	INPUT roomno guestnum checkinmonth  
	  checkinday checkinyr
	  checkoutmonth checkoutday checkoutyr
	  wifiuse  wifidays roomtype roomrate;

	LABEL 	roomno = 'Room No.'
			guestnum = 'Number of Guests'
			checkinmonth = 'Check-in Month'
			checkinday = 'Check-in Day'
			checkinyr = 'Check-in Year'
			checkoutmonth = 'Check-out Month'
			checkoutday = 'Check-out Day'
			checkoutyr = 'Check-out Year'
			wifiuse = 'Use of WiFi Service'
			wifidays = 'Number of days of Internet Use'
			roomtype = 'Room Type'
			roomrate = 'Room Rate'
			checkindate = 'Check-In Date'
			checkoutdate = 'Check-Out Date';
	checkindatstr	 = catx('/',checkinmonth,checkinday,checkinyr);
	checkoutdatestr = catx('/',checkoutmonth,checkoutday,checkoutyr);
	
	checkindate = INPUT(checkindatstr,ANYDTDTE32.);
	checkoutdate = INPUT(checkoutdatestr,ANYDTDTE32.);
	INFORMAT checkindate MMDDYY8.;
	INFORMAT checkoutdate MMDDYY8.;
	
RUN;
PROC PRINT DATA = Hotel;
TITLE 'SAS Data Set Hotel Report';
RUN;

/*Question 3 - Part c*/
DATA Hotel;
	INFILE 'E:\Users\nsm190002\Desktop\Assignments\Hotel.dat';

	INPUT roomno guestnum checkinmonth  
	  checkinday checkinyr
	  checkoutmonth checkoutday checkoutyr
	  wifiuse  wifidays roomtype roomrate;

	checkindatstr	= catx('/',checkinmonth,checkinday,checkinyr);
	checkoutdatestr = catx('/',checkoutmonth,checkoutday,checkoutyr);
	
	checkindate = INPUT(checkindatstr,ANYDTDTE32.);
	checkoutdate = INPUT(checkoutdatestr,ANYDTDTE32.);

	INFORMAT checkindate MMDDYY8.;
	INFORMAT checkoutdate MMDDYY8.;
	
	IF guestnum > 1
	THEN subtotal = (roomrate*(checkoutdate-checkindate))+((guestnum-1)*10)+(9.95+(4.95*(checkoutdate-checkindate)));

	ELSE IF guestnum = 1
	THEN subtotal = (roomrate*(checkoutdate-checkindate))+(9.95+(4.95*(checkoutdate-checkindate)));

	LABEL 	roomno = 'Room No.'
			guestnum = 'Number of Guests'
			checkinmonth = 'Check-in Month'
			checkinday = 'Check-in Day'
			checkinyr = 'Check-in Year'
			checkoutmonth = 'Check-out Month'
			checkoutday = 'Check-out Day'
			checkoutyr = 'Check-out Year'
			wifiuse = 'Use of WiFi Service'
			wifidays = 'Number of days of Internet Use'
			roomtype = 'Room Type'
			roomrate = 'Room Rate'
			checkindate = 'Check-In Date'
			checkoutdate = 'Check-Out Date'
			subtotal = 'Sub Total';

RUN;
PROC PRINT DATA = Hotel;
TITLE 'SAS Data Set Hotel Report';
RUN;

/*Question 3 - Part d*/
DATA Hotel;
	INFILE 'E:\Users\nsm190002\Desktop\Assignments\Hotel.dat';

	INPUT roomno guestnum checkinmonth  
	  checkinday checkinyr
	  checkoutmonth checkoutday checkoutyr
	  wifiuse  wifidays roomtype roomrate;

	checkindatstr	= catx('/',checkinmonth,checkinday,checkinyr);
	checkoutdatestr = catx('/',checkoutmonth,checkoutday,checkoutyr);
	
	checkindate = INPUT(checkindatstr,ANYDTDTE32.);
	checkoutdate = INPUT(checkoutdatestr,ANYDTDTE32.);

	INFORMAT checkindate MMDDYY8.;
	INFORMAT checkoutdate MMDDYY8.;
	
	IF guestnum > 1
	THEN subtotal = (roomrate*(checkoutdate-checkindate))+((guestnum-1)*10)+(9.95+(4.95*(checkoutdate-checkindate)));

	ELSE IF guestnum = 1
	THEN subtotal = (roomrate*(checkoutdate-checkindate))+(9.95+(4.95*(checkoutdate-checkindate)));
	
	grandtotal = ROUND(subtotal*(1+0.775),.2);

	LABEL 	roomno = 'Room No.'
			guestnum = 'Number of Guests'
			checkinmonth = 'Check-in Month'
			checkinday = 'Check-in Day'
			checkinyr = 'Check-in Year'
			checkoutmonth = 'Check-out Month'
			checkoutday = 'Check-out Day'
			checkoutyr = 'Check-out Year'
			wifiuse = 'Use of WiFi Service'
			wifidays = 'Number of days of Internet Use'
			roomtype = 'Room Type'
			roomrate = 'Room Rate'
			checkindate = 'Check-In Date'
			checkoutdate = 'Check-Out Date'
			subtotal = 'Sub Total'
			grandtotal = 'Grand Total';

RUN;
PROC PRINT DATA = Hotel;
TITLE 'SAS Data Set Hotel Report';
RUN;
