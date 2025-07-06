// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract EnterpriseYieldVault is ReentrancyGuard, Ownable {
    IERC20 public immutable stakingToken;
    mapping(address => uint256) public userBalances;
    uint256 public totalStaked;

    event Deposited(address indexed user, uint256 amount);
    event Withdrawn(address indexed user, uint256 amount);

    constructor(address _token) {
        stakingToken = IERC20(_token);
    }

    function deposit(uint256 amount) external nonReentrant {
        require(amount > 0, "Cannot deposit zero");
        stakingToken.transferFrom(msg.sender, address(this), amount);
        userBalances[msg.sender] += amount;
        totalStaked += amount;
        emit Deposited(msg.sender, amount);
    }

    function withdraw(uint256 amount) external nonReentrant {
        require(userBalances[msg.sender] >= amount, "Insufficient balance");
        userBalances[msg.sender] -= amount;
        totalStaked -= amount;
        stakingToken.transfer(msg.sender, amount);
        emit Withdrawn(msg.sender, amount);
    }
}

// Hash 4470
// Hash 3743
// Hash 9919
// Hash 3107
// Hash 7970
// Hash 6883
// Hash 5227
// Hash 4419
// Hash 2506
// Hash 5834
// Hash 4599
// Hash 3890
// Hash 7448
// Hash 3889
// Hash 4304
// Hash 9114
// Hash 4981
// Hash 7466
// Hash 7280
// Hash 3374
// Hash 4248
// Hash 9227
// Hash 6641
// Hash 1405
// Hash 7308
// Hash 8206
// Hash 4986
// Hash 9690
// Hash 8387
// Hash 1089
// Hash 5074
// Hash 1546
// Hash 2322
// Hash 1611
// Hash 5039
// Hash 2871
// Hash 7529
// Hash 8930
// Hash 8142
// Hash 6987
// Hash 6578
// Hash 7735
// Hash 1458
// Hash 4288
// Hash 1580
// Hash 8360
// Hash 4605
// Hash 5740
// Hash 1891
// Hash 1945
// Hash 8627
// Hash 4435
// Hash 2432
// Hash 5070
// Hash 2594
// Hash 1849
// Hash 9981
// Hash 4933
// Hash 4098
// Hash 3299
// Hash 4489
// Hash 6372
// Hash 8602
// Hash 1300
// Hash 3687
// Hash 6682
// Hash 7787
// Hash 7769
// Hash 7163
// Hash 6207
// Hash 9973
// Hash 4144
// Hash 1025
// Hash 4717
// Hash 2117
// Hash 3736
// Hash 9683
// Hash 3573
// Hash 5249
// Hash 5183
// Hash 4618
// Hash 1453
// Hash 8898
// Hash 6875
// Hash 4602
// Hash 7743
// Hash 2589
// Hash 1066
// Hash 5107
// Hash 9688
// Hash 7362
// Hash 3086
// Hash 4597
// Hash 1833
// Hash 2873
// Hash 6409
// Hash 6263
// Hash 4364
// Hash 2550
// Hash 3323
// Hash 2912
// Hash 3403
// Hash 2824
// Hash 6421
// Hash 1590
// Hash 2306
// Hash 6479
// Hash 7432
// Hash 7069
// Hash 8852
// Hash 9929
// Hash 1767
// Hash 2407
// Hash 4993
// Hash 3542
// Hash 5024
// Hash 2257
// Hash 2017
// Hash 8863