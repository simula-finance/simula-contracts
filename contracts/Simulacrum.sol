// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";

import "./interfaces/IERC20.sol";

contract Simulacrum is Initializable, OwnableUpgradeable, UUPSUpgradeable {
    constructor() initializer {}

    IERC20 HYPR;
    IERC20 simUSD;

    mapping (address => uint) balances;
    mapping (address => uint) debt;

    function initialize() public initializer {
        __Ownable_init();
        __UUPSUpgradeable_init();
    }

    function _authorizeUpgrade(address newImplementation)
        internal
        override
        onlyOwner
    {}

    function setHypr(address _hypr) onlyOwner {
        HYPR = IERC20(_hypr);
    }


    function setSimUSD(address _simUSD) onlyOwner {
        simUSD = IERC20(_simUSD);
    }

    function _computeDebt(uint amount) internal returns (uint _debt) {
        
    }

    function enter(uint _amount) external {
        require(HYPR.balanceOf(msg.sender) >= _amount, "SIMULA: Insufficient Collateral");
        balances[msg.sender] += _amount;
        
    }

    function exit() external {

    }
}
