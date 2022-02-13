// SPDX-License-Identifier: UNLICESEND
pragma solidity ^0.8.7;

contract ExchangerCreator {

    uint256 public exchangerCount = 0;
    mapping(uint => Exchanger) internal hospitals;
    address owner;

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    struct Exchanger {
        uint _id;
        string _name;
    }

    constructor() {
        owner = msg.sender;
    }

    function addExchanger(string memory _name) public onlyOwner {
        exchangerCount++;
        hospitals[exchangerCount] = Exchanger(exchangerCount, _name);

    }

}