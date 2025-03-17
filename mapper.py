#!/usr/bin/env python3
import sys
import re
from itertools import permutations

pattern = re.compile(r'[^A-Za-z\s]')

for line in sys.stdin:
    line = line.strip().lower()
    line = pattern.sub('', line)
    words = line.split()
    for word in words:
        if len(word) >= 3:
            sorted_word = ''.join(sorted(word))
            print(f'{sorted_word}\t1')
