pragma solidity ^0.8.4;

contract charity {
    uint count;
    string nameOfChaity;
    string description;
    uint target;
    
    function Charity(string memory name, string memory des,uint tar) public {
        nameOfChaity = name;
        description = des;
        target = tar;
    }
    function donate() public payable {
        count++;
    }
    function getSummary() public view returns(uint,string memory,string memory,uint,uint){
        return(
            count,nameOfChaity,description,target,address(this).balance    
        );
    }
}
