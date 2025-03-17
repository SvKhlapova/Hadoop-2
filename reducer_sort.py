#!/usr/bin/env python3
import sys

for line in sys.stdin:
    count, word, uniquecount = line.strip().split('\t')
    count = int(count)
    uniquecount = int(uniquecount)
    print(f'{word}\t{count}\t{uniquecount}')