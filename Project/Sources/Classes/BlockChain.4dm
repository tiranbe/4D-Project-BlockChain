
Class constructor
	This:C1470.chain:=New collection:C1472
	This:C1470.chain.push(This:C1470.createGenesisBlock())  // add the first block to the chain
	
	
Function createGenesisBlock
	// creates the first Block in the chain
	var $0 : cs:C1710.Block
	$0:=cs:C1710.Block.new("Genesis Block";"")  // previousHash is empty string
	
	
Function getLastBlock
	// function getLastBlock() : cs.Block
	// returns the last Block in the chain
	
	var $0 : cs:C1710.Block
	$0:=This:C1470.chain[This:C1470.chain.length-1]  // this.chain is a collection so we deduct 1 from the index
	
	
	
Function push
	// function push ( data: variant) 
	// adds a data to the chain ; any type of data 
	var $1 : Variant
	var $newBlock;$lastBlock : cs:C1710.Block
	
	$lastBlock:=This:C1470.getLastBlock()
	$newBlock:=cs:C1710.Block.new($1;$lastBlock.hash)  // creates a new Block 
	// push the block in the chain
	
	This:C1470.chain.push($newBlock)
	
	
Function isValid
	// function isValid() : boolean
	// returns true if the BlockChain is valid ; (has not been tampered with)
	
	var $0 : Boolean
	
	If (This:C1470.chain.length=1)  // only has the genesis block
		$0:=This:C1470.chain[0].isValid()
	Else 
		// if the chain has more than 1 blocks
		var i : Integer
		$0:=True:C214
		
		For (i;1;This:C1470.chain.length-1)
			$0:=$0 & \
				(This:C1470.chain[i].isValid()) & \
				(This:C1470.chain[i].previousHash=This:C1470.chain[i-1].calculateHash())
		End for 
		
	End if 
	
	
	
	