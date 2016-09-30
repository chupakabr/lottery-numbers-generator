#!/bin/bash
 
# Print usage info
function usage() {
  echo "Usage: $0 "
  echo " * lotto   — Lotto"
  echo " * eurom   — Euro Millions"
  echo " * tball   — Thunderball"
  echo " * hotpick — Lotto Hotpicks"
  echo "More info about UK National Lottery visit https://www.national-lottery.co.uk/games/lotto"
}
 
# Check input params
if [ -z "$1" ]; then
  usage
  exit 1
fi
 
type=$1
 
# Generate random number from 1 up to {limit} and print it
function gen_num() {
  limit=$1
  echo -n $[1 + $[ RANDOM % $limit ]]" "
}
 
# Main app
echo -n "Your lucky numbers for $type are: "
case $type in
lotto)
  for i in {1..6}; do gen_num 59; done
  ;;
eurom)
  for i in {1..5}; do gen_num 50; done
  echo -n "+ lucky stars "
  for i in {1..2}; do gen_num 11; done
  ;;
tball)
  for i in {1..5}; do gen_num 39; done
  echo -n "+ thunderball "
  for i in {1..1}; do gen_num 14; done
  ;;
hotpick)
  for i in {1..5}; do gen_num 49; done
  ;;
*)
  usage
  ;;
esac
 
echo ""
echo "Good luck :)" 

