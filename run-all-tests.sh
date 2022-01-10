#! /bin/sh

[ -d testfiles ] || ./make-testfiles.sh

echo patching $(find testfiles/ -type f | wc -l) files

all_results=""

while read testscript
do
  result=$("$testscript")
  echo "$result"
  all_results+="$result"$'\n'
done < <(find ./tests/ -name '*.sh')

printf "\nsorted:\n"

echo "$all_results" | sort -n
