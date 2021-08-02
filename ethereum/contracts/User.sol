pragma solidity ^0.4.17;

contract User {
    address[] public deployedPosts;
    mapping(address=>bool) public Followers;
    uint FollowersCount;
    string username;
    
    function User(string name) public{
        username = name;
    }
    
    function creatPost(string memory name,string memory description,uint target) public {
    address newPosts = new Post(name,description,target,msg.sender);
    deployedPosts.push(newPosts);    
    }

    function follow() public {
        if(!Followers[msg.sender]){
            FollowersCount++;
            Followers[msg.sender] = true;    
        }
        else{
            Followers[msg.sender] = false;
            FollowersCount--;
        }
    }
    
    function getPosts() view public returns(address[]) {
        return deployedPosts;
    }
    
    function getUserSummary() view public returns(string,uint,uint){
        return(
            username,
            FollowersCount,
            deployedPosts.length
        );
    }
}

contract Post {
    uint likes;
    string title;
    string description;
    uint target;
    address manager;
    mapping(address=>bool) likers;
    
    function Post(string memory name, string memory des,uint tar,address creator) public {
        title = name;
        description = des;
        target = tar;
        manager = creator;
    }
    
    function support() public payable {
        require(msg.value > 0);
    }
    
    function like() public {
        if(!likers[msg.sender]){
            likes++;
            likers[msg.sender] = true;    
        }
        else{
            likers[msg.sender] = false;
            likes--;
        }
    }
    
    function getSummary() public view returns(uint,string memory,string memory,uint,uint,address){
        return(
            likes,
            title,
            description,
            target,
            this.balance,
            manager   
        );
    }
}
