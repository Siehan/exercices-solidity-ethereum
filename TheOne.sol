// 0x58d261dbaDfFfF47cf4481A0553caDF13529F223

/*
Ecrivez un contrat TheOne.
Ce contrat devra posséder une fonction one qui retournera le nombre 1 lorsqu'elle sera appelée.
*/

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract TheOne {
    function one() public pure returns (uint256) {
        return 1;
    }
}
