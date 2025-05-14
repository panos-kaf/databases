import random
import sys

N = int(sys.argv[1])

for _ in range(N):
	x = random.randint(1,50)
	y = random.randint(1,100)
	print(f"({x}, {y}),")
