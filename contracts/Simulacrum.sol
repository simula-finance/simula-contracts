// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";

contract Simulacrum is Initializable, OwnableUpgradeable, UUPSUpgradeable {
    constructor() initializer {}

    address HYPR;
    address simUSD;

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
        HYPR = _hypr;
    }

    function setSimUSD() onlyOwner {
        
    }

    function enter(uint amount) external {}
}
