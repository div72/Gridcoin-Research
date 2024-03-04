// Copyright (c) 2009-2010 Satoshi Nakamoto
// Copyright (c) 2009-2024 The Bitcoin Core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or https://opensource.org/licenses/mit-license.php.

#include <primitives/block.h>

#include <hash.h>
#include <scrypt.h>

uint256 CBlockHeader::GetHash(const bool use_cache) const
{
    // The block hash cache field prevents repeated computations of the
    // block's hash in the block acceptance pipeline. It's particularly
    // effective for early blocks with expensive scrypt hashes. Dynamic
    // caching isn't the prettiest solution, but it provides an interim
    // performance advantage as we refactor legacy code.
    //
    // use_cache defaults to false to discourage use of the cache except
    // in carefully chosen single-threaded scenarios. Avoid hash caching
    // for block objects except where thread-safety is obvious and where
    // performance improves significantly.
    //
    if (use_cache) {
        if (!m_hash_cache.IsNull()) {
            return m_hash_cache;
        }

        m_hash_cache = ComputeHash();

        return m_hash_cache;
    }

    return ComputeHash();
}

uint256 CBlockHeader::GetPoWHash() const
{
    return scrypt_blockhash(CVOIDBEGIN(nVersion));
}

