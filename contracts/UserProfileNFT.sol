// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract UserProfileNFT is ERC721, Ownable {
    uint256 public nextTokenId;
    mapping(address => uint256) public profiles;

    constructor() ERC721("UserProfileNFT", "UPNFT") {}

    function createProfile() external {
        require(profiles[msg.sender] == 0, "Profile already exists");
        uint256 tokenId = nextTokenId;
        _mint(msg.sender, tokenId);
        profiles[msg.sender] = tokenId;
        nextTokenId++;
    }
}
