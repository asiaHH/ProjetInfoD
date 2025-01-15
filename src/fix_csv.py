#!/usr/bin/env python3

import sys
import re

def main(file, output_file):
  with open(output_file, 'w') as g:
    with open(file, 'r') as f:
      # Count the number of commas in the first line
      h = f.readline()
      hcommas = h.count(',')
      g.write(h)
      # Process the rest of the file
      st = False
      rc = 0
      for line in f:
        # prevent false positives with escaped quotes
        l0 = re.sub(r'\\\\', '\\\\ ', line)
        # fix the quotes in the line
        l1 = re.sub(r'\\"', "\\'", l0)
        # Count the number of commas that are not inside quotes
        commas = l1.count(',') + rc
        for i in l1:
          if i == '"':
            st = not st
          elif st and i == ',':
            commas -= 1
        l2 = re.sub('\n', '', l1)
        g.write(l2)
        if commas != hcommas or st:
          rc = commas
        else:
          g.write('\n')
          rc = 0

if __name__ == '__main__':
  if len(sys.argv) != 3:
    print('Usage: python fix_csv.py input.csv output.csv')
  else:
    main(sys.argv[1], sys.argv[2])
