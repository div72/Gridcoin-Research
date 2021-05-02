./ci/test/test_run_all.sh

for f in releases/*.*; do
    sha256sum $f > $f.SHA256
done
