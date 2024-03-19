// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract Lottery {
    //entities - manager,players and winner
    address public manager;
    address payable[] public players;                                       /*payable keyword allows a function to receive Ether*/    
    address payable public winner;

    constructor(){
        manager = msg.sender;                                               /*msg.sender is a global variable that 
                                                                             refers to the address of the contract caller*/
    }

    function participate() public payable {
        require(msg.value == 1 ether, "Please pay 1 ether only");
        players.push(payable (msg.sender));
    }

    function getBalance() public view returns(uint){
        require(manager==msg.sender, "You are not the sender");
        return address(this).balance;
    }

    function random() internal  view returns (uint){                                               /*keccak256 is a hashing algorithm type casted to uint */
       return uint(keccak256(abi.encodePacked(block.difficulty,block.timestamp,players.length)));  /*abi.encodePacked function is used                                                                                                for simpler and more compact data encoding*/
    }

    function pickWinner() public  {
        require(manager == msg.sender, "You are not the manager");
        require(players.length>3, "Players are less than 3");

        uint r=random();
        uint index = r%players.length;
        winner = players[index];
        winner.transfer(getBalance());
        players = new address payable[](0);             //This will initialize the players array back to 0 for rexecuting

    }
}
