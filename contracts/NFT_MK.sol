pragma solidity ^0.8.0; //My main goal is to build NFT on layer 2
import "@openzeppelin/contracts/token/ERC721/ERC721.sol"; //I used Open Zeppelin's ERC721 contracts, which reduced the amount of code to write.
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
contract MyNFT is ERC721, Ownable {
  using Counters for Counters.Counter; //I defined some variables to help myself
  using Strings for uint256;
  Counters.Counter private _tokenIds;
  mapping (uint256 => string) private _tokenURIs;
  
  constructor() ERC721("MK_mn_FIRST_NFT", "MNFT") {}
  function _setTokenURI(uint256 tokenId, string memory _tokenURI) //The function _setTokenURI is taking in a token ID and a token URI and adding it to the mapping.
    internal
    virtual
  {
    _tokenURIs[tokenId] = _tokenURI;
  }
  function tokenURI(uint256 tokenId) 
    public
    view
    virtual
    override
    returns (string memory)
  {
    require(_exists(tokenId), "ERC721Metadata: URI query for nonexistent token");
    string memory _tokenURI = _tokenURIs[tokenId];
    return _tokenURI;
  }
  function mint(address recipient, string memory uri) //This function takes in a wallet address and a token URI. The token URI is used in the _setTokenURI function, the token ID is incremented. The new token is sent to the recipient's address.
    public
    returns (uint256)
  {
    _tokenIds.increment();
    uint256 newItemId = _tokenIds.current();
    _mint(recipient, newItemId);
    _setTokenURI(newItemId, uri);
    return newItemId;
  }
}