#! /bin/sh

. ./common.sh

bench_start

find testfiles/ -type f -exec sed -i 's/a/A/g' '{}' \;
find testfiles/ -type f -exec sed -i 's/A/a/g' '{}' \;

bench_stop $(basename "$0")
