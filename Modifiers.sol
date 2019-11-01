pragma solidity 0.4.18;

contract Modifiers{
    address addrOwner;
    bool bIsRunning;
    
    event LogCtrStart(address addrSender, address addrOwner);
    event LogCtrStop(address addrSender);
    event LogCheckIfRunning(address addrSender, bool bRunningStatus);
    
    modifier onlyIfOwner{
        LogCtrStart(msg.sender, addrOwner);
        require(msg.sender == addrOwner);
        _;
    }
    
    function Modifiers() public {
        addrOwner = msg.sender;
        bIsRunning = true;
    }
    
    // Is contract running
    function isCrtRunning() external returns(bool bRunningStatus){
        LogCheckIfRunning(msg.sender, bIsRunning);
        
        return bIsRunning;
    }
    
    // Can't use unconditional Logging when using guard
    function startCtr() external onlyIfOwner{
        bIsRunning = true;
    }
    
    function stopCtr() external onlyIfOwner  {
        bIsRunning = false;
    }
    
    // Without guard
    function startCtr_2() external returns(bool bSuccess) {
        LogCtrStart(msg.sender,addrOwner);
        bool bRet = false;
        
        if(msg.sender == addrOwner){
            bIsRunning = true;
            bRet = true;
        }
        
        return bRet;
    }   
}
