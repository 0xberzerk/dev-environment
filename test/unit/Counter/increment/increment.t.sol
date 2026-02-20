// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.30;

import { CounterUnitTest } from 'test/unit/Counter/Counter.t.sol';

/**
 * @title IncrementUnitTest
 * @notice Unit tests for Counter.increment().
 * @author 0xBerzerk
 */
contract IncrementUnitTest is CounterUnitTest {
  modifier givenTheNumberIsZero() {
    assertEq(counter.number(), 0);
    _;
  }

  modifier givenTheNumberIsNotZero(uint256 _startingNumber) {
    _startingNumber = bound(_startingNumber, 1, type(uint128).max - 1);
    counter.setNumber(_startingNumber);
    _;
  }

  function test_GivenTheNumberIsZero() external givenTheNumberIsZero {
    // it should set number to one.
    counter.increment();
    assertEq(counter.number(), 1);
  }

  function test_GivenTheNumberIsNotZero(uint256 _startingNumber) external givenTheNumberIsNotZero(_startingNumber) {
    // it should increment by one.
    uint256 numberBefore = counter.number();
    counter.increment();
    assertEq(counter.number(), numberBefore + 1);
  }
}
