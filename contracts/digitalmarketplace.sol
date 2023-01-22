// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

// CREATING THE NFT CONTRACT

//Bu sözleşme digital asset içindir. Sözleşmeye "NFT" adını verdim. Ve ERC721 ağını kullanacak.
contract NFT is ERC721URIStorage {
    using Counters for Counters.Counter;
    // _tokenIds değişkenini tanımlamak için kullanılacak Counters.counter özelliğine erişilmesine izin verecek.
    // ayrıca bu değişkene yalnızca sözleşme içinden erişmek istediğimiz için private olarak ayarlıyorum. 
    // _tokenIds varsayılan olarak sıfıra ayarlanacak
    Counters.Counter private _tokenIds; 
    address contractAddress;
    // sözleşmeler arası etkileşimi kurabilmek için address fonksiyonunu çağırıyoruz. Çünkü temelde bir sözleşmeden diğerine etkileşim kurabilmemiz için
    // bu fonksiyonu çağırmamız gerekecek.
    // sözleşme adresini marketplaceAddress olarak ayarladığımız yer.
    constructor(address marketplaceAddress) ERC721("Taha's Digital Marketplace", "TDM") { //erc721 constructor diğer argümanların yanı sıra adı ve sembolü de alır.
        contractAddress = marketplaceAddress;
    }

    // create token 
    // token için ihtiyacımız olan argüman (string memory tokenURI)
    function createToken(string memory tokenURI) public returns (uint) {
        // eğer sayıyı arttırmak istersek 
        // token id'sine ihtiyacımız var. Bunun için unique bir id oluşturmak gerekiyor.
        _tokenIds.increment(); 
        // sayının değerini almak için
        // sonra yeni bir token id'si türü olan "newItemId" değerini "tokenIds.current" olarak tanımlayan yeni bir değişken tanımlıyorum.
        // bu token için unique tanımlayıcı olacak
        uint256 newItemId = _tokenIds.current();
        
        _mint(msg.sender, newItemId);
        // "newItemId" ile "_setTokenURI" çağırılır. fonksiyon argümanına geçirilen token için "URI" yi iletiriz.
        _setTokenURI(newItemId, tokenURI);
        // mülkiyetin taraflar arasında aktabilmesine izin verir.
        setApprovalForAll(contractAddress, true);
        // "newItemId" yi döndürür. Bu önemlidir. Çünkü bir front-end uygulamadan etkileşim kuruyorsak, çağırmak için token id'sine ihtiyaç duyulacak
        return newItemId;
    }
}

