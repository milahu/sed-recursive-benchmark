#! /bin/sh

. ./common.sh

bench_start

find testfiles/ -type f -print0 | xargs -0 sed -i 's/a/A/g'
find testfiles/ -type f -print0 | xargs -0 sed -i 's/A/a/g'

bench_stop $(basename "$0")
