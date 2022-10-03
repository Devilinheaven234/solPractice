// SPDX-License-Identifier:MIT
pragma solidity ^0.8.7; //latest0.8.17 . '^' means any version above the written version will be fine

contract SimpleStorage {
    // Data types : boolean, uint, int, address, bytes, string
    bool hasFavouriteNum = true;
    uint256 favouriteNum ;
    string favouriteNumInText = "Five";
    int256 favouriteInt = -5;
    bytes32 favouriteBytes = "cat";

    /*A mapping is a data structure where key is "mapped" to a single value*/
    mapping(string => uint256) public nametoFavouriteNumber;

    // creating an array 
    // This same can be done with uint256 , for eg :-  uint256[] public favouriteNumList ;
    People[] public people;//Dynamic array
    /*memory is a keyword*/
    function addPerson(string memory _name, uint256 _favouriteNum) public {
        people.push(People(_favouriteNum, _name));
        nametoFavouriteNumber[_name]=_favouriteNum;
    }

   /* People public person = People({favouriteNum: 8, name:"DEVANSH"});
      This is not a great way of creating a list of large number of people and if go on by this method,then we will have to copy paste the same statement 
      with different values
      Therefore we use array for this purpose  */

    struct People{
        uint256 favouriteNum ;
        string name ;
    }

    function store(uint256 _favouriteNum) public virtual {
        favouriteNum = _favouriteNum;
    }

    //FUNCTIONS:If a gas calling function callls a view or pure function only the it will cost gas 
    /*If a gas calling function call a pure or view function - only then it will cost gas .
    for eg:-
    function store(uint256 _favouriteNum) public {
        favouriteNum = _favouriteNum;
        retrieve();
    }

    Discription - retrieve() which is a view function , is called by a gas calling function store()*/
    //view & pure function disallows the mmodification of the state of blockchain. Gas fees is not spend when calling them on their own
    // view - can only read, doesn't make change to the blockchain 
    function retrieve() public view returns(uint256){
        return favouriteNum;
    }

    //pure - disallow us to read from the blockchain state
    function add() public pure returns(uint256){
        return(1+1);
    }

    /*There are 6 places from where evm can access and store information:
    1. Stack
    2. Memory
    3. Storage
    4. Calldata
    5. Code
    6. Logs
    ->Important ones are calldata, memory, storage.
    ->calldata(cannot be modified) and memory(can be modified) means that the variable associated with them will only 
      exist temporarily   
    ->storage is permanent variable variable that can be modified
    ->data locations can only be specified for an array, struct or mapping type */
}