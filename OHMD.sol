{\rtf1\ansi\ansicpg1252\cocoartf2707
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fnil\fcharset0 Menlo-Regular;}
{\colortbl;\red255\green255\blue255;\red79\green123\blue61;\red26\green26\blue41;\red172\green172\blue193;
\red70\green137\blue204;\red212\green212\blue212;\red167\green197\blue152;\red194\green126\blue101;\red237\green114\blue173;
}
{\*\expandedcolortbl;;\cssrgb\c37647\c54510\c30588;\cssrgb\c13333\c13725\c21176;\cssrgb\c72941\c73333\c80000;
\cssrgb\c33725\c61176\c83922;\cssrgb\c86275\c86275\c86275;\cssrgb\c70980\c80784\c65882;\cssrgb\c80784\c56863\c47059;\cssrgb\c95294\c54118\c73333;
}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\deftab720
\pard\pardeftab720\partightenfactor0

\f0\fs24 \cf2 \cb3 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec2 // SPDX-License-Identifier: UNLICENSED\cf4 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf5 \cb3 \strokec5 pragma\cf4 \strokec4  \cf5 \strokec5 solidity\cf4 \strokec4  \cf6 \strokec6 ^\cf7 \strokec7 0.8.9\cf6 \strokec6 ;\cf4 \cb1 \strokec4 \
\
\cf5 \cb3 \strokec5 import\cf4 \strokec4  \cf8 \strokec8 "@openzeppelin/contracts/token/ERC20/ERC20.sol"\cf6 \strokec6 ;\cf4 \cb1 \strokec4 \
\cf5 \cb3 \strokec5 import\cf4 \strokec4  \cf8 \strokec8 "@openzeppelin/contracts/access/Ownable.sol"\cf6 \strokec6 ;\cf4 \cb1 \strokec4 \
\
\cf5 \cb3 \strokec5 contract\cf4 \strokec4  OneHundredMillionDollars \cf5 \strokec5 is\cf4 \strokec4  ERC20\cf6 \strokec6 ,\cf4 \strokec4  Ownable \cf6 \strokec6 \{\cf4 \cb1 \strokec4 \
\
\pard\pardeftab720\partightenfactor0
\cf4 \cb3   \cf9 \strokec9 constructor\cf6 \strokec6 (\cf5 \strokec5 address\cf4 \strokec4  owner\cf6 \strokec6 )\cf4 \strokec4  ERC20\cf6 \strokec6 (\cf8 \strokec8 "One Hundred Million Dollars"\cf6 \strokec6 ,\cf4 \strokec4  \cf8 \strokec8 "OHMD"\cf6 \strokec6 )\cf4 \strokec4  \cf6 \strokec6 \{\cf4 \cb1 \strokec4 \
\cb3     _mint\cf6 \strokec6 (\cf4 \strokec4 owner\cf6 \strokec6 ,\cf4 \strokec4  \cf7 \strokec7 1\cf4 \strokec4 _000_000_000 \cf6 \strokec6 *\cf4 \strokec4  \cf7 \strokec7 10\cf4 \strokec4 **\cf7 \strokec7 18\cf6 \strokec6 );\cf4 \cb1 \strokec4 \
\cb3     _transferOwnership\cf6 \strokec6 (\cf4 \strokec4 owner\cf6 \strokec6 );\cf4 \cb1 \strokec4 \
\cb3   \cf6 \strokec6 \}\cf4 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf6 \cb3 \strokec6 \}\cf4 \cb1 \strokec4 \
}