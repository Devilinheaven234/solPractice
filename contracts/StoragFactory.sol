//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;

import "./SimpleStorage.sol";

contract StorageFactory {
    //SimpleStorage public simpleStorage;
    SimpleStorage[] public simpleStorageArray;

    function createSimpleStorageContract() public {
        /*simpleStorage = new SimpleStorage(); creates only one contract at
        every call */ 

        /*now every time we call our createSimpleStorageContract it will
        replace anything stored in var. simpleStorage .
        So to keep the list of every SimpleStorage contract created on 
        the call of function createSimpleStorageContract update the code
        as follows:-
        BEFORE -  SimpleStorage public simpleStorage;
        UPDATED - SimpleStorage[] public simpleStorageArray; */

        //"SimpleStorage simpleStorage" way of storing as a memory variable 
        SimpleStorage simpleStorage = new SimpleStorage();

        //now add the above memory variable to simpleStorageArray as show below
        simpleStorageArray.push(simpleStorage);
    }

    function sfStore(uint256 _simpleStorageIndex, uint _simpleStorageNum) public {
        /*To interact with any other contract we will need 2 things:
          1.Address of the contact 
          2. ABI(Application Binary Interface) of the contract */

        //Addresses of eache SimpleStorage conract is stored in simpleStorageArray 

       // SimpleStorage simpleStorage = SimpleStorage(simpleStorageArray[_simpleStorageIndex]);
        SimpleStorage simpleStorage1 = simpleStorageArray[_simpleStorageIndex];
        simpleStorage.store(_simpleStorageNum);
    }

    // To read _simpleStorageNumber 
    function sfGet(uint256 _simpleStorageNum) public view return(uint256){
        SimpleStorage simpleStorage = simpleStorageArray(_simpleStorageIndex);
        return simpleStorage.retrieve();//retrieve() - to get the number stored above in the array
    }

}