//%attributes = {}
// isValidEmoji
// returns an emoji if the Block or Blockchain is valid

var $1 : Object
var $0 : Text

If ((OB Instance of:C1731($1;cs:C1710.Block)) | (OB Instance of:C1731($1;cs:C1710.BlockChain)))
	If ($1.isValid())
		$0:="✅"
	Else 
		$0:="❌"
	End if 
Else 
	$0:=""
End if 