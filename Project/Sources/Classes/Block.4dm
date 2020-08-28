Class constructor
	// Block (data : variant ; previousHash: text)
	
	var $1 : Variant
	var $2 : Text
	
	This:C1470.ID:=Generate UUID:C1066
	This:C1470.timeStamp:=cs:C1710.TimeStamp.new()  // now
	This:C1470.data:=$1
	This:C1470.previousHash:=$2
	This:C1470.nonce:=0  // don't worry about this for now :) 
	This:C1470.hash:=This:C1470.calculateHash()
	
	
Function calculateHash
	// calculates the hash (digest) from the content of the block
	var $0 : Text
	$0:=This:C1470.ID\
		+This:C1470.timeStamp.toString()\
		+JSON Stringify:C1217(This:C1470.data)\
		+This:C1470.previousHash\
		+String:C10(This:C1470.nonce)
	
	$0:=Generate digest:C1147($0;SHA256 digest:K66:4)
	
	
	
	
Function isValid
	// returns true if the hash is valid
	var $0 : Boolean
	$0:=(This:C1470.hash=This:C1470.calculateHash())
	
	// that's is for now...
	// we will come back to mining a block later :) 
	
	
	
	
	