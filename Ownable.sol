{\rtf1\ansi\ansicpg1252\cocoartf2707
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fnil\fcharset0 Menlo-Regular;}
{\colortbl;\red255\green255\blue255;\red79\green123\blue61;\red26\green26\blue41;\red172\green172\blue193;
\red70\green137\blue204;\red212\green212\blue212;\red167\green197\blue152;\red194\green126\blue101;\red45\green175\blue118;
\red253\green181\blue13;\red237\green114\blue173;\red14\green86\blue166;\red31\green133\blue64;\red13\green102\blue149;
}
{\*\expandedcolortbl;;\cssrgb\c37647\c54510\c30588;\cssrgb\c13333\c13725\c21176;\cssrgb\c72941\c73333\c80000;
\cssrgb\c33725\c61176\c83922;\cssrgb\c86275\c86275\c86275;\cssrgb\c70980\c80784\c65882;\cssrgb\c80784\c56863\c47059;\cssrgb\c19608\c72941\c53725;
\cssrgb\c100000\c75686\c2745;\cssrgb\c95294\c54118\c73333;\cssrgb\c3137\c42353\c70980;\cssrgb\c12941\c58039\c31765;\cssrgb\c0\c47843\c65098;
}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\deftab720
\pard\pardeftab720\partightenfactor0

