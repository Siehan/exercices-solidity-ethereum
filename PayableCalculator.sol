// Metadata of "payablecalculator" was published successfully.

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

// Pour remix il faut importer une url depuis un repository github
// Depuis un project Hardhat ou Truffle on utiliserait: import "@openzeppelin/ccontracts/utils/Address.sol";

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/Address.sol";

contract PayableCalculator {
    // library usage
    using Address for address payable;

    address private _owner;
    uint256 private _counter;

    event Add(address indexed account, int256 nb1, int256 nb2, int256 res);
    event Mul(address indexed account, int256 nb1, int256 nb2, int256 res);
    event Div(address indexed account, int256 nb1, int256 nb2, int256 res);
    event Sub(address indexed account, int256 nb1, int256 nb2, int256 res);
    event Mod(address indexed account, int256 nb1, int256 nb2, int256 res);

    modifier onlyEnoughtFunds() {
        require(
            msg.value >= 1e15,
            "PayableCalculator: This transaction will cost 1 finney"
        );
        _;
    }

    modifier onlyOwner() {
        require(
            msg.sender == _owner,
            "PayableCalculator: Only owner can call this function"
        );
        _;
    }

    constructor(address owner_) {
        _owner = owner_;
    }

    function withdraw() external onlyOwner {
        payable(msg.sender).sendValue(address(this).balance);
    }

    function add(int256 nb1, int256 nb2)
        public
        payable
        onlyEnoughtFunds
        returns (int256)
    {
        _counter++;
        emit Add(msg.sender, nb1, nb2, nb1 + nb2);
        return nb1 + nb2;
    }

    function mul(int256 nb1, int256 nb2)
        public
        payable
        onlyEnoughtFunds
        returns (int256)
    {
        _counter++;
        emit Mul(msg.sender, nb1, nb2, nb1 * nb2);
        return nb1 * nb2;
    }

    function div(int256 nb1, int256 nb2)
        public
        payable
        onlyEnoughtFunds
        returns (int256)
    {
        require(nb2 != 0, "PayableCalculator: Can not divide digit 0");
        _counter++;
        emit Div(msg.sender, nb1, nb2, nb1 / nb2);
        return nb1 / nb2;
    }

    function sub(int256 nb1, int256 nb2)
        public
        payable
        onlyEnoughtFunds
        returns (int256)
    {
        _counter++;
        emit Sub(msg.sender, nb1, nb2, nb1 - nb2);
        return nb1 - nb2;
    }

    function modulo(int256 nb1, int256 nb2)
        public
        payable
        onlyEnoughtFunds
        returns (int256)
    {
        _counter++;
        emit Mod(msg.sender, nb1, nb2, nb1 % nb2);
        return nb1 % nb2;
    }

    function owner() public view returns (address) {
        return _owner;
    }

    function counter() public view returns (uint256) {
        return _counter;
    }

    function getBalanceOf(address account) public view returns (uint256) {
        return account.balance;
    }
}
