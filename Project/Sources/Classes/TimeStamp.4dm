Class constructor
	// cs.TimeStamp.new()
	// cs.TimeStamp.new(date)
	// cs.TimeStamp.new(date ; time)
	
	var $1 : Date
	var $2 : Time
	
	Case of 
		: (Count parameters:C259=0)
			This:C1470.setDateTime(Current date:C33;Current time:C178)
			
		: (Count parameters:C259=1)
			This:C1470.setDateTime($1;Current time:C178)
			
		: (Count parameters:C259=2)
			This:C1470.setDateTime($1;$2)
			
		Else 
			This:C1470.clear()
	End case 
	
	
Function setDateTime
	// setDateTime (date ; time)
	var $1 : Date
	var $2 : Time
	
	This:C1470.date:=$1
	This:C1470.time:=$2
	
	
Function newDate
	// newDate (day ; month ; year) : cs.TimeStamp
	// like a constructor for creating a new timeStamp instance
	var $1,$day,$2,$month,$3,$year : Integer
	
	$day:=$1
	$month:=$2
	$year:=$3
	
	This:C1470.clear()
	This:C1470.addToDate($year;$month;$day)  // build the date
	
	
Function setDate
	var $1 : Date
	This:C1470.date:=$1
	
	
	
Function setTime
	var $1 : Time
	This:C1470.time:=$1
	
	
	
Function clear
	This:C1470.date:=!00-00-00!
	This:C1470.time:=?00:00:00?
	
	
	
Function addToDate
	// this.addToDate (year ; month; day)
	// wrapper for the 'Add to Date' function
	var $1,$2,$3 : Integer
	This:C1470.date:=Add to date:C393(This:C1470.date;$1;$2;$3)
	
	
	
	
Function addDay
	var $1 : Integer
	If (Count parameters:C259=0)
		This:C1470.addToDate(0;0;1)  // add 1 day
	Else 
		This:C1470.addToDate(0;0;$1)  // add n days
	End if 
	
	
	
	
Function addMonth
	var $1 : Integer
	If (Count parameters:C259=0)
		This:C1470.addToDate(0;1;0)  // add 1 month
	Else 
		This:C1470.addToDate(0;$1;0)  // add n months
	End if 
	
	
	
Function addYear
	var $1 : Integer
	If (Count parameters:C259=0)
		This:C1470.addToDate(1;0;0)  // add 1 year
		This:C1470.addToDate($1;0;0)  // add n years
	End if 
	
	
	
Function isAfter
	// this.isAfter (date) 
	// returns true if date is after this date
	var $1 : cs:C1710.TimeStamp
	var $0 : Boolean  // return 
	
	$0:=(This:C1470.date>$1.date) | ((This:C1470.date=$1.date) & (This:C1470.time>$1.time))
	
	
Function isBefore
	var $1 : cs:C1710.TimeStamp
	var $0 : Boolean
	
	$0:=Not:C34(This:C1470.isAfter($1))
	
	
Function isEqualTo
	var $1 : cs:C1710.TimeStamp
	var $0 : Boolean
	
	$0:=(This:C1470.date=$1.date) & (This:C1470.time=$1.time)
	
	
Function getDate
	var $0 : Date
	$0:=This:C1470.date
	
	
	
Function getTime
	var $0 : Time
	$0:=This:C1470.time
	
	
Function year
	var $0 : Integer
	$0:=Year of:C25(This:C1470.date)
	
	
Function month
	var $0 : Integer
	$0:=Month of:C24(This:C1470.date)
	
	
Function day
	var $0 : Integer
	$0:=Day of:C23(This:C1470.date)
	
	
Function weekDayIndex
	// returns a number from 1 to 7 ; starting from Sunday
	var $0 : Integer
	$0:=Day number:C114(This:C1470.date)
	
	
	
Function toString
	// converts the timestamp to string
	
	var $0 : Text  // return 
	var $1,$format : Integer  // option format (e.g. system date long)
	
	Case of 
		: (Count parameters:C259=1)
			$format:=$1
		Else 
			$format:=System date long:K1:3
	End case 
	
	If (This:C1470.time>0)
		$0:=String:C10(This:C1470.date;$format)+" : "+Time string:C180(Time:C179(This:C1470.time))
		// this.time is an integer
	Else 
		$0:=String:C10(This:C1470.date;$format)  // only display date when time is 0
	End if 
	
	
	
Function iso
	// returns the iso 8601 format string
	var $0 : Text
	$0:=String:C10(This:C1470.date;ISO date GMT:K1:10;Time:C179(This:C1470.time))
	
	
Function rfc
	// returns the RFC 1123 format
	var $0 : Text
	$0:=String:C10(This:C1470.date;Date RFC 1123:K1:11;Time:C179(This:C1470.time))
	
	
	
	