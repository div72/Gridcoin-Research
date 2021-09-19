// Copyright (c) 2019-2021 The Bitcoin Core developers
// Copyright (c) 2021 The Gridcoin developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#ifndef BITCOIN_UTIL_HASHER_H
#define BITCOIN_UTIL_HASHER_H

#include <uint256.h>

struct BlockHasher
{
    size_t operator()(const uint256& hash) const { return hash.GetUint64(); }
};

#endif // BITCOIN_UTIL_HASHER_H
