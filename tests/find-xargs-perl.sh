#! /bin/sh

. ./common.sh

bench_start

find testfiles/ -type f -print0 | xargs -0 perl -p -i -e 's/a/A/g'
find testfiles/ -type f -print0 | xargs -0 perl -p -i -e 's/A/a/g'

bench_stop $(basename "$0")