\f0\fs24 \cf2 \cb3 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec2 // SPDX-License-Identifier: MIT\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2 // OpenZeppelin Contracts (last updated v4.7.0) (access/Ownable.sol)\cf4 \cb1 \strokec4 \
\
\pard\pardeftab720\partightenfactor0
\cf5 \cb3 \strokec5 pragma\cf4 \strokec4  \cf5 \strokec5 solidity\cf4 \strokec4  \cf6 \strokec6 ^\cf7 \strokec7 0.8.0\cf6 \strokec6 ;\cf4 \cb1 \strokec4 \
\
\cf5 \cb3 \strokec5 import\cf4 \strokec4  \cf8 \strokec8 "../utils/Context.sol"\cf6 \strokec6 ;\cf4 \cb1 \strokec4 \
\
\pard\pardeftab720\partightenfactor0
\cf2 \cb3 \strokec2 /**\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2  * @dev Contract module which provides a basic access control mechanism, where\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2  * there is an account (an owner) that can be granted exclusive access to\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2  * specific functions.\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2  *\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2  * By default, the owner account will be the one that deploys the contract. This\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2  * can later be changed with \{transferOwnership\}.\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2  *\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2  * This module is used through inheritance. It will make available the modifier\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2  * `onlyOwner`, which can be applied to your functions to restrict their use to\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2  * the owner.\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2  */\cf4 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf5 \cb3 \strokec5 abstract\cf4 \strokec4  \cf5 \strokec5 contract\cf4 \strokec4  Ownable \cf5 \strokec5 is\cf4 \strokec4  Context \cf6 \strokec6 \{\cf4 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf4 \cb3 \strokec4     \cf5 \strokec5 address\cf4 \strokec4  \cf9 \strokec9 private\cf4 \strokec4  _owner\cf6 \strokec6 ;\cf4 \cb1 \strokec4 \
\
\cf4 \cb3 \strokec4     \cf5 \strokec5 event\cf4 \strokec4  OwnershipTransferred\cf6 \strokec6 (\cf5 \strokec5 address\cf4 \strokec4  \cf10 \strokec10 indexed\cf4 \strokec4  previousOwner\cf6 \strokec6 ,\cf4 \strokec4  \cf5 \strokec5 address\cf4 \strokec4  \cf10 \strokec10 indexed\cf4 \strokec4  newOwner\cf6 \strokec6 );\cf4 \cb1 \strokec4 \
\
\cf4 \cb3 \strokec4     \cf2 \strokec2 /**\cf4 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf2 \cb3 \strokec2      * @dev Initializes the contract setting the deployer as the initial owner.\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      */\cf4 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf4 \cb3 \strokec4     \cf11 \strokec11 constructor\cf6 \strokec6 ()\cf4 \strokec4  \cf6 \strokec6 \{\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4         _transferOwnership\cf6 \strokec6 (\cf4 \strokec4 _msgSender\cf6 \strokec6 ());\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4     \cf6 \strokec6 \}\cf4 \cb1 \strokec4 \
\
\cf4 \cb3 \strokec4     \cf2 \strokec2 /**\cf4 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf2 \cb3 \strokec2      * @dev Throws if called by any account other than the owner.\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      */\cf4 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf4 \cb3 \strokec4     \cf5 \strokec5 modifier\cf4 \strokec4  onlyOwner\cf6 \strokec6 ()\cf4 \strokec4  \cf6 \strokec6 \{\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4         _checkOwner\cf6 \strokec6 ();\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4         _\cf6 \strokec6 ;\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4     \cf6 \strokec6 \}\cf4 \cb1 \strokec4 \
\
\cf4 \cb3 \strokec4     \cf2 \strokec2 /**\cf4 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf2 \cb3 \strokec2      * @dev Returns the address of the current owner.\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      */\cf4 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf4 \cb3 \strokec4     \cf5 \strokec5 function\cf4 \strokec4  owner\cf6 \strokec6 ()\cf4 \strokec4  \cf9 \strokec9 public\cf4 \strokec4  \cf9 \strokec9 view\cf4 \strokec4  \cf12 \strokec12 virtual\cf4 \strokec4  \cf13 \strokec13 returns\cf4 \strokec4  \cf6 \strokec6 (\cf5 \strokec5 address\cf6 \strokec6 )\cf4 \strokec4  \cf6 \strokec6 \{\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4         \cf13 \strokec13 return\cf4 \strokec4  _owner\cf6 \strokec6 ;\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4     \cf6 \strokec6 \}\cf4 \cb1 \strokec4 \
\
\cf4 \cb3 \strokec4     \cf2 \strokec2 /**\cf4 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf2 \cb3 \strokec2      * @dev Throws if the sender is not the owner.\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      */\cf4 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf4 \cb3 \strokec4     \cf5 \strokec5 function\cf4 \strokec4  _checkOwner\cf6 \strokec6 ()\cf4 \strokec4  \cf9 \strokec9 internal\cf4 \strokec4  \cf9 \strokec9 view\cf4 \strokec4  \cf12 \strokec12 virtual\cf4 \strokec4  \cf6 \strokec6 \{\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4         \cf14 \strokec14 require\cf6 \strokec6 (\cf4 \strokec4 owner\cf6 \strokec6 ()\cf4 \strokec4  \cf6 \strokec6 ==\cf4 \strokec4  _msgSender\cf6 \strokec6 (),\cf4 \strokec4  \cf8 \strokec8 "Ownable: caller is not the owner"\cf6 \strokec6 );\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4     \cf6 \strokec6 \}\cf4 \cb1 \strokec4 \
\
\cf4 \cb3 \strokec4     \cf2 \strokec2 /**\cf4 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf2 \cb3 \strokec2      * @dev Leaves the contract without owner. It will not be possible to call\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      * `onlyOwner` functions anymore. Can only be called by the current owner.\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      *\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      * NOTE: Renouncing ownership will leave the contract without an owner,\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      * thereby removing any functionality that is only available to the owner.\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      */\cf4 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf4 \cb3 \strokec4     \cf5 \strokec5 function\cf4 \strokec4  renounceOwnership\cf6 \strokec6 ()\cf4 \strokec4  \cf9 \strokec9 public\cf4 \strokec4  \cf12 \strokec12 virtual\cf4 \strokec4  onlyOwner \cf6 \strokec6 \{\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4         _transferOwnership\cf6 \strokec6 (\cf5 \strokec5 address\cf6 \strokec6 (\cf7 \strokec7 0\cf6 \strokec6 ));\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4     \cf6 \strokec6 \}\cf4 \cb1 \strokec4 \
\
\cf4 \cb3 \strokec4     \cf2 \strokec2 /**\cf4 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf2 \cb3 \strokec2      * @dev Transfers ownership of the contract to a new account (`newOwner`).\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      * Can only be called by the current owner.\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      */\cf4 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf4 \cb3 \strokec4     \cf5 \strokec5 function\cf4 \strokec4  transferOwnership\cf6 \strokec6 (\cf5 \strokec5 address\cf4 \strokec4  newOwner\cf6 \strokec6 )\cf4 \strokec4  \cf9 \strokec9 public\cf4 \strokec4  \cf12 \strokec12 virtual\cf4 \strokec4  onlyOwner \cf6 \strokec6 \{\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4         \cf14 \strokec14 require\cf6 \strokec6 (\cf4 \strokec4 newOwner \cf6 \strokec6 !=\cf4 \strokec4  \cf5 \strokec5 address\cf6 \strokec6 (\cf7 \strokec7 0\cf6 \strokec6 ),\cf4 \strokec4  \cf8 \strokec8 "Ownable: new owner is the zero address"\cf6 \strokec6 );\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4         _transferOwnership\cf6 \strokec6 (\cf4 \strokec4 newOwner\cf6 \strokec6 );\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4     \cf6 \strokec6 \}\cf4 \cb1 \strokec4 \
\
\cf4 \cb3 \strokec4     \cf2 \strokec2 /**\cf4 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf2 \cb3 \strokec2      * @dev Transfers ownership of the contract to a new account (`newOwner`).\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      * Internal function without access restriction.\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      */\cf4 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf4 \cb3 \strokec4     \cf5 \strokec5 function\cf4 \strokec4  _transferOwnership\cf6 \strokec6 (\cf5 \strokec5 address\cf4 \strokec4  newOwner\cf6 \strokec6 )\cf4 \strokec4  \cf9 \strokec9 internal\cf4 \strokec4  \cf12 \strokec12 virtual\cf4 \strokec4  \cf6 \strokec6 \{\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4         \cf5 \strokec5 address\cf4 \strokec4  oldOwner \cf6 \strokec6 =\cf4 \strokec4  _owner\cf6 \strokec6 ;\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4         _owner \cf6 \strokec6 =\cf4 \strokec4  newOwner\cf6 \strokec6 ;\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4         \cf5 \strokec5 emit\cf4 \strokec4  OwnershipTransferred\cf6 \strokec6 (\cf4 \strokec4 oldOwner\cf6 \strokec6 ,\cf4 \strokec4  newOwner\cf6 \strokec6 );\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4     \cf6 \strokec6 \}\cf4 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf6 \cb3 \strokec6 \}\cf4 \cb1 \strokec4 \
}