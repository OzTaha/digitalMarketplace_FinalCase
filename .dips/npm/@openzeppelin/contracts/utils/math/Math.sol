{
	"compiler": {
		"version": "0.8.7+commit.e28d00a7"
	},
	"language": "Solidity",
	"output": {
		"abi": [
			{
				"inputs": [],
				"stateMutability": "nonpayable",
				"type": "constructor"
			},
			{
				"anonymous": false,
				"inputs": [
					{
						"indexed": true,
						"internalType": "uint256",
						"name": "itemId",
						"type": "uint256"
					},
					{
						"indexed": true,
						"internalType": "address",
						"name": "nftContract",
						"type": "address"
					},
					{
						"indexed": true,
						"internalType": "uint256",
						"name": "tokenId",
						"type": "uint256"
					},
					{
						"indexed": false,
						"internalType": "address",
						"name": "seller",
						"type": "address"
					},
					{
						"indexed": false,
						"internalType": "address",
						"name": "owner",
						"type": "address"
					},
					{
						"indexed": false,
						"internalType": "uint256",
						"name": "price",
						"type": "uint256"
					}
				],
				"name": "MarketItemCreated",
				"type": "event"
			},
			{
				"inputs": [
					{
						"internalType": "address",
						"name": "nftContract",
						"type": "address"
					},
					{
						"internalType": "uint256",
						"name": "tokenId",
						"type": "uint256"
					},
					{
						"internalType": "uint256",
						"name": "price",
						"type": "uint256"
					}
				],
				"name": "createMarketItem",
				"outputs": [],
				"stateMutability": "payable",
				"type": "function"
			},
			{
				"inputs": [
					{
						"internalType": "address",
						"name": "nftContract",
						"type": "address"
					},
					{
						"internalType": "uint256",
						"name": "itemId",
						"type": "uint256"
					}
				],
				"name": "createMarketSale",
				"outputs": [],
				"stateMutability": "payable",
				"type": "function"
			},
			{
				"inputs": [],
				"name": "fetchMarketItems",
				"outputs": [
					{
						"components": [
							{
								"internalType": "uint256",
								"name": "itemId",
								"type": "uint256"
							},
							{
								"internalType": "address",
								"name": "nftContract",
								"type": "address"
							},
							{
								"internalType": "uint256",
								"name": "tokenId",
								"type": "uint256"
							},
							{
								"internalType": "address payable",
								"name": "seller",
								"type": "address"
							},
							{
								"internalType": "address payable",
								"name": "owner",
								"type": "address"
							},
							{
								"internalType": "uint256",
								"name": "price",
								"type": "uint256"
							}
						],
						"internalType": "struct NFTMarket.MarketItem[]",
						"name": "",
						"type": "tuple[]"
					}
				],
				"stateMutability": "view",
				"type": "function"
			},
			{
				"inputs": [],
				"name": "fetchMyNFTs",
				"outputs": [
					{
						"components": [
							{
								"internalType": "uint256",
								"name": "itemId",
								"type": "uint256"
							},
							{
								"internalType": "address",
								"name": "nftContract",
								"type": "address"
							},
							{
								"internalType": "uint256",
								"name": "tokenId",
								"type": "uint256"
							},
							{
								"internalType": "address payable",
								"name": "seller",
								"type": "address"
							},
							{
								"internalType": "address payable",
								"name": "owner",
								"type": "address"
							},
							{
								"internalType": "uint256",
								"name": "price",
								"type": "uint256"
							}
						],
						"internalType": "struct NFTMarket.MarketItem[]",
						"name": "",
						"type": "tuple[]"
					}
				],
				"stateMutability": "view",
				"type": "function"
			},
			{
				"inputs": [
					{
						"internalType": "uint256",
						"name": "marketItemId",
						"type": "uint256"
					}
				],
				"name": "getMarketItem",
				"outputs": [
					{
						"components": [
							{
								"internalType": "uint256",
								"name": "itemId",
								"type": "uint256"
							},
							{
								"internalType": "address",
								"name": "nftContract",
								"type": "address"
							},
							{
								"internalType": "uint256",
								"name": "tokenId",
								"type": "uint256"
							},
							{
								"internalType": "address payable",
								"name": "seller",
								"type": "address"
							},
							{
								"internalType": "address payable",
								"name": "owner",
								"type": "address"
							},
							{
								"internalType": "uint256",
								"name": "price",
								"type": "uint256"
							}
						],
						"internalType": "struct NFTMarket.MarketItem",
						"name": "",
						"type": "tuple"
					}
				],
				"stateMutability": "view",
				"type": "function"
			}
		],
		"devdoc": {
			"kind": "dev",
			"methods": {},
			"version": 1
		},
		"userdoc": {
			"kind": "user",
			"methods": {},
			"version": 1
		}
	},
	"settings": {
		"compilationTarget": {
			"contracts/digitalmarketplace.sol": "NFTMarket"
		},
		"evmVersion": "london",
		"libraries": {},
		"metadata": {
			"bytecodeHash": "ipfs"
		},
		"optimizer": {
			"enabled": false,
			"runs": 200
		},
		"remappings": []
	},
	"sources": {
		"@openzeppelin/contracts/security/ReentrancyGuard.sol": {
			"keccak256": "0x190dd6f8d592b7e4e930feb7f4313aeb8e1c4ad3154c27ce1cf6a512fc30d8cc",
			"license": "MIT",
			"urls": [
				"bzz-raw://4ce8dfb62d0c4fa260d6eec8f1cd47f5f2a044e11bde5b31d18072fa6e7d9010",
				"dweb:/ipfs/QmTyFztU3tLEcEDnqqiaW4UJetqsU77LXc6pjc9oTXCK5u"
			]
		},
		"@openzeppelin/contracts/token/ERC721/ERC721.sol": {
			"keccak256": "0xd89f3585b211fc9e3408384a4c4efdc3a93b2f877a3821046fa01c219d35be1b",
			"license": "MIT",
			"urls": [
				"bzz-raw://5ea15ef7c8980240ccd46df13809d163f749bc0a01d8bced1875660d4872da1c",
				"dweb:/ipfs/QmbDfAT9VeCSG4cnPd6tjDMp8ED85dLHbWyMyv7wbmL4CH"
			]
		},
		"@openzeppelin/contracts/token/ERC721/IERC721.sol": {
			"keccak256": "0xab28a56179c1db258c9bf5235b382698cb650debecb51b23d12be9e241374b68",
			"license": "MIT",
			"urls": [
				"bzz-raw://daae589a9d6fa7e55f99f86c0a16796ca490f243fb3693632c3711c0646c1d56",
				"dweb:/ipfs/QmR3zpd7wNw3rcUdekwiv6FYHJqksuTCXLVioTxu6Fbxk3"
			]
		},
		"@openzeppelin/contracts/token/ERC721/IERC721Receiver.sol": {
			"keccak256": "0xa82b58eca1ee256be466e536706850163d2ec7821945abd6b4778cfb3bee37da",
			"license": "MIT",
			"urls": [
				"bzz-raw://6e75cf83beb757b8855791088546b8337e9d4684e169400c20d44a515353b708",
				"dweb:/ipfs/QmYvPafLfoquiDMEj7CKHtvbgHu7TJNPSVPSCjrtjV8HjV"
			]
		},
		"@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol": {
			"keccak256": "0x5c3501c1b70fcfc64417e9da5cc6a3597191baa354781e508e1e14cc0e50a038",
			"license": "MIT",
			"urls": [
				"bzz-raw://899c87a849a94c848818d0afede6961d2c87665af1dd23a5c983e78981a65691",
				"dweb:/ipfs/QmUeFDffQRDmX87FX3MRxN3bmpUxDTWpWLwPJzeAJ3yF6H"
			]
		},
		"@openzeppelin/contracts/token/ERC721/extensions/IERC721Metadata.sol": {
			"keccak256": "0x75b829ff2f26c14355d1cba20e16fe7b29ca58eb5fef665ede48bc0f9c6c74b9",
			"license": "MIT",
			"urls": [
				"bzz-raw://a0a107160525724f9e1bbbab031defc2f298296dd9e331f16a6f7130cec32146",
				"dweb:/ipfs/QmemujxSd7gX8A9M8UwmNbz4Ms3U9FG9QfudUgxwvTmPWf"
			]
		},
		"@openzeppelin/contracts/utils/Address.sol": {
			"keccak256": "0xf96f969e24029d43d0df89e59d365f277021dac62b48e1c1e3ebe0acdd7f1ca1",
			"license": "MIT",
			"urls": [
				"bzz-raw://ec772b45a624be516f1c81970caa8a2e144301e9d0921cbc1a2789fef39a1269",
				"dweb:/ipfs/QmNyjwxCrGhQMyzLD93oUobJXVe9ceJvRvfXwbEtuxPiEj"
			]
		},
		"@openzeppelin/contracts/utils/Context.sol": {
			"keccak256": "0xe2e337e6dde9ef6b680e07338c493ebea1b5fd09b43424112868e9cc1706bca7",
			"license": "MIT",
			"urls": [
				"bzz-raw://6df0ddf21ce9f58271bdfaa85cde98b200ef242a05a3f85c2bc10a8294800a92",
				"dweb:/ipfs/QmRK2Y5Yc6BK7tGKkgsgn3aJEQGi5aakeSPZvS65PV8Xp3"
			]
		},
		"@openzeppelin/contracts/utils/Counters.sol": {
			"keccak256": "0xf0018c2440fbe238dd3a8732fa8e17a0f9dce84d31451dc8a32f6d62b349c9f1",
			"license": "MIT",
			"urls": [
				"bzz-raw://59e1c62884d55b70f3ae5432b44bb3166ad71ae3acd19c57ab6ddc3c87c325ee",
				"dweb:/ipfs/QmezuXg5GK5oeA4F91EZhozBFekhq5TD966bHPH18cCqhu"
			]
		},
		"@openzeppelin/contracts/utils/Strings.sol": {
			"keccak256": "0xa4d1d62251f8574deb032a35fc948386a9b4de74b812d4f545a1ac120486b48a",
			"license": "MIT",
			"urls": [
				"bzz-raw://8c969013129ba9e651a20735ef659fef6d8a1139ea3607bd4b26ddea2d645634",
				"dweb:/ipfs/QmVhVa6LGuzAcB8qgDtVHRkucn4ihj5UZr8xBLcJkP6ucb"
			]
		},
		"@openzeppelin/contracts/utils/introspection/ERC165.sol": {
			"keccak256": "0xd10975de010d89fd1c78dc5e8a9a7e7f496198085c151648f20cba166b32582b",
			"license": "MIT",
			"urls": [
				"bzz-raw://fb0048dee081f6fffa5f74afc3fb328483c2a30504e94a0ddd2a5114d731ec4d",
				"dweb:/ipfs/QmZptt1nmYoA5SgjwnSgWqgUSDgm4q52Yos3xhnMv3MV43"
			]
		},
		"@openzeppelin/contracts/utils/introspection/IERC165.sol": {
			"keccak256": "0x447a5f3ddc18419d41ff92b3773fb86471b1db25773e07f877f548918a185bf1",
			"license": "MIT",
			"urls": [
				"bzz-raw://be161e54f24e5c6fae81a12db1a8ae87bc5ae1b0ddc805d82a1440a68455088f",
				"dweb:/ipfs/QmP7C3CHdY9urF4dEMb9wmsp1wMxHF6nhA2yQE5SKiPAdy"
			]
		},
		"@openzeppelin/contracts/utils/math/Math.sol": {
			"keccak256": "0xa1e8e83cd0087785df04ac79fb395d9f3684caeaf973d9e2c71caef723a3a5d6",
			"license": "MIT",
			"urls": [
				"bzz-raw://33bbf48cc069be677705037ba7520c22b1b622c23b33e1a71495f2d36549d40b",
				"dweb:/ipfs/Qmct36zWXv3j7LZB83uwbg7TXwnZSN1fqHNDZ93GG98bGz"
			]
		},
		"contracts/digitalmarketplace.sol": {
			"keccak256": "0x877dc3edfda1ee6b693885eeee546bf846725c639bfc47dd054d5788fee768b2",
			"license": "MIT",
			"urls": [
				"bzz-raw://f99ebabdda5bdf6071706cf0f139f10ea64ddc3f50ff42c71550029677105bab",
				"dweb:/ipfs/QmbJEN4vuiBTkuYr6dd5FTdoAioHNtRXAxqqjMpP9j4Jty"
			]
		}
	},
	"version": 1
}