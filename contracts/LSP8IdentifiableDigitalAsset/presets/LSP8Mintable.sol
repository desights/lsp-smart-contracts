// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

// interfaces
import {ILSP8Mintable} from "./ILSP8Mintable.sol";

// modules
import {
    LSP8IdentifiableDigitalAsset
} from "../LSP8IdentifiableDigitalAsset.sol";

/**
 * @title LSP8IdentifiableDigitalAsset deployable preset contract with a public {mint} function callable only by the contract {owner}.
 */
contract LSP8Mintable is LSP8IdentifiableDigitalAsset, ILSP8Mintable {
    /**
     * @notice Deploying a `LSP8Mintable` token contract with: token name = `name_`, token symbol = `symbol_`, and
     * address `newOwner_` as the token contract owner.
     *
     * @param name_ The name of the token.
     * @param symbol_ The symbol of the token.
     * @param newOwner_ The owner of the token contract.
     */
    constructor(
        string memory name_,
        string memory symbol_,
        address newOwner_
    ) LSP8IdentifiableDigitalAsset(name_, symbol_, newOwner_) {}

    /**
     * @dev Public {_mint} function only callable by the {owner}.
     */
    function mint(
        address to,
        bytes32 tokenId,
        bool allowNonLSP1Recipient,
        bytes memory data
    ) public virtual onlyOwner {
        _mint(to, tokenId, allowNonLSP1Recipient, data);
    }
}
