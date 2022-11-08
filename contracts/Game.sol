// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.4;

contract Game {
    constructor() payable {}

    function pickACard() private view returns (uint) {
        uint pickedCard = uint(
            keccak256(
                abi.encodePacked(blockhash(block.number), block.timestamp)
            )
        );
        return pickedCard;
    }

    function guess(uint _guess) public {
        uint _pickedCard = pickACard();
        if (_guess == _pickedCard) {
            (bool sent, ) = msg.sender.call{value: 0.1 ether}("");
            require(sent, "failed to sent ether");
        }
    }

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}
