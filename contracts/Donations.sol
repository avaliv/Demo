//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract Donations {
    mapping (address => uint) donators;
    address public owner;
    address public donatAddress;
    
    constructor() {
        owner = msg.sender;
        donatAddress = address(this);
    }

    function getBalanceDonator(address _addr) public view returns(uint) {
        return donators[_addr];
    }

//    function getDonators( ) public view returns(string memory) {
//        donators.length;
//        return donators;
//    }
    
    function withdraw(uint _donat, address _addr) public {
        require(owner == msg.sender && donatAddress.balance > 0, "Rejected");
        address payable receiver = payable( _addr);
        receiver.transfer( _donat);
    }
    
    receive() external payable {
        require(msg.value >= 0, "Rejected");
        donators[msg.sender] += msg.value;
    }

}