// CREATING THE MARKETPLACE CONTRACT
contract NFTMarket is ReentrancyGuard {
  using Counters for Counters.Counter;
  Counters.Counter private _itemIds;
  // kaç ürünün satıldığını takip edecek.
  // item sold'u itemIds'den çıkararak kaç öğenin satılmadığını anlayabiliriz.
  Counters.Counter private _itemsSold;
// yukarıdaki kod ile itemsSold sayısına ve toplam ürün sayısına sahip olabiliriz.

  address payable owner;
  uint256 listingPrice = 0.1 ether;

  constructor() {
    owner = payable(msg.sender);
  }

// CREATE THE STRUCT FOR THE MARKET ITEM SELF
// MarketItem her bir itemi oluşturacak 
    struct MarketItem {
    uint itemId; // unique tanımlayıcı olan itemid'ye sahip olacağız
    address nftContract; // dijital varlığın contract'ı olan contract adresine sahip olacağız
    uint256 tokenId; // asset için tokenId'ye sahip olacağız
    address payable seller; // satıcının adresi
    address payable owner; 
    uint256 price;
  }

// CREATE MAPPİNG
    mapping(uint256 => MarketItem) private idToMarketItem;

// CREATE EVENT
event MarketItemCreated (
    uint indexed itemId,
    address indexed nftContract,
    uint256 indexed tokenId,
    address seller,
    address owner,
    uint256 price
  );

  function getMarketItem(uint256 marketItemId) public view returns (MarketItem memory) {
    return idToMarketItem[marketItemId];
  }

// bir kişinin market ürünü almasına izin veren fonksiyon createMArketItem
   function createMarketItem(
    address nftContract, // kullancının argüman olarak iletmesi gereken kısım
    uint256 tokenId, // kullanıcının satmak istediği 
    uint256 price   // tanımlanmak istenen fiyat
  ) public payable nonReentrant {
    // burada bir değer sıfır olamaz. Satış için bir değer alması gerekiyor.
    require(price > 0, "Price must be at least 1 wei");
    require(msg.value == listingPrice, "Price must be equal to listing price");

    _itemIds.increment();
    uint256 itemId = _itemIds.current();
  
  // temel olarak "itemId" içinden geçen "idToMarketItem" mapping'ini oluşturarak, 
  // bunu piyasa öğelerinden birinin değeri olarak ayarlıyoruz.
    idToMarketItem[itemId] =  MarketItem(
      itemId,
      nftContract,
      tokenId,
      payable(msg.sender),
      // henüz bir ürün sahibi olmadığı için boş bir address olacak bu nedenle sıfır olarak ayarlıyoruz.
      payable(address(0)),
      price
    );

    // dijital varlığın sahipliğini bu işlemi gönderen kişiden, bu sözleşmenin adresine fiilen aktarılabilir. Bunun için IERC721 ağını kullanıyoruz
    IERC721(nftContract).transferFrom(msg.sender, address(this), tokenId);

    emit MarketItemCreated(
      itemId,
      nftContract,
      tokenId,
      msg.sender,
      address(0),
      price
    );
  }

   // WE CREATE "createMatketSale" TO GENERATE MARKET SALE
   function createMarketSale(
    address nftContract,
    uint256 itemId
    // satış için bir değişken oluşturuyoruz. Fiyat bizim için erişilebilir olacak.
    ) public payable nonReentrant {
    uint price = idToMarketItem[itemId].price;
    uint tokenId = idToMarketItem[itemId].tokenId;
    // burada işlemi gönderen kullanıcının olduğundan emin olmak istiyoruz.
    // msg.value ve price eşit değilse bu hata mesajı alınacak
    require(msg.value == price, "Please submit the asking price in order to complete the purchase");

    // burada id'yi ve satıcının adresini alacağız
    idToMarketItem[itemId].seller.transfer(msg.value);
    // sözleşmenin bu adresten değeri alıp mesajı gönderene gönderiyoruz. 
    IERC721(nftContract).transferFrom(address(this), msg.sender, tokenId);
    // burada artık varlıkların sahibi olduğu için owner = payable(msg.sender) olarak ayarlamak için yerel eşleşmeyi güncelliyoruz.
    idToMarketItem[itemId].owner = payable(msg.sender);
    _itemsSold.increment();
    payable(owner).transfer(listingPrice);
  }

  // satışa uygun market öğelerini getirecek olan fonksiyon
  // satılık olan tüm öğeleri çağıracak
  function fetchMarketItems() public view returns (MarketItem[] memory) {
    // oluşturulmuş toplam ürün sayısı
    uint itemCount = _itemIds.current();
    // satılmamış ürün sayısı
    uint unsoldItemCount = _itemIds.current() - _itemsSold.current();
    uint currentIndex = 0;

    // WE CREATE TO RETURN UNSOLD ITEMS
    // bu değişken bir dizi pazar öğesini içerecek
    MarketItem[] memory items = new MarketItem[](unsoldItemCount);
    // for döngüsü ile adresin, boş bir adres olup olmadığını kontrol ediyoruz.
    // eğer boş bir adres ise, henüz satılmadığı anlamına gelir 
    for (uint i = 0; i < itemCount; i++) {
      if (idToMarketItem[i + 1].owner == address(0)) {
        // boş bir adres varsa, currentId çalışacaktır.
        uint currentId = i + 1;
        MarketItem storage currentItem = idToMarketItem[currentId];
        items[currentIndex] = currentItem;
        // mevcut dizinin değerini 1 arttırır
        currentIndex += 1;
      }
    }
   // satılmayan öğeler return edilecek
    return items;
  }

  // WE CREATE TO RETURN SOLD ITEMS
  // adresi görebilir, cüzdan adresimizle giriş yapabiliriz ve sahip olduğumuz ürünleri görebiliriz.
  function fetchMyNFTs() public view returns (MarketItem[] memory) {
    uint totalItemCount = _itemIds.current();
    uint itemCount = 0;
    uint currentIndex = 0;

    for (uint i = 0; i < totalItemCount; i++) {
      // işlemi gönderen kişiyle eşit olup olmadığını ve satın alan kişi olup olmadığını anlamak için kullanıyoruz.
      if (idToMarketItem[i + 1].owner == msg.sender) {
        // item sayısı 1 arttırılır
        itemCount += 1;
      }
    }
    // son fonksiyondaki for döngüsüyle hemen hemen aynı. Fakat ondan farkı boş bir adres olmasının aksine mesajı gönderen kişi doğruysa o varlığa sahiptir.
    // item diziye eklenir 
    MarketItem[] memory items = new MarketItem[](itemCount);
    for (uint i = 0; i < totalItemCount; i++) {
      if (idToMarketItem[i + 1].owner == msg.sender) {
        uint currentId = i + 1;
        MarketItem storage currentItem = idToMarketItem[currentId];
        items[currentIndex] = currentItem;
        currentIndex += 1;
      }
    }
   // satılan öğeler return edilecek
    return items;
  }
}