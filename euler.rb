# Problem 1: Add all the natural numbers below 1000
# that are multiples of 3 or 5. 

def problem_1
  0.upto(999).reduce do |sum, num|
    num % 3 == 0 || num % 5 == 0 ? sum + num : sum
  end
end

# problem_1 ==> 233168

# <--------------------------------------------------------------------------->

# Problem 2: For terms in the Fibonacci sequence
# whose values do not exceed four million, 
# find the sum of the even-valued terms.

def problem_2
  prev = 1
  current = 1
  sum = 0
  next_up = 0

  while current < 4000000
    next_up = prev + current
    sum += next_up if next_up.even?
    prev = current
    current = next_up
  end

  sum
end

# problem_2 ==> 4613732

# <--------------------------------------------------------------------------->

# Problem 3: Largest prime factor of 600851475143.

def problem_3
  def factors_for(num)
    return [] if num == 1
    factor = (2..num).find { |x| num % x == 0 }
    [factor] + factors_for(num / factor)
  end

  factors_for(600_851_475_143).max
end

# problem_3 ==> 6857

# <--------------------------------------------------------------------------->

# Problem 4: The largest palindrome made from the 
# product of two 3-digit numbers.

def problem_4
  def palindrome?(n)
    n.to_s == n.to_s.reverse
  end

  max = 0 
  100.upto(999).each do |a|
    a.upto(999).each do |b|
      max = a * b if palindrome?(a * b) && (a * b) > max
    end
  end
  max
end

# problem_4 ==> 906609

# <--------------------------------------------------------------------------->

# Problem 5: The smallest positive number that is 
# evenly divisible by all of the numbers from 1 to 20.

require 'rational'

def problem_5
  (1..20).inject(1) { |res, n| res.lcm n }
end

# problem_5 ==> 232792560

# <--------------------------------------------------------------------------->

# Problem 6: Find the difference between the sum of the squares 
# of the first one hundred natural numbers and the square of the sum.

def problem_6
  (1.upto(100).inject(:+) ** 2 ) - (1..100).inject { |sum, n| sum += n * n }
end

# problem_6 ==> 25164150


# <--------------------------------------------------------------------------->

# Problem 7: Find the 10_001st prime number.

def problem_7
  def is_prime?(num)
    (2..num-1).each do |x|
      return false if num % x == 0 
    end
    return true
  end

  primes = []
  startValue = 2
  while (primes.length < 10001)
    primes << startValue if is_prime?(startValue)
    startValue += 1
  end

  puts primes[-1]
end

# problem_7 ==> 104743
# takes a long time to run, but it works!

# <--------------------------------------------------------------------------->
















