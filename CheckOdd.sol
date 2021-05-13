// Metadata of "checkodd" was published successfully.

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract CheckOdd {
    function check(uint256 nb) public pure returns (bool) {
        return nb % 2 == 0 ? false : true;
        // "if" est également possible ainsi qu'un autre raccourci
    }
}
