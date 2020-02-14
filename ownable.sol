pragma solidity ^0.4.18;
contract Ownable {
    address public owner;


    constructor() public {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msgpragma solidity ^0.4.18;
contract Ownable {
    address public owner;


    constructor() public {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }
}

.sender == owner);
        _;
    }
}

