//SPDX-License-Identifier:MIT

//Contract for inheretence example

pragma solidity ^0.8.0;

import "./SimpleStorage.sol";

//ExtraStorage inherited SimpleStorage with the help of is keyword
contract ExtraStorage is SimpleStorage{
    // we want ExtraStorage contract to +5 any num. entered before and store it 
    // This is overriding a function 
    // There are 2 keywords that we will use - virtual , override
 
    /*"function store(uint256 _favouriteNum) public{
        favouriteNum = _favouriteNum + 5 ;"
    Writing like this will 2 errors . It's because if the parent contract
    has the same function then we have to tell solidity that we the function 
    the "override" specifier*/

    /*2 errors were :
    1. Overriding function is missing "override" specifier .
    2. Trying to override non-virtual function .*/

    /*For overriding a function present in parent contract it should be 
     declared as virtual in th e paprent contract */
    function store(uint256 _favouriteNum) public override{
        favouriteNum = _favouriteNum + 5;
    }

}