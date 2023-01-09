{\rtf1\ansi\ansicpg1252\cocoartf2707
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fnil\fcharset0 Menlo-Regular;}
{\colortbl;\red255\green255\blue255;\red79\green123\blue61;\red26\green26\blue41;\red172\green172\blue193;
\red70\green137\blue204;\red212\green212\blue212;\red167\green197\blue152;\red194\green126\blue101;\red45\green175\blue118;
\red237\green114\blue173;\red140\green108\blue11;\red14\green86\blue166;\red115\green123\blue132;\red31\green133\blue64;
\red13\green102\blue149;\red253\green181\blue13;}
{\*\expandedcolortbl;;\cssrgb\c37647\c54510\c30588;\cssrgb\c13333\c13725\c21176;\cssrgb\c72941\c73333\c80000;
\cssrgb\c33725\c61176\c83922;\cssrgb\c86275\c86275\c86275;\cssrgb\c70980\c80784\c65882;\cssrgb\c80784\c56863\c47059;\cssrgb\c19608\c72941\c53725;
\cssrgb\c95294\c54118\c73333;\cssrgb\c61961\c49412\c3137;\cssrgb\c3137\c42353\c70980;\cssrgb\c52549\c55686\c58824;\cssrgb\c12941\c58039\c31765;
\cssrgb\c0\c47843\c65098;\cssrgb\c100000\c75686\c2745;}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\deftab720
\pard\pardeftab720\partightenfactor0

