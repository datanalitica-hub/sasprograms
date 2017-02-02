%macro respaldaFecha (intableName, outtableName, _inLib, _outLib);

	%let rundt = '';

	data _null_;
		tempdate=put(today(),yymmddn8.);
		call symput("rundt",tempdate);
	run;

	%let table_name = &_outLib..&outtableName._&rundt;
        %put ** Se creara tabla	 &table_name;

	data &table_name;
	  set &_inLib..&intableName.;
	run;

%mend;
