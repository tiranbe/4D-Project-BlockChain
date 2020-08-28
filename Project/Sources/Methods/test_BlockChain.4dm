//%attributes = {}
var blockChain : cs:C1710.BlockChain


blockChain:=cs:C1710.BlockChain.new()

blockChain.push("Block 1")
blockChain.push(2)
blockChain.push(cs:C1710.BlockChain.new())  // yes you can have a blockChain of blockChains :) 

ASSERT:C1129(blockChain.isValid();"Block is Valid")

blockChain.chain[1].data:="2"  // this is tampering 

ASSERT:C1129(blockChain.isValid()=False:C215;"Blockchain no more valid!")

