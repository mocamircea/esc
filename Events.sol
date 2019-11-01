pragma solidity 0.4.18;

contract Events{
    address owner;
    
    event LogSum(address indexed sender, uint8 val1, uint8 val2);
    event LogSubtract(address indexed sender, uint8 val1, uint8 val2);
    
    function constructor() public {
        owner = msg.sender;
    }
    
    // 1956 gas
    function sum1(uint8 lval, uint8 rval) external returns(uint8 result){
        uint8 resultsum = lval+rval;
        LogSum(msg.sender, lval, rval);
        
        return resultsum;
    }
    
    // 1965 gas
    function sum2(uint8 lval, uint8 rval) external returns(uint8 result){
        LogSum(msg.sender, lval, rval);
        
        return lval+rval;  // more expensive to calculate directly in the returned value <-> to using additional stack variable
    }
    
    function sub(uint8 lval, uint8 rval) external returns(uint8 result){
        uint8 resultsub = lval-rval;
        LogSubtract(msg.sender, lval, rval);
        
        return resultsub;
    }
    
}
