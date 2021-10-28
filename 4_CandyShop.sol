// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract CandyShop {
    address private _shopOwner = msg.sender;
    
    struct Commodity {
        string name;
        uint supply;
        uint uniqueId;
    }
    
    Commodity[] public shopContent;
    mapping(address => uint[]) public supplier;
    
    function _isShopOwner() internal view returns(bool) {
        return _shopOwner == msg.sender;
    }
    
    modifier onlyOwner() {
        require(_isShopOwner());
        _;
    }
    
    function updateShop(string memory _supplyName, uint _supplyAmount, uint _supplyId, address _supplierAddress) external returns(uint) {
        shopContent.push(Commodity(_supplyName, _supplyAmount, _supplyId));
        supplier[_supplierAddress].push(_supplyId);
        
        return shopContent.length;
    }
    
    function getShopCommodity(uint256 _uniqueId) public view returns(uint) {
        // Commodity storage commodity;
        uint shopCount;
        
        for (uint i = 1; i < shopContent.length; i++) {
            if (shopContent[i].uniqueId == _uniqueId) {
                shopCount = shopContent.length;
                break;
            }
        }
        
        // return (commodity.name, commodity.supply, commodity.uniqueId);
        
        return shopCount;
    }
    
    function sellCandy(address _buyerAddress) public {
        
    }
}
