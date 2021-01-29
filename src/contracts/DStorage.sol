pragma solidity ^0.5.0;

contract DStorage {
  string public name = 'DStorage';// Name
  uint public fileCount = 0;// Number of files
  mapping(uint => File) public files;// Mapping fileId=>Struct 

  struct File {
    uint fileId;
    string fileHash;
    uint fileSize;
    string fileType;
    string fileName;
    string fileDescription;
    uint uploadTime;
    address payable uploader;
  }// Struct

// Event
  event FileUploaded(
    uint fileId,
    string fileHash,
    uint fileSize,
    string fileType,
    string fileName,
    string fileDescription,
    uint uploadTime,
    address payable uploader
  );

  constructor() public {
  }

  function uploadFile(string memory _fileHash, uint _fileSize, string memory _fileType, string memory _fileName, string memory _fileDescription) public // Upload File function
  {
    require(bytes(_fileHash).length > 0);// Make sure the file hash exists

    require(bytes(_fileType).length > 0);// Make sure file type exists

    require(bytes(_fileDescription).length > 0);// Make sure file description exists

    require(bytes(_fileName).length > 0);// Make sure file fileName exists

    require(msg.sender != address(0));// Make sure uploader address exists

    require(_fileSize > 0);// Make sure file size is more than 0



    fileCount ++;

    files[fileCount] = File(fileCount, _fileHash, _fileSize, _fileType, _fileName, _fileDescription, now, msg.sender);

  emit FileUploaded(fileCount, _fileHash, _fileSize, _fileType, _fileName, _fileDescription, now, msg.sender);

    // Increment file id

    // Add File to the contract

    // Trigger an event
  }
 

}