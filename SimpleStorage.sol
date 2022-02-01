// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

contract SimpleStorage {

    // this will get initialized to 0
    uint256 favoriteNumber;

    struct People{
        uint256 favoriteNumber;
        string name;
    }

    People[] public people;
    mapping(string => uint256) public nameToFavoriteNumber;

    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }

    //this is a view function, which doesn't require a transaction on the blockchain (blue button)
    function retrieve() public view returns(uint256) {
        return favoriteNumber;
    }
    
    //an array is technically an array of bytes,
    //so when we use a parameter that is going to be a string for one of our functions, we need to call it memory or storage
    //memory means, after execution, delete this variable
    //storage means keep it forever
    function addPerson(string memory _name, uint256 _favoriteNumber) public{
        people.push(People(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }
}
