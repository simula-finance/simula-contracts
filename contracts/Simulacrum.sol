// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";

import "./interfaces/IERC20.sol";

contract Simulacrum is Initializable, OwnableUpgradeable, UUPSUpgradeable {
    constructor() initializer {}

    IERC20 public HYPR;
    IERC20 public simUSD;

    mapping(address => uint256) balances;
    mapping(address => uint256) debt;

    function initialize() public initializer {
        __Ownable_init();
        __UUPSUpgradeable_init();
    }

    function _authorizeUpgrade(address newImplementation)
        internal
        override
        onlyOwner
    {

    }

    function setHypr(address _hypr) onlyOwner external {
        HYPR = IERC20(_hypr);
    }

    function setSimUSD(address _simUSD) onlyOwner external {
        simUSD = IERC20(_simUSD);
    }

    function _computeDebt(uint256 amount) internal returns (uint256 _debt) {
        // use oracle to compute the debt to be issued
        

    }

    function enter(uint256 _amount) external {
        require(
            HYPR.balanceOf(msg.sender) >= _amount,
            "SIMULA: Insufficient Collateral"
        );
        
    }

    function exit() external {}
}
