// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.30;

import { Counter } from 'src/Counter.sol';
import { CounterUnitTest } from 'test/unit/Counter/Counter.t.sol';

/**
 * @title SetNumberUnitTest
 * @notice Unit tests for Counter.setNumber().
 * @author 0xBerzerk
 */
contract SetNumberUnitTest is CounterUnitTest {
  function test_WhenTheNewNumberExceedsUint128Max(uint256 _newNumber) external {
    // it should revert with Counter__NumberTooLarge.
    _newNumber = bound(_newNumber, uint256(type(uint128).max) + 1, type(uint256).max);
    vm.expectRevert(Counter.Counter__NumberTooLarge.selector);
    counter.setNumber(_newNumber);
  }

  function test_WhenTheNewNumberIsWithinBounds(uint256 _newNumber) external {
    // it should store the number.
    // it should emit a NumberSet event.
    _newNumber = bound(_newNumber, 0, type(uint128).max);
    vm.expectEmit(address(counter));
    emit Counter.NumberSet(_newNumber);
    counter.setNumber(_newNumber);
    assertEq(counter.number(), _newNumber);
  }
}
