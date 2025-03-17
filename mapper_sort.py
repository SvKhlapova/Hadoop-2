#!/usr/bin/env python3
import sys

for line in sys.stdin:
    line = line.strip()
    word, count, uniquecount = line.split('\t')
    count = int(count)
    uniquecount = int(uniquecount)
    print(f'{count}\t{word}\t{uniquecount}')