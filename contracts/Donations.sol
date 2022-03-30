//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract Donations {
    address[] donators;
    mapping (address => uint) donat;
    address public owner;
    
    constructor() {
        owner = msg.sender;
    }

    function getBalanceDonator(address _addr) public view returns(uint) {
        return donat[_addr];
    }

    function getDonators( ) public view returns(address[] memory) {
        return donators;
    }
    
    function withdraw(uint _donat, address _addr) public {
        require(owner == msg.sender && address(this).balance > 0, "Rejected ");
        address payable receiver = payable( _addr);
        receiver.transfer( _donat);
    }
    
    receive() external payable {
        require(msg.value > 0, "Rejected");
        donat[msg.sender] += msg.value;
        donators.push(msg.sender);
    }

}
