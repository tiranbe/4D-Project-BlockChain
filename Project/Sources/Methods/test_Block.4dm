//%attributes = {}
var block1,block2,block3 : cs:C1710.Block
var chain : Collection

block1:=cs:C1710.Block.new("Block 1";"")
block2:=cs:C1710.Block.new("Block 2";block1.hash)
block3:=cs:C1710.Block.new("Block 3";block2.hash)

chain:=New collection:C1472

chain.push(block1)
chain.push(block2)
chain.push(block3)

ASSERT:C1129(block1.isValid();"Block is valid")
ASSERT:C1129(block2.isValid();"Block is valid")
ASSERT:C1129(block3.isValid();"Block is valid")

block1.data:="Block One"  // mutate the data
ASSERT:C1129(block1.isValid()=False:C215;"Block is invalid")

block1.hash:=block1.calculateHash()  // recalc the hash
ASSERT:C1129(block1.isValid();"Block 1 is valid again")

