{\rtf1\ansi\ansicpg1252\cocoartf2707
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fnil\fcharset0 Menlo-Regular;}
{\colortbl;\red255\green255\blue255;\red79\green123\blue61;\red26\green26\blue41;\red172\green172\blue193;
\red70\green137\blue204;\red212\green212\blue212;\red167\green197\blue152;\red253\green181\blue13;\red45\green175\blue118;
\red31\green133\blue64;}
{\*\expandedcolortbl;;\cssrgb\c37647\c54510\c30588;\cssrgb\c13333\c13725\c21176;\cssrgb\c72941\c73333\c80000;
\cssrgb\c33725\c61176\c83922;\cssrgb\c86275\c86275\c86275;\cssrgb\c70980\c80784\c65882;\cssrgb\c100000\c75686\c2745;\cssrgb\c19608\c72941\c53725;
\cssrgb\c12941\c58039\c31765;}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\deftab720
\pard\pardeftab720\partightenfactor0

\f0\fs24 \cf2 \cb3 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec2 // SPDX-License-Identifier: MIT\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2 // OpenZeppelin Contracts (last updated v4.6.0) (token/ERC20/IERC20.sol)\cf4 \cb1 \strokec4 \
\
\pard\pardeftab720\partightenfactor0
\cf5 \cb3 \strokec5 pragma\cf4 \strokec4  \cf5 \strokec5 solidity\cf4 \strokec4  \cf6 \strokec6 ^\cf7 \strokec7 0.8.0\cf6 \strokec6 ;\cf4 \cb1 \strokec4 \
\
\pard\pardeftab720\partightenfactor0
\cf2 \cb3 \strokec2 /**\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2  * @dev Interface of the ERC20 standard as defined in the EIP.\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2  */\cf4 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf4 \cb3 interface IERC20 \cf6 \strokec6 \{\cf4 \cb1 \strokec4 \
\cb3     \cf2 \strokec2 /**\cf4 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf2 \cb3 \strokec2      * @dev Emitted when `value` tokens are moved from one account (`from`) to\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      * another (`to`).\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      *\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      * Note that `value` may be zero.\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      */\cf4 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf4 \cb3     \cf5 \strokec5 event\cf4 \strokec4  Transfer\cf6 \strokec6 (\cf5 \strokec5 address\cf4 \strokec4  \cf8 \strokec8 indexed\cf4 \strokec4  from\cf6 \strokec6 ,\cf4 \strokec4  \cf5 \strokec5 address\cf4 \strokec4  \cf8 \strokec8 indexed\cf4 \strokec4  to\cf6 \strokec6 ,\cf4 \strokec4  \cf5 \strokec5 uint256\cf4 \strokec4  value\cf6 \strokec6 );\cf4 \cb1 \strokec4 \
\
\cb3     \cf2 \strokec2 /**\cf4 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf2 \cb3 \strokec2      * @dev Emitted when the allowance of a `spender` for an `owner` is set by\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      * a call to \{approve\}. `value` is the new allowance.\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      */\cf4 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf4 \cb3     \cf5 \strokec5 event\cf4 \strokec4  Approval\cf6 \strokec6 (\cf5 \strokec5 address\cf4 \strokec4  \cf8 \strokec8 indexed\cf4 \strokec4  owner\cf6 \strokec6 ,\cf4 \strokec4  \cf5 \strokec5 address\cf4 \strokec4  \cf8 \strokec8 indexed\cf4 \strokec4  spender\cf6 \strokec6 ,\cf4 \strokec4  \cf5 \strokec5 uint256\cf4 \strokec4  value\cf6 \strokec6 );\cf4 \cb1 \strokec4 \
\
\cb3     \cf2 \strokec2 /**\cf4 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf2 \cb3 \strokec2      * @dev Returns the amount of tokens in existence.\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      */\cf4 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf4 \cb3     \cf5 \strokec5 function\cf4 \strokec4  totalSupply\cf6 \strokec6 ()\cf4 \strokec4  \cf9 \strokec9 external\cf4 \strokec4  \cf9 \strokec9 view\cf4 \strokec4  \cf10 \strokec10 returns\cf4 \strokec4  \cf6 \strokec6 (\cf5 \strokec5 uint256\cf6 \strokec6 );\cf4 \cb1 \strokec4 \
\
\cb3     \cf2 \strokec2 /**\cf4 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf2 \cb3 \strokec2      * @dev Returns the amount of tokens owned by `account`.\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      */\cf4 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf4 \cb3     \cf5 \strokec5 function\cf4 \strokec4  balanceOf\cf6 \strokec6 (\cf5 \strokec5 address\cf4 \strokec4  account\cf6 \strokec6 )\cf4 \strokec4  \cf9 \strokec9 external\cf4 \strokec4  \cf9 \strokec9 view\cf4 \strokec4  \cf10 \strokec10 returns\cf4 \strokec4  \cf6 \strokec6 (\cf5 \strokec5 uint256\cf6 \strokec6 );\cf4 \cb1 \strokec4 \
\
\cb3     \cf2 \strokec2 /**\cf4 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf2 \cb3 \strokec2      * @dev Moves `amount` tokens from the caller's account to `to`.\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      *\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      * Returns a boolean value indicating whether the operation succeeded.\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      *\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      * Emits a \{Transfer\} event.\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      */\cf4 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf4 \cb3     \cf5 \strokec5 function\cf4 \strokec4  transfer\cf6 \strokec6 (\cf5 \strokec5 address\cf4 \strokec4  to\cf6 \strokec6 ,\cf4 \strokec4  \cf5 \strokec5 uint256\cf4 \strokec4  amount\cf6 \strokec6 )\cf4 \strokec4  \cf9 \strokec9 external\cf4 \strokec4  \cf10 \strokec10 returns\cf4 \strokec4  \cf6 \strokec6 (\cf5 \strokec5 bool\cf6 \strokec6 );\cf4 \cb1 \strokec4 \
\
\cb3     \cf2 \strokec2 /**\cf4 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf2 \cb3 \strokec2      * @dev Returns the remaining number of tokens that `spender` will be\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      * allowed to spend on behalf of `owner` through \{transferFrom\}. This is\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      * zero by default.\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      *\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      * This value changes when \{approve\} or \{transferFrom\} are called.\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      */\cf4 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf4 \cb3     \cf5 \strokec5 function\cf4 \strokec4  allowance\cf6 \strokec6 (\cf5 \strokec5 address\cf4 \strokec4  owner\cf6 \strokec6 ,\cf4 \strokec4  \cf5 \strokec5 address\cf4 \strokec4  spender\cf6 \strokec6 )\cf4 \strokec4  \cf9 \strokec9 external\cf4 \strokec4  \cf9 \strokec9 view\cf4 \strokec4  \cf10 \strokec10 returns\cf4 \strokec4  \cf6 \strokec6 (\cf5 \strokec5 uint256\cf6 \strokec6 );\cf4 \cb1 \strokec4 \
\
\cb3     \cf2 \strokec2 /**\cf4 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf2 \cb3 \strokec2      * @dev Sets `amount` as the allowance of `spender` over the caller's tokens.\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      *\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      * Returns a boolean value indicating whether the operation succeeded.\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      *\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      * IMPORTANT: Beware that changing an allowance with this method brings the risk\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      * that someone may use both the old and the new allowance by unfortunate\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      * transaction ordering. One possible solution to mitigate this race\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      * condition is to first reduce the spender's allowance to 0 and set the\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      * desired value afterwards:\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      *\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      * Emits an \{Approval\} event.\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      */\cf4 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf4 \cb3     \cf5 \strokec5 function\cf4 \strokec4  approve\cf6 \strokec6 (\cf5 \strokec5 address\cf4 \strokec4  spender\cf6 \strokec6 ,\cf4 \strokec4  \cf5 \strokec5 uint256\cf4 \strokec4  amount\cf6 \strokec6 )\cf4 \strokec4  \cf9 \strokec9 external\cf4 \strokec4  \cf10 \strokec10 returns\cf4 \strokec4  \cf6 \strokec6 (\cf5 \strokec5 bool\cf6 \strokec6 );\cf4 \cb1 \strokec4 \
\
\cb3     \cf2 \strokec2 /**\cf4 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf2 \cb3 \strokec2      * @dev Moves `amount` tokens from `from` to `to` using the\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      * allowance mechanism. `amount` is then deducted from the caller's\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      * allowance.\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      *\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      * Returns a boolean value indicating whether the operation succeeded.\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      *\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      * Emits a \{Transfer\} event.\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      */\cf4 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf4 \cb3     \cf5 \strokec5 function\cf4 \strokec4  transferFrom\cf6 \strokec6 (\cf4 \cb1 \strokec4 \
\cb3         \cf5 \strokec5 address\cf4 \strokec4  from\cf6 \strokec6 ,\cf4 \cb1 \strokec4 \
\cb3         \cf5 \strokec5 address\cf4 \strokec4  to\cf6 \strokec6 ,\cf4 \cb1 \strokec4 \
\cb3         \cf5 \strokec5 uint256\cf4 \strokec4  amount\cb1 \
\cb3     \cf6 \strokec6 )\cf4 \strokec4  \cf9 \strokec9 external\cf4 \strokec4  \cf10 \strokec10 returns\cf4 \strokec4  \cf6 \strokec6 (\cf5 \strokec5 bool\cf6 \strokec6 );\cf4 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf6 \cb3 \strokec6 \}\cf4 \cb1 \strokec4 \
}