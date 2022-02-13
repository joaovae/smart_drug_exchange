// SPDX-License-Identifier: UNLICESEND
pragma solidity ^0.8.7;

import "./exchanger_creator.sol";

contract MedExchanger is ExchangerCreator{

    event NewMed(uint medId, uint gri, string name, uint value);

    struct Med {

        string name;
        uint gri;
        uint value;
    }

    Med[] public medicines;

    mapping (uint => address) public medToOwner;

    function _createMed(string memory name, uint gri, uint value) public {
    medicines.push(Med(name, gri, value));
    uint medId = medicines.length - 1;
    medToOwner[medId] = msg.sender;
    emit NewMed(medId, gri, name, value);
    }
}