\f0\fs24 \cf2 \cb3 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec2 // SPDX-License-Identifier: MIT\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2 // OpenZeppelin Contracts (last updated v4.7.0) (token/ERC20/ERC20.sol)\cf4 \cb1 \strokec4 \
\
\pard\pardeftab720\partightenfactor0
\cf5 \cb3 \strokec5 pragma\cf4 \strokec4  \cf5 \strokec5 solidity\cf4 \strokec4  \cf6 \strokec6 ^\cf7 \strokec7 0.8.0\cf6 \strokec6 ;\cf4 \cb1 \strokec4 \
\
\cf5 \cb3 \strokec5 import\cf4 \strokec4  \cf8 \strokec8 "./IERC20.sol"\cf6 \strokec6 ;\cf4 \cb1 \strokec4 \
\cf5 \cb3 \strokec5 import\cf4 \strokec4  \cf8 \strokec8 "./extensions/IERC20Metadata.sol"\cf6 \strokec6 ;\cf4 \cb1 \strokec4 \
\cf5 \cb3 \strokec5 import\cf4 \strokec4  \cf8 \strokec8 "../../utils/Context.sol"\cf6 \strokec6 ;\cf4 \cb1 \strokec4 \
\
\pard\pardeftab720\partightenfactor0
\cf2 \cb3 \strokec2 /**\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2  * @dev Implementation of the \{IERC20\} interface.\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2  *\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2  * This implementation is agnostic to the way tokens are created. This means\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2  * that a supply mechanism has to be added in a derived contract using \{_mint\}.\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2  * For a generic mechanism see \{ERC20PresetMinterPauser\}.\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2  *\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2  * TIP: For a detailed writeup see our guide\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2  * https://forum.zeppelin.solutions/t/how-to-implement-erc20-supply-mechanisms/226[How\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2  * to implement supply mechanisms].\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2  *\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2  * We have followed general OpenZeppelin Contracts guidelines: functions revert\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2  * instead returning `false` on failure. This behavior is nonetheless\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2  * conventional and does not conflict with the expectations of ERC20\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2  * applications.\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2  *\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2  * Additionally, an \{Approval\} event is emitted on calls to \{transferFrom\}.\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2  * This allows applications to reconstruct the allowance for all accounts just\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2  * by listening to said events. Other implementations of the EIP may not emit\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2  * these events, as it isn't required by the specification.\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2  *\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2  * Finally, the non-standard \{decreaseAllowance\} and \{increaseAllowance\}\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2  * functions have been added to mitigate the well-known issues around setting\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2  * allowances. See \{IERC20-approve\}.\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2  */\cf4 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf5 \cb3 \strokec5 contract\cf4 \strokec4  ERC20 \cf5 \strokec5 is\cf4 \strokec4  Context\cf6 \strokec6 ,\cf4 \strokec4  IERC20\cf6 \strokec6 ,\cf4 \strokec4  IERC20Metadata \cf6 \strokec6 \{\cf4 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf4 \cb3 \strokec4     \cf5 \strokec5 mapping\cf6 \strokec6 (\cf5 \strokec5 address\cf4 \strokec4  => \cf5 \strokec5 uint256\cf6 \strokec6 )\cf4 \strokec4  \cf9 \strokec9 private\cf4 \strokec4  _balances\cf6 \strokec6 ;\cf4 \cb1 \strokec4 \
\
\cf4 \cb3 \strokec4     \cf5 \strokec5 mapping\cf6 \strokec6 (\cf5 \strokec5 address\cf4 \strokec4  => \cf5 \strokec5 mapping\cf6 \strokec6 (\cf5 \strokec5 address\cf4 \strokec4  => \cf5 \strokec5 uint256\cf6 \strokec6 ))\cf4 \strokec4  \cf9 \strokec9 private\cf4 \strokec4  _allowances\cf6 \strokec6 ;\cf4 \cb1 \strokec4 \
\
\cf4 \cb3 \strokec4     \cf5 \strokec5 uint256\cf4 \strokec4  \cf9 \strokec9 private\cf4 \strokec4  _totalSupply\cf6 \strokec6 ;\cf4 \cb1 \strokec4 \
\
\cf4 \cb3 \strokec4     \cf5 \strokec5 string\cf4 \strokec4  \cf9 \strokec9 private\cf4 \strokec4  _name\cf6 \strokec6 ;\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4     \cf5 \strokec5 string\cf4 \strokec4  \cf9 \strokec9 private\cf4 \strokec4  _symbol\cf6 \strokec6 ;\cf4 \cb1 \strokec4 \
\
\cf4 \cb3 \strokec4     \cf2 \strokec2 /**\cf4 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf2 \cb3 \strokec2      * @dev Sets the values for \{name\} and \{symbol\}.\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      *\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      * The default value of \{decimals\} is 18. To select a different value for\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      * \{decimals\} you should overload it.\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      *\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      * All two of these values are immutable: they can only be set once during\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      * construction.\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      */\cf4 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf4 \cb3 \strokec4     \cf10 \strokec10 constructor\cf6 \strokec6 (\cf5 \strokec5 string\cf4 \strokec4  \cf11 \strokec11 memory\cf4 \strokec4  name_\cf6 \strokec6 ,\cf4 \strokec4  \cf5 \strokec5 string\cf4 \strokec4  \cf11 \strokec11 memory\cf4 \strokec4  symbol_\cf6 \strokec6 )\cf4 \strokec4  \cf6 \strokec6 \{\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4         _name \cf6 \strokec6 =\cf4 \strokec4  name_\cf6 \strokec6 ;\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4         _symbol \cf6 \strokec6 =\cf4 \strokec4  symbol_\cf6 \strokec6 ;\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4     \cf6 \strokec6 \}\cf4 \cb1 \strokec4 \
\
\cf4 \cb3 \strokec4     \cf2 \strokec2 /**\cf4 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf2 \cb3 \strokec2      * @dev Returns the name of the token.\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      */\cf4 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf4 \cb3 \strokec4     \cf5 \strokec5 function\cf4 \strokec4  name\cf6 \strokec6 ()\cf4 \strokec4  \cf9 \strokec9 public\cf4 \strokec4  \cf9 \strokec9 view\cf4 \strokec4  \cf12 \strokec12 virtual\cf4 \strokec4  \cf13 \strokec13 override\cf4 \strokec4  \cf14 \strokec14 returns\cf4 \strokec4  \cf6 \strokec6 (\cf5 \strokec5 string\cf4 \strokec4  \cf11 \strokec11 memory\cf6 \strokec6 )\cf4 \strokec4  \cf6 \strokec6 \{\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4         \cf14 \strokec14 return\cf4 \strokec4  _name\cf6 \strokec6 ;\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4     \cf6 \strokec6 \}\cf4 \cb1 \strokec4 \
\
\cf4 \cb3 \strokec4     \cf2 \strokec2 /**\cf4 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf2 \cb3 \strokec2      * @dev Returns the symbol of the token, usually a shorter version of the\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      * name.\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      */\cf4 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf4 \cb3 \strokec4     \cf5 \strokec5 function\cf4 \strokec4  symbol\cf6 \strokec6 ()\cf4 \strokec4  \cf9 \strokec9 public\cf4 \strokec4  \cf9 \strokec9 view\cf4 \strokec4  \cf12 \strokec12 virtual\cf4 \strokec4  \cf13 \strokec13 override\cf4 \strokec4  \cf14 \strokec14 returns\cf4 \strokec4  \cf6 \strokec6 (\cf5 \strokec5 string\cf4 \strokec4  \cf11 \strokec11 memory\cf6 \strokec6 )\cf4 \strokec4  \cf6 \strokec6 \{\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4         \cf14 \strokec14 return\cf4 \strokec4  _symbol\cf6 \strokec6 ;\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4     \cf6 \strokec6 \}\cf4 \cb1 \strokec4 \
\
\cf4 \cb3 \strokec4     \cf2 \strokec2 /**\cf4 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf2 \cb3 \strokec2      * @dev Returns the number of decimals used to get its user representation.\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      * For example, if `decimals` equals `2`, a balance of `505` tokens should\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      * be displayed to a user as `5.05` (`505 / 10 ** 2`).\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      *\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      * Tokens usually opt for a value of 18, imitating the relationship between\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      * Ether and Wei. This is the value \{ERC20\} uses, unless this function is\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      * overridden;\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      *\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      * NOTE: This information is only used for _display_ purposes: it in\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      * no way affects any of the arithmetic of the contract, including\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      * \{IERC20-balanceOf\} and \{IERC20-transfer\}.\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      */\cf4 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf4 \cb3 \strokec4     \cf5 \strokec5 function\cf4 \strokec4  decimals\cf6 \strokec6 ()\cf4 \strokec4  \cf9 \strokec9 public\cf4 \strokec4  \cf9 \strokec9 view\cf4 \strokec4  \cf12 \strokec12 virtual\cf4 \strokec4  \cf13 \strokec13 override\cf4 \strokec4  \cf14 \strokec14 returns\cf4 \strokec4  \cf6 \strokec6 (\cf5 \strokec5 uint8\cf6 \strokec6 )\cf4 \strokec4  \cf6 \strokec6 \{\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4         \cf14 \strokec14 return\cf4 \strokec4  \cf7 \strokec7 18\cf6 \strokec6 ;\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4     \cf6 \strokec6 \}\cf4 \cb1 \strokec4 \
\
\cf4 \cb3 \strokec4     \cf2 \strokec2 /**\cf4 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf2 \cb3 \strokec2      * @dev See \{IERC20-totalSupply\}.\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      */\cf4 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf4 \cb3 \strokec4     \cf5 \strokec5 function\cf4 \strokec4  totalSupply\cf6 \strokec6 ()\cf4 \strokec4  \cf9 \strokec9 public\cf4 \strokec4  \cf9 \strokec9 view\cf4 \strokec4  \cf12 \strokec12 virtual\cf4 \strokec4  \cf13 \strokec13 override\cf4 \strokec4  \cf14 \strokec14 returns\cf4 \strokec4  \cf6 \strokec6 (\cf5 \strokec5 uint256\cf6 \strokec6 )\cf4 \strokec4  \cf6 \strokec6 \{\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4         \cf14 \strokec14 return\cf4 \strokec4  _totalSupply\cf6 \strokec6 ;\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4     \cf6 \strokec6 \}\cf4 \cb1 \strokec4 \
\
\cf4 \cb3 \strokec4     \cf2 \strokec2 /**\cf4 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf2 \cb3 \strokec2      * @dev See \{IERC20-balanceOf\}.\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      */\cf4 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf4 \cb3 \strokec4     \cf5 \strokec5 function\cf4 \strokec4  balanceOf\cf6 \strokec6 (\cf5 \strokec5 address\cf4 \strokec4  account\cf6 \strokec6 )\cf4 \strokec4  \cf9 \strokec9 public\cf4 \strokec4  \cf9 \strokec9 view\cf4 \strokec4  \cf12 \strokec12 virtual\cf4 \strokec4  \cf13 \strokec13 override\cf4 \strokec4  \cf14 \strokec14 returns\cf4 \strokec4  \cf6 \strokec6 (\cf5 \strokec5 uint256\cf6 \strokec6 )\cf4 \strokec4  \cf6 \strokec6 \{\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4         \cf14 \strokec14 return\cf4 \strokec4  _balances\cf6 \strokec6 [\cf4 \strokec4 account\cf6 \strokec6 ];\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4     \cf6 \strokec6 \}\cf4 \cb1 \strokec4 \
\
\cf4 \cb3 \strokec4     \cf2 \strokec2 /**\cf4 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf2 \cb3 \strokec2      * @dev See \{IERC20-transfer\}.\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      *\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      * Requirements:\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      *\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      * - `to` cannot be the zero address.\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      * - the caller must have a balance of at least `amount`.\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      */\cf4 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf4 \cb3 \strokec4     \cf5 \strokec5 function\cf4 \strokec4  transfer\cf6 \strokec6 (\cf5 \strokec5 address\cf4 \strokec4  to\cf6 \strokec6 ,\cf4 \strokec4  \cf5 \strokec5 uint256\cf4 \strokec4  amount\cf6 \strokec6 )\cf4 \strokec4  \cf9 \strokec9 public\cf4 \strokec4  \cf12 \strokec12 virtual\cf4 \strokec4  \cf13 \strokec13 override\cf4 \strokec4  \cf14 \strokec14 returns\cf4 \strokec4  \cf6 \strokec6 (\cf5 \strokec5 bool\cf6 \strokec6 )\cf4 \strokec4  \cf6 \strokec6 \{\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4         \cf5 \strokec5 address\cf4 \strokec4  owner \cf6 \strokec6 =\cf4 \strokec4  _msgSender\cf6 \strokec6 ();\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4         _transfer\cf6 \strokec6 (\cf4 \strokec4 owner\cf6 \strokec6 ,\cf4 \strokec4  to\cf6 \strokec6 ,\cf4 \strokec4  amount\cf6 \strokec6 );\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4         \cf14 \strokec14 return\cf4 \strokec4  \cf5 \strokec5 true\cf6 \strokec6 ;\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4     \cf6 \strokec6 \}\cf4 \cb1 \strokec4 \
\
\cf4 \cb3 \strokec4     \cf2 \strokec2 /**\cf4 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf2 \cb3 \strokec2      * @dev See \{IERC20-allowance\}.\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      */\cf4 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf4 \cb3 \strokec4     \cf5 \strokec5 function\cf4 \strokec4  allowance\cf6 \strokec6 (\cf5 \strokec5 address\cf4 \strokec4  owner\cf6 \strokec6 ,\cf4 \strokec4  \cf5 \strokec5 address\cf4 \strokec4  spender\cf6 \strokec6 )\cf4 \strokec4  \cf9 \strokec9 public\cf4 \strokec4  \cf9 \strokec9 view\cf4 \strokec4  \cf12 \strokec12 virtual\cf4 \strokec4  \cf13 \strokec13 override\cf4 \strokec4  \cf14 \strokec14 returns\cf4 \strokec4  \cf6 \strokec6 (\cf5 \strokec5 uint256\cf6 \strokec6 )\cf4 \strokec4  \cf6 \strokec6 \{\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4         \cf14 \strokec14 return\cf4 \strokec4  _allowances\cf6 \strokec6 [\cf4 \strokec4 owner\cf6 \strokec6 ][\cf4 \strokec4 spender\cf6 \strokec6 ];\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4     \cf6 \strokec6 \}\cf4 \cb1 \strokec4 \
\
\cf4 \cb3 \strokec4     \cf2 \strokec2 /**\cf4 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf2 \cb3 \strokec2      * @dev See \{IERC20-approve\}.\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      *\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      * NOTE: If `amount` is the maximum `uint256`, the allowance is not updated on\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      * `transferFrom`. This is semantically equivalent to an infinite approval.\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      *\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      * Requirements:\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      *\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      * - `spender` cannot be the zero address.\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      */\cf4 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf4 \cb3 \strokec4     \cf5 \strokec5 function\cf4 \strokec4  approve\cf6 \strokec6 (\cf5 \strokec5 address\cf4 \strokec4  spender\cf6 \strokec6 ,\cf4 \strokec4  \cf5 \strokec5 uint256\cf4 \strokec4  amount\cf6 \strokec6 )\cf4 \strokec4  \cf9 \strokec9 public\cf4 \strokec4  \cf12 \strokec12 virtual\cf4 \strokec4  \cf13 \strokec13 override\cf4 \strokec4  \cf14 \strokec14 returns\cf4 \strokec4  \cf6 \strokec6 (\cf5 \strokec5 bool\cf6 \strokec6 )\cf4 \strokec4  \cf6 \strokec6 \{\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4         \cf5 \strokec5 address\cf4 \strokec4  owner \cf6 \strokec6 =\cf4 \strokec4  _msgSender\cf6 \strokec6 ();\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4         _approve\cf6 \strokec6 (\cf4 \strokec4 owner\cf6 \strokec6 ,\cf4 \strokec4  spender\cf6 \strokec6 ,\cf4 \strokec4  amount\cf6 \strokec6 );\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4         \cf14 \strokec14 return\cf4 \strokec4  \cf5 \strokec5 true\cf6 \strokec6 ;\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4     \cf6 \strokec6 \}\cf4 \cb1 \strokec4 \
\
\cf4 \cb3 \strokec4     \cf2 \strokec2 /**\cf4 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf2 \cb3 \strokec2      * @dev See \{IERC20-transferFrom\}.\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      *\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      * Emits an \{Approval\} event indicating the updated allowance. This is not\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      * required by the EIP. See the note at the beginning of \{ERC20\}.\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      *\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      * NOTE: Does not update the allowance if the current allowance\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      * is the maximum `uint256`.\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      *\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      * Requirements:\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      *\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      * - `from` and `to` cannot be the zero address.\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      * - `from` must have a balance of at least `amount`.\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      * - the caller must have allowance for ``from``'s tokens of at least\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      * `amount`.\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      */\cf4 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf4 \cb3 \strokec4     \cf5 \strokec5 function\cf4 \strokec4  transferFrom\cf6 \strokec6 (\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4         \cf5 \strokec5 address\cf4 \strokec4  from\cf6 \strokec6 ,\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4         \cf5 \strokec5 address\cf4 \strokec4  to\cf6 \strokec6 ,\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4         \cf5 \strokec5 uint256\cf4 \strokec4  amount\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4     \cf6 \strokec6 )\cf4 \strokec4  \cf9 \strokec9 public\cf4 \strokec4  \cf12 \strokec12 virtual\cf4 \strokec4  \cf13 \strokec13 override\cf4 \strokec4  \cf14 \strokec14 returns\cf4 \strokec4  \cf6 \strokec6 (\cf5 \strokec5 bool\cf6 \strokec6 )\cf4 \strokec4  \cf6 \strokec6 \{\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4         \cf5 \strokec5 address\cf4 \strokec4  spender \cf6 \strokec6 =\cf4 \strokec4  _msgSender\cf6 \strokec6 ();\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4         _spendAllowance\cf6 \strokec6 (\cf4 \strokec4 from\cf6 \strokec6 ,\cf4 \strokec4  spender\cf6 \strokec6 ,\cf4 \strokec4  amount\cf6 \strokec6 );\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4         _transfer\cf6 \strokec6 (\cf4 \strokec4 from\cf6 \strokec6 ,\cf4 \strokec4  to\cf6 \strokec6 ,\cf4 \strokec4  amount\cf6 \strokec6 );\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4         \cf14 \strokec14 return\cf4 \strokec4  \cf5 \strokec5 true\cf6 \strokec6 ;\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4     \cf6 \strokec6 \}\cf4 \cb1 \strokec4 \
\
\cf4 \cb3 \strokec4     \cf2 \strokec2 /**\cf4 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf2 \cb3 \strokec2      * @dev Atomically increases the allowance granted to `spender` by the caller.\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      *\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      * This is an alternative to \{approve\} that can be used as a mitigation for\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      * problems described in \{IERC20-approve\}.\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      *\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      * Emits an \{Approval\} event indicating the updated allowance.\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      *\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      * Requirements:\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      *\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      * - `spender` cannot be the zero address.\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      */\cf4 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf4 \cb3 \strokec4     \cf5 \strokec5 function\cf4 \strokec4  increaseAllowance\cf6 \strokec6 (\cf5 \strokec5 address\cf4 \strokec4  spender\cf6 \strokec6 ,\cf4 \strokec4  \cf5 \strokec5 uint256\cf4 \strokec4  addedValue\cf6 \strokec6 )\cf4 \strokec4  \cf9 \strokec9 public\cf4 \strokec4  \cf12 \strokec12 virtual\cf4 \strokec4  \cf14 \strokec14 returns\cf4 \strokec4  \cf6 \strokec6 (\cf5 \strokec5 bool\cf6 \strokec6 )\cf4 \strokec4  \cf6 \strokec6 \{\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4         \cf5 \strokec5 address\cf4 \strokec4  owner \cf6 \strokec6 =\cf4 \strokec4  _msgSender\cf6 \strokec6 ();\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4         _approve\cf6 \strokec6 (\cf4 \strokec4 owner\cf6 \strokec6 ,\cf4 \strokec4  spender\cf6 \strokec6 ,\cf4 \strokec4  allowance\cf6 \strokec6 (\cf4 \strokec4 owner\cf6 \strokec6 ,\cf4 \strokec4  spender\cf6 \strokec6 )\cf4 \strokec4  \cf6 \strokec6 +\cf4 \strokec4  addedValue\cf6 \strokec6 );\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4         \cf14 \strokec14 return\cf4 \strokec4  \cf5 \strokec5 true\cf6 \strokec6 ;\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4     \cf6 \strokec6 \}\cf4 \cb1 \strokec4 \
\
\cf4 \cb3 \strokec4     \cf2 \strokec2 /**\cf4 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf2 \cb3 \strokec2      * @dev Atomically decreases the allowance granted to `spender` by the caller.\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      *\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      * This is an alternative to \{approve\} that can be used as a mitigation for\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      * problems described in \{IERC20-approve\}.\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      *\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      * Emits an \{Approval\} event indicating the updated allowance.\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      *\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      * Requirements:\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      *\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      * - `spender` cannot be the zero address.\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      * - `spender` must have allowance for the caller of at least\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      * `subtractedValue`.\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      */\cf4 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf4 \cb3 \strokec4     \cf5 \strokec5 function\cf4 \strokec4  decreaseAllowance\cf6 \strokec6 (\cf5 \strokec5 address\cf4 \strokec4  spender\cf6 \strokec6 ,\cf4 \strokec4  \cf5 \strokec5 uint256\cf4 \strokec4  subtractedValue\cf6 \strokec6 )\cf4 \strokec4  \cf9 \strokec9 public\cf4 \strokec4  \cf12 \strokec12 virtual\cf4 \strokec4  \cf14 \strokec14 returns\cf4 \strokec4  \cf6 \strokec6 (\cf5 \strokec5 bool\cf6 \strokec6 )\cf4 \strokec4  \cf6 \strokec6 \{\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4         \cf5 \strokec5 address\cf4 \strokec4  owner \cf6 \strokec6 =\cf4 \strokec4  _msgSender\cf6 \strokec6 ();\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4         \cf5 \strokec5 uint256\cf4 \strokec4  currentAllowance \cf6 \strokec6 =\cf4 \strokec4  allowance\cf6 \strokec6 (\cf4 \strokec4 owner\cf6 \strokec6 ,\cf4 \strokec4  spender\cf6 \strokec6 );\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4         \cf15 \strokec15 require\cf6 \strokec6 (\cf4 \strokec4 currentAllowance \cf6 \strokec6 >=\cf4 \strokec4  subtractedValue\cf6 \strokec6 ,\cf4 \strokec4  \cf8 \strokec8 "ERC20: decreased allowance below zero"\cf6 \strokec6 );\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4         unchecked \cf6 \strokec6 \{\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4             _approve\cf6 \strokec6 (\cf4 \strokec4 owner\cf6 \strokec6 ,\cf4 \strokec4  spender\cf6 \strokec6 ,\cf4 \strokec4  currentAllowance \cf6 \strokec6 -\cf4 \strokec4  subtractedValue\cf6 \strokec6 );\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4         \cf6 \strokec6 \}\cf4 \cb1 \strokec4 \
\
\cf4 \cb3 \strokec4         \cf14 \strokec14 return\cf4 \strokec4  \cf5 \strokec5 true\cf6 \strokec6 ;\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4     \cf6 \strokec6 \}\cf4 \cb1 \strokec4 \
\
\cf4 \cb3 \strokec4     \cf2 \strokec2 /**\cf4 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf2 \cb3 \strokec2      * @dev Moves `amount` of tokens from `from` to `to`.\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      *\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      * This internal function is equivalent to \{transfer\}, and can be used to\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      * e.g. implement automatic token fees, slashing mechanisms, etc.\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      *\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      * Emits a \{Transfer\} event.\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      *\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      * Requirements:\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      *\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      * - `from` cannot be the zero address.\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      * - `to` cannot be the zero address.\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      * - `from` must have a balance of at least `amount`.\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      */\cf4 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf4 \cb3 \strokec4     \cf5 \strokec5 function\cf4 \strokec4  _transfer\cf6 \strokec6 (\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4         \cf5 \strokec5 address\cf4 \strokec4  from\cf6 \strokec6 ,\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4         \cf5 \strokec5 address\cf4 \strokec4  to\cf6 \strokec6 ,\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4         \cf5 \strokec5 uint256\cf4 \strokec4  amount\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4     \cf6 \strokec6 )\cf4 \strokec4  \cf9 \strokec9 internal\cf4 \strokec4  \cf12 \strokec12 virtual\cf4 \strokec4  \cf6 \strokec6 \{\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4         \cf15 \strokec15 require\cf6 \strokec6 (\cf4 \strokec4 from \cf6 \strokec6 !=\cf4 \strokec4  \cf5 \strokec5 address\cf6 \strokec6 (\cf7 \strokec7 0\cf6 \strokec6 ),\cf4 \strokec4  \cf8 \strokec8 "ERC20: transfer from the zero address"\cf6 \strokec6 );\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4         \cf15 \strokec15 require\cf6 \strokec6 (\cf4 \strokec4 to \cf6 \strokec6 !=\cf4 \strokec4  \cf5 \strokec5 address\cf6 \strokec6 (\cf7 \strokec7 0\cf6 \strokec6 ),\cf4 \strokec4  \cf8 \strokec8 "ERC20: transfer to the zero address"\cf6 \strokec6 );\cf4 \cb1 \strokec4 \
\
\cf4 \cb3 \strokec4         _beforeTokenTransfer\cf6 \strokec6 (\cf4 \strokec4 from\cf6 \strokec6 ,\cf4 \strokec4  to\cf6 \strokec6 ,\cf4 \strokec4  amount\cf6 \strokec6 );\cf4 \cb1 \strokec4 \
\
\cf4 \cb3 \strokec4         \cf5 \strokec5 uint256\cf4 \strokec4  fromBalance \cf6 \strokec6 =\cf4 \strokec4  _balances\cf6 \strokec6 [\cf4 \strokec4 from\cf6 \strokec6 ];\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4         \cf15 \strokec15 require\cf6 \strokec6 (\cf4 \strokec4 fromBalance \cf6 \strokec6 >=\cf4 \strokec4  amount\cf6 \strokec6 ,\cf4 \strokec4  \cf8 \strokec8 "ERC20: transfer amount exceeds balance"\cf6 \strokec6 );\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4         unchecked \cf6 \strokec6 \{\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4             _balances\cf6 \strokec6 [\cf4 \strokec4 from\cf6 \strokec6 ]\cf4 \strokec4  \cf6 \strokec6 =\cf4 \strokec4  fromBalance \cf6 \strokec6 -\cf4 \strokec4  amount\cf6 \strokec6 ;\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4         \cf6 \strokec6 \}\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4         _balances\cf6 \strokec6 [\cf4 \strokec4 to\cf6 \strokec6 ]\cf4 \strokec4  \cf6 \strokec6 +=\cf4 \strokec4  amount\cf6 \strokec6 ;\cf4 \cb1 \strokec4 \
\
\cf4 \cb3 \strokec4         \cf5 \strokec5 emit\cf4 \strokec4  Transfer\cf6 \strokec6 (\cf4 \strokec4 from\cf6 \strokec6 ,\cf4 \strokec4  to\cf6 \strokec6 ,\cf4 \strokec4  amount\cf6 \strokec6 );\cf4 \cb1 \strokec4 \
\
\cf4 \cb3 \strokec4         _afterTokenTransfer\cf6 \strokec6 (\cf4 \strokec4 from\cf6 \strokec6 ,\cf4 \strokec4  to\cf6 \strokec6 ,\cf4 \strokec4  amount\cf6 \strokec6 );\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4     \cf6 \strokec6 \}\cf4 \cb1 \strokec4 \
\
\cf4 \cb3 \strokec4     \cf2 \strokec2 /** @dev Creates `amount` tokens and assigns them to `account`, increasing\cf4 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf2 \cb3 \strokec2      * the total supply.\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      *\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      * Emits a \{Transfer\} event with `from` set to the zero address.\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      *\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      * Requirements:\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      *\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      * - `account` cannot be the zero address.\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      */\cf4 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf4 \cb3 \strokec4     \cf5 \strokec5 function\cf4 \strokec4  _mint\cf6 \strokec6 (\cf5 \strokec5 address\cf4 \strokec4  account\cf6 \strokec6 ,\cf4 \strokec4  \cf5 \strokec5 uint256\cf4 \strokec4  amount\cf6 \strokec6 )\cf4 \strokec4  \cf9 \strokec9 internal\cf4 \strokec4  \cf12 \strokec12 virtual\cf4 \strokec4  \cf6 \strokec6 \{\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4         \cf15 \strokec15 require\cf6 \strokec6 (\cf4 \strokec4 account \cf6 \strokec6 !=\cf4 \strokec4  \cf5 \strokec5 address\cf6 \strokec6 (\cf7 \strokec7 0\cf6 \strokec6 ),\cf4 \strokec4  \cf8 \strokec8 "ERC20: mint to the zero address"\cf6 \strokec6 );\cf4 \cb1 \strokec4 \
\
\cf4 \cb3 \strokec4         _beforeTokenTransfer\cf6 \strokec6 (\cf5 \strokec5 address\cf6 \strokec6 (\cf7 \strokec7 0\cf6 \strokec6 ),\cf4 \strokec4  account\cf6 \strokec6 ,\cf4 \strokec4  amount\cf6 \strokec6 );\cf4 \cb1 \strokec4 \
\
\cf4 \cb3 \strokec4         _totalSupply \cf6 \strokec6 +=\cf4 \strokec4  amount\cf6 \strokec6 ;\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4         _balances\cf6 \strokec6 [\cf4 \strokec4 account\cf6 \strokec6 ]\cf4 \strokec4  \cf6 \strokec6 +=\cf4 \strokec4  amount\cf6 \strokec6 ;\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4         \cf5 \strokec5 emit\cf4 \strokec4  Transfer\cf6 \strokec6 (\cf5 \strokec5 address\cf6 \strokec6 (\cf7 \strokec7 0\cf6 \strokec6 ),\cf4 \strokec4  account\cf6 \strokec6 ,\cf4 \strokec4  amount\cf6 \strokec6 );\cf4 \cb1 \strokec4 \
\
\cf4 \cb3 \strokec4         _afterTokenTransfer\cf6 \strokec6 (\cf5 \strokec5 address\cf6 \strokec6 (\cf7 \strokec7 0\cf6 \strokec6 ),\cf4 \strokec4  account\cf6 \strokec6 ,\cf4 \strokec4  amount\cf6 \strokec6 );\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4     \cf6 \strokec6 \}\cf4 \cb1 \strokec4 \
\
\cf4 \cb3 \strokec4     \cf2 \strokec2 /**\cf4 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf2 \cb3 \strokec2      * @dev Destroys `amount` tokens from `account`, reducing the\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      * total supply.\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      *\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      * Emits a \{Transfer\} event with `to` set to the zero address.\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      *\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      * Requirements:\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      *\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      * - `account` cannot be the zero address.\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      * - `account` must have at least `amount` tokens.\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      */\cf4 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf4 \cb3 \strokec4     \cf5 \strokec5 function\cf4 \strokec4  _burn\cf6 \strokec6 (\cf5 \strokec5 address\cf4 \strokec4  account\cf6 \strokec6 ,\cf4 \strokec4  \cf5 \strokec5 uint256\cf4 \strokec4  amount\cf6 \strokec6 )\cf4 \strokec4  \cf9 \strokec9 internal\cf4 \strokec4  \cf12 \strokec12 virtual\cf4 \strokec4  \cf6 \strokec6 \{\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4         \cf15 \strokec15 require\cf6 \strokec6 (\cf4 \strokec4 account \cf6 \strokec6 !=\cf4 \strokec4  \cf5 \strokec5 address\cf6 \strokec6 (\cf7 \strokec7 0\cf6 \strokec6 ),\cf4 \strokec4  \cf8 \strokec8 "ERC20: burn from the zero address"\cf6 \strokec6 );\cf4 \cb1 \strokec4 \
\
\cf4 \cb3 \strokec4         _beforeTokenTransfer\cf6 \strokec6 (\cf4 \strokec4 account\cf6 \strokec6 ,\cf4 \strokec4  \cf5 \strokec5 address\cf6 \strokec6 (\cf7 \strokec7 0\cf6 \strokec6 ),\cf4 \strokec4  amount\cf6 \strokec6 );\cf4 \cb1 \strokec4 \
\
\cf4 \cb3 \strokec4         \cf5 \strokec5 uint256\cf4 \strokec4  accountBalance \cf6 \strokec6 =\cf4 \strokec4  _balances\cf6 \strokec6 [\cf4 \strokec4 account\cf6 \strokec6 ];\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4         \cf15 \strokec15 require\cf6 \strokec6 (\cf4 \strokec4 accountBalance \cf6 \strokec6 >=\cf4 \strokec4  amount\cf6 \strokec6 ,\cf4 \strokec4  \cf8 \strokec8 "ERC20: burn amount exceeds balance"\cf6 \strokec6 );\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4         unchecked \cf6 \strokec6 \{\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4             _balances\cf6 \strokec6 [\cf4 \strokec4 account\cf6 \strokec6 ]\cf4 \strokec4  \cf6 \strokec6 =\cf4 \strokec4  accountBalance \cf6 \strokec6 -\cf4 \strokec4  amount\cf6 \strokec6 ;\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4         \cf6 \strokec6 \}\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4         _totalSupply \cf6 \strokec6 -=\cf4 \strokec4  amount\cf6 \strokec6 ;\cf4 \cb1 \strokec4 \
\
\cf4 \cb3 \strokec4         \cf5 \strokec5 emit\cf4 \strokec4  Transfer\cf6 \strokec6 (\cf4 \strokec4 account\cf6 \strokec6 ,\cf4 \strokec4  \cf5 \strokec5 address\cf6 \strokec6 (\cf7 \strokec7 0\cf6 \strokec6 ),\cf4 \strokec4  amount\cf6 \strokec6 );\cf4 \cb1 \strokec4 \
\
\cf4 \cb3 \strokec4         _afterTokenTransfer\cf6 \strokec6 (\cf4 \strokec4 account\cf6 \strokec6 ,\cf4 \strokec4  \cf5 \strokec5 address\cf6 \strokec6 (\cf7 \strokec7 0\cf6 \strokec6 ),\cf4 \strokec4  amount\cf6 \strokec6 );\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4     \cf6 \strokec6 \}\cf4 \cb1 \strokec4 \
\
\cf4 \cb3 \strokec4     \cf2 \strokec2 /**\cf4 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf2 \cb3 \strokec2      * @dev Sets `amount` as the allowance of `spender` over the `owner` s tokens.\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      *\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      * This internal function is equivalent to `approve`, and can be used to\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      * e.g. set automatic allowances for certain subsystems, etc.\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      *\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      * Emits an \{Approval\} event.\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      *\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      * Requirements:\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      *\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      * - `owner` cannot be the zero address.\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      * - `spender` cannot be the zero address.\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      */\cf4 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf4 \cb3 \strokec4     \cf5 \strokec5 function\cf4 \strokec4  _approve\cf6 \strokec6 (\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4         \cf5 \strokec5 address\cf4 \strokec4  owner\cf6 \strokec6 ,\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4         \cf5 \strokec5 address\cf4 \strokec4  spender\cf6 \strokec6 ,\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4         \cf5 \strokec5 uint256\cf4 \strokec4  amount\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4     \cf6 \strokec6 )\cf4 \strokec4  \cf9 \strokec9 internal\cf4 \strokec4  \cf12 \strokec12 virtual\cf4 \strokec4  \cf6 \strokec6 \{\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4         \cf15 \strokec15 require\cf6 \strokec6 (\cf4 \strokec4 owner \cf6 \strokec6 !=\cf4 \strokec4  \cf5 \strokec5 address\cf6 \strokec6 (\cf7 \strokec7 0\cf6 \strokec6 ),\cf4 \strokec4  \cf8 \strokec8 "ERC20: approve from the zero address"\cf6 \strokec6 );\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4         \cf15 \strokec15 require\cf6 \strokec6 (\cf4 \strokec4 spender \cf6 \strokec6 !=\cf4 \strokec4  \cf5 \strokec5 address\cf6 \strokec6 (\cf7 \strokec7 0\cf6 \strokec6 ),\cf4 \strokec4  \cf8 \strokec8 "ERC20: approve to the zero address"\cf6 \strokec6 );\cf4 \cb1 \strokec4 \
\
\cf4 \cb3 \strokec4         _allowances\cf6 \strokec6 [\cf4 \strokec4 owner\cf6 \strokec6 ][\cf4 \strokec4 spender\cf6 \strokec6 ]\cf4 \strokec4  \cf6 \strokec6 =\cf4 \strokec4  amount\cf6 \strokec6 ;\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4         \cf5 \strokec5 emit\cf4 \strokec4  Approval\cf6 \strokec6 (\cf4 \strokec4 owner\cf6 \strokec6 ,\cf4 \strokec4  spender\cf6 \strokec6 ,\cf4 \strokec4  amount\cf6 \strokec6 );\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4     \cf6 \strokec6 \}\cf4 \cb1 \strokec4 \
\
\cf4 \cb3 \strokec4     \cf2 \strokec2 /**\cf4 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf2 \cb3 \strokec2      * @dev Updates `owner` s allowance for `spender` based on spent `amount`.\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      *\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      * Does not update the allowance amount in case of infinite allowance.\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      * Revert if not enough allowance is available.\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      *\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      * Might emit an \{Approval\} event.\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      */\cf4 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf4 \cb3 \strokec4     \cf5 \strokec5 function\cf4 \strokec4  _spendAllowance\cf6 \strokec6 (\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4         \cf5 \strokec5 address\cf4 \strokec4  owner\cf6 \strokec6 ,\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4         \cf5 \strokec5 address\cf4 \strokec4  spender\cf6 \strokec6 ,\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4         \cf5 \strokec5 uint256\cf4 \strokec4  amount\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4     \cf6 \strokec6 )\cf4 \strokec4  \cf9 \strokec9 internal\cf4 \strokec4  \cf12 \strokec12 virtual\cf4 \strokec4  \cf6 \strokec6 \{\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4         \cf5 \strokec5 uint256\cf4 \strokec4  currentAllowance \cf6 \strokec6 =\cf4 \strokec4  allowance\cf6 \strokec6 (\cf4 \strokec4 owner\cf6 \strokec6 ,\cf4 \strokec4  spender\cf6 \strokec6 );\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4         \cf16 \strokec16 if\cf4 \strokec4  \cf6 \strokec6 (\cf4 \strokec4 currentAllowance \cf6 \strokec6 !=\cf4 \strokec4  \cf5 \strokec5 type\cf6 \strokec6 (\cf5 \strokec5 uint256\cf6 \strokec6 ).\cf4 \strokec4 max\cf6 \strokec6 )\cf4 \strokec4  \cf6 \strokec6 \{\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4             \cf15 \strokec15 require\cf6 \strokec6 (\cf4 \strokec4 currentAllowance \cf6 \strokec6 >=\cf4 \strokec4  amount\cf6 \strokec6 ,\cf4 \strokec4  \cf8 \strokec8 "ERC20: insufficient allowance"\cf6 \strokec6 );\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4             unchecked \cf6 \strokec6 \{\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4                 _approve\cf6 \strokec6 (\cf4 \strokec4 owner\cf6 \strokec6 ,\cf4 \strokec4  spender\cf6 \strokec6 ,\cf4 \strokec4  currentAllowance \cf6 \strokec6 -\cf4 \strokec4  amount\cf6 \strokec6 );\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4             \cf6 \strokec6 \}\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4         \cf6 \strokec6 \}\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4     \cf6 \strokec6 \}\cf4 \cb1 \strokec4 \
\
\cf4 \cb3 \strokec4     \cf2 \strokec2 /**\cf4 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf2 \cb3 \strokec2      * @dev Hook that is called before any transfer of tokens. This includes\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      * minting and burning.\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      *\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      * Calling conditions:\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      *\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      * - when `from` and `to` are both non-zero, `amount` of ``from``'s tokens\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      * will be transferred to `to`.\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      * - when `from` is zero, `amount` tokens will be minted for `to`.\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      * - when `to` is zero, `amount` of ``from``'s tokens will be burned.\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      * - `from` and `to` are never both zero.\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      *\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      * To learn more about hooks, head to xref:ROOT:extending-contracts.adoc#using-hooks[Using Hooks].\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      */\cf4 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf4 \cb3 \strokec4     \cf5 \strokec5 function\cf4 \strokec4  _beforeTokenTransfer\cf6 \strokec6 (\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4         \cf5 \strokec5 address\cf4 \strokec4  from\cf6 \strokec6 ,\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4         \cf5 \strokec5 address\cf4 \strokec4  to\cf6 \strokec6 ,\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4         \cf5 \strokec5 uint256\cf4 \strokec4  amount\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4     \cf6 \strokec6 )\cf4 \strokec4  \cf9 \strokec9 internal\cf4 \strokec4  \cf12 \strokec12 virtual\cf4 \strokec4  \cf6 \strokec6 \{\}\cf4 \cb1 \strokec4 \
\
\cf4 \cb3 \strokec4     \cf2 \strokec2 /**\cf4 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf2 \cb3 \strokec2      * @dev Hook that is called after any transfer of tokens. This includes\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      * minting and burning.\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      *\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      * Calling conditions:\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      *\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      * - when `from` and `to` are both non-zero, `amount` of ``from``'s tokens\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      * has been transferred to `to`.\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      * - when `from` is zero, `amount` tokens have been minted for `to`.\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      * - when `to` is zero, `amount` of ``from``'s tokens have been burned.\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      * - `from` and `to` are never both zero.\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      *\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      * To learn more about hooks, head to xref:ROOT:extending-contracts.adoc#using-hooks[Using Hooks].\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2      */\cf4 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf4 \cb3 \strokec4     \cf5 \strokec5 function\cf4 \strokec4  _afterTokenTransfer\cf6 \strokec6 (\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4         \cf5 \strokec5 address\cf4 \strokec4  from\cf6 \strokec6 ,\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4         \cf5 \strokec5 address\cf4 \strokec4  to\cf6 \strokec6 ,\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4         \cf5 \strokec5 uint256\cf4 \strokec4  amount\cf4 \cb1 \strokec4 \
\cf4 \cb3 \strokec4     \cf6 \strokec6 )\cf4 \strokec4  \cf9 \strokec9 internal\cf4 \strokec4  \cf12 \strokec12 virtual\cf4 \strokec4  \cf6 \strokec6 \{\}\cf4 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf6 \cb3 \strokec6 \}\cf4 \cb1 \strokec4 \
}