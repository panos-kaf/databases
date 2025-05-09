import random
import sys

if len(sys.argv) != 3:
    print(f"Usage: {sys.argv[0]} N M")
    sys.exit(1)

N = int(sys.argv[1])
M = int(sys.argv[2])

for _ in range(N):
    print(random.randint(1, M))
