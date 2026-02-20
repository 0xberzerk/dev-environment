// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.30;

/**
 * @title Counter
 * @notice A simple counter contract for demonstrating testing patterns.
 * @author 0xBerzerk
 */
contract Counter {
  /* ////////////////////////////////////////////////
                        State
  ////////////////////////////////////////////////*/
  /**
   * @notice The current stored value.
   */
  uint256 public number;

  /* ////////////////////////////////////////////////
                        Events
  ////////////////////////////////////////////////*/

  /**
   * @notice Emitted when `number` is updated via setNumber.
   * @param _newNumber The new value stored.
   */
  event NumberSet(uint256 indexed _newNumber);
  /* ////////////////////////////////////////////////
                        Errors
  ////////////////////////////////////////////////*/

  /**
   * @notice Reverts when `_newNumber` exceeds the uint128 maximum.
   */
  error Counter__NumberTooLarge();

  /* ////////////////////////////////////////////////
                       Functions
  ////////////////////////////////////////////////*/

  /**
   * @notice Sets `number` to a new value.
   * @param _newNumber The value to store. Must be <= uint128 max.
   */
  function setNumber(uint256 _newNumber) public {
    if (_newNumber > type(uint128).max) revert Counter__NumberTooLarge();
    number = _newNumber;
    emit NumberSet(_newNumber);
  }

  /**
   * @notice Increments `number` by one.
   */
  function increment() public {
    ++number;
  }
}
