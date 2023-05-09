import random
w = open("numbers.txt", 'w')
for _ in range(1000):
	w.write(str(random.randint(1,1001))+' ')
w.close()