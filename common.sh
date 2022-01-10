bench_start(){
  export t1=$(date +%s.%N)
}

bench_stop(){
  t2=$(date +%s.%N)
  dt=$(echo $t2 $t1 | awk '{ print ($1 - $2) }')
  echo "$dt sec  $1"
}
