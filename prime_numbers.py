def isPrime(number):

	primes = []

	for possiblePrime in range(2, number + 1):

		isPrime = True
		
		for num in range(2, int(possiblePrime ** 0.5) + 1):

			if possiblePrime % num == 0:

				isPrime = False

				break

		if isPrime:

			primes.append(possiblePrime)

	print('primes')
	return primes


def problem_3():

	# n = 600851475143
	n = 600851475
	# n = 1000

	listOfPrimes = isPrime(n)

	largestPrimeFactor = 2

	for num in listOfPrimes:

		if n % num == 0:

			if num > largestPrimeFactor:

				largestPrimeFactor = num

	print(largestPrimeFactor)				

	return largestPrimeFactor



if __name__ == '__main__':
	problem_3()
