pragma solidity ^0.5.1;

contract Election {
	
	struct Canditdate {
	uint id;
	string name;
	uint voteCount;
	}
	uint public candidatesCount;
	mapping(address => bool) public voters;
	mapping(uint => Canditdate) public canditdates;
	//construcor
	 constructor() public{
	addCanditdate("lili");
	addCanditdate("punny");
	}

	function addCanditdate (string memory _name) private {
	candidatesCount++;
	canditdates[candidatesCount] = Canditdate(candidatesCount, _name, 0);
	}

	function vote(uint _candidateId) public {
		require(!voters[msg.sender]);
		require(_candidateId>0 && _candidateId <= candidatesCount);
		voters[msg.sender] = true;
		canditdates[_candidateId].voteCount++;
	}


}