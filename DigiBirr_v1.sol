// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./DigiBirr.sol";
import "./token/BEP20/BEP20Upgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/AccessControlUpgradeable.sol";

/**
 * @dev {BEP20} token, including:
 *
 *  - Preminted initial supply
 *  - Ability for holders to burn (destroy) their tokens
 *  - No access control mechanism (for minting/pausing) and hence no governance
 *
 *
 * _Available since v3.4._
 */
contract DigiBirr_v1 is DigiBirr {  
    function checkWhitelistRole(address _checker) external view returns (bool) {
        bool authAccount = hasRole(WHITELISTER_ROLE, _checker);
        return authAccount;
    }

    function giveWhitelistRole (address _roleAddress) external onlyRole(DEFAULT_ADMIN_ROLE){
        grantRole(WHITELISTER_ROLE, _roleAddress);
    }    

}