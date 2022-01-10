#! /usr/bin/env nix-shell
#! nix-shell -i sh -p sd

#! /bin/sh

# pro: fast
# con: no multi replace like with perl or sed

set -e

which sd >/dev/null # require sd program

. ./common.sh

bench_start

find testfiles/ -type f -print0 | xargs -0 sd a A
find testfiles/ -type f -print0 | xargs -0 sd A a

bench_stop $(basename "$0")
