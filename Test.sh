#!/bin/bash
assert() {
  expected="$1"
  input="$2"

  ./out/bin/stonecc "$input" > ./out/bin/tmp.s || exit
  gcc -static -o ./out/bin/tmp ./out/bin/tmp.s
  ./out/bin/tmp
  actual="$?"

  if [ "$actual" = "$expected" ]; then
    echo "$input => $actual"
  else
    echo "$input => $expected expected, but got $actual"
    exit 1
  fi
}

assert 0 0
assert 42 42

echo OK