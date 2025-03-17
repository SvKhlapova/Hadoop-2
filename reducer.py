#!/usr/bin/env python3
import sys
from collections import defaultdict

words_count = defaultdict(int)

for line in sys.stdin:
    line = line.strip()
    word, count = line.split('\t', 1)
    try:
        count = int(count)
    except ValueError:
        continue
    words_count[word] += count

for word, count in words_count.items():
    print(f'{word}\t{count}\t1')