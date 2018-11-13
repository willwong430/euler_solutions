# Problem 1: Add all the natural numbers below 1000
# that are multiples of 3 or 5.

def problem_1():
	sum = 0
	for x in xrange(0, 1000):
		if x % 3 == 0:
			sum += x
		elif x % 5 == 0:
			sum += x
		else:
			continue
	print sum

# problem_1 ==> 233168
# <--------------------------------------------------------------------------->

# Problem 2: For terms in the Fibonacci sequence
# whose values do not exceed four million, 
# find the sum of the even-valued terms.


def problem_2():
	fib_sum = 0
	prev = 1
	next = 2
	
	while next <= 4000000:
		
		if next % 2 == 0:
			fib_sum += next
		temp = next 
		next = prev + next
		prev = temp
	print fib_sum   

# problem_2 ==> 4613732
		
# <--------------------------------------------------------------------------->

# Problem 3: Largest prime factor of 600851475143.
import math
def problem_3():
	n = 600851475143
	largest_prime_factor = 2
	for x in xrange(2, n//2):
		#check if x is a factor
		if n % x == 0:
			#check if x is a prime
			if isPrime(x):
				largest_prime_factor = x
	print largest_prime_factor

def isPrime(n):
	for x in range(2, int(math.sqrt(n))+1):
		if n % x == 0:
			return False
	return True
			

def problem_5():

	temp = True
	i = 20
	while temp:
		for x in range(1, 21):
			if i % x == 0:
				if x == 20:
					temp = False
					break
				continue
			else:
				break
		i += 1
		print i 
		
	print i






if __name__ == '__main__':
	problem_5()













