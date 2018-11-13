def problem_4():

	for x in range(999, 1, -1):
		for y in range(x, 1, -1):

			product = int(x) * int(y) 
			if isPalindrome(product):
				print(str(product))


def isPalindrome(num):
	numToStr = str(num)

	if numToStr == reverse(numToStr):
		return True
	else:
		return False

	# lengthOfString = len(numToStr)

	# if lengthOfString >= 2:
	# 	splitString = lengthOfString // 2

	# 	firstHalf = numToStr[0:splitString-1]

	# 	# secondHalf = numToStr[-(splitString-1):]

	# 	print('firstHalf')
	# 	print(firstHalf)
	# 	# print('secondHalf')
	# 	# print(secondHalf)
	
	# else:
	# 	print('Single digit numbers are not isPalindrome')


def reverse(s):

	str = ""

	for i in s:
		str = i + str
	return str


if __name__ == '__main__':
	problem_4()