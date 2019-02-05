pragma solidity 0.4.22;

contract MyContract{
    address owner;
    
    function constructor() public {
        owner = msg.sender;
    }
}

