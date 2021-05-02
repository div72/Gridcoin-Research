set -e

./ci/test_run_all.sh

for f in releases/*.*; do
    sha256sum $f > $f.SHA256
done
