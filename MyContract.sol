pragma solidity 0.4.18;

contract MyContract{
    address owner;
    
    function constructor() public {
        owner = msg.sender;
    }
    
    function onlyCompute() external pure returns(uint8 result){
        return 3+3;
    }
}

