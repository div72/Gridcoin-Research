#!/usr/bin/env bash
#
# Copyright (c) 2019 The Bitcoin Core developers
# Distributed under the MIT software license, see the accompanying
# file COPYING or http://www.opensource.org/licenses/mit-license.php.

export LC_ALL=C.UTF-8

set -o errexit; source ./ci/test/00_setup_env.sh
set -o errexit; source ./ci/test/03_before_install.sh
set -o errexit; source ./ci/test/04_install.sh
set -o errexit; source ./ci/test/05_before_script.sh
set -o errexit; source ./ci/test/06_script_a.sh
set -o errexit; source ./ci/test/06_script_b.sh

find .. | grep "release"
pwd
ls /home/runner/work/Gridcoin-Research/Gridcoin-Research/ci
ls /home/runner/work/Gridcoin-Research/Gridcoin-Research/ci/scratch/
ls /home/runner/work/Gridcoin-Research/Gridcoin-Research/ci/scratch/build/
ls /home/runner/work/Gridcoin-Research/Gridcoin-Research/ci/scratch/build/gridcoin-$HOST
mv /home/runner/work/Gridcoin-Research/Gridcoin-Research/ci/scratch/build/gridcoin-$HOST/release /tmp/release
for f in /tmp/release/*.exe; do
    sha256sum $f > $f.SHA256
done
