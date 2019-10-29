pragma solidity 0.4.18;

contract StartStop{
    address owner;
    
    bool runningStatus;
    
    function constructor() public {
        owner = msg.sender;
        runningStatus = true;
    }
    
    function stopRunning() external {
        runningStatus = false;
    }
    
    // 20754 gas
    function startRunning1() external {
        if(! runningStatus){
            runningStatus = true;
        }
    }
    
    // 20511 gas
    function startRunning2() external {
        runningStatus = true;
    }
}

