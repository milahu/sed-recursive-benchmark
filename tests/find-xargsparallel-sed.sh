#! /bin/sh

# result: slower than non-parallel xargs

. ./common.sh

bench_start

num_parallel=2

find testfiles/ -type f -print0 | xargs -0 -P $num_parallel sed -i 's/a/A/g'
find testfiles/ -type f -print0 | xargs -0 -P $num_parallel sed -i 's/A/a/g'

bench_stop $(basename "$0")
