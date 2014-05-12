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
  (1.upto(100).reduce(:+) ** 2 ) - (1..100).inject { |sum, n| sum += n**2 }
end

# problem_6 ==> 25164150


# <--------------------------------------------------------------------------->

# Problem 7: Find the 10_001st prime number.

def problem_7
  def is_prime?(num)
    (2..num-1).each { |x| return false if num % x == 0 }
    true
  end

  primes = []
  start_value = 2
  while (primes.length < 10001)
    primes << start_value if is_prime?(start_value)
    start_value += 1
  end

  puts primes[-1]
end

# problem_7 ==> 104743
# takes a long time to run, but it works!

# <--------------------------------------------------------------------------->

# Problem 8: Find the greatest product of five 
# consecutive digits in the 1000-digit number.

def problem_8
  num = "7316717653133062491922511967442657474235534919493496983520312774506326239578318016984801869478851843858615607891129494954595017379583319528532088055111254069874715852386305071569329096329522744304355766896648950445244523161731856403098711121722383113622298934233803081353362766142828064444866452387493035890729629049156044077239071381051585930796086670172427121883998797908792274921901699720888093776657273330010533678812202354218097512545405947522435258490771167055601360483958644670632441572215539753697817977846174064955149290862569321978468622482839722413756570560574902614079729686524145351004748216637048440319989000889524345065854122758866688116427171479924442928230863465674813919123162824586178664583591245665294765456828489128831426076900422421902267105562632111110937054421750694165896040807198403850962455444362981230987879927244284909188845801561660979191338754992005240636899125607176060588611646710940507754100225698315520005593572972571636269561882670428252483600823257530420752963450"
  greatest_product = 1
  new_product = 1
  index = 0
  while index <= num.length - 5
    num[index, 5].chars.each { |z| new_product *= z.to_i }
    if new_product >= greatest_product
      greatest_product = new_product
      new_product = 1
      index += 1
    else
      new_product = 1
      index += 1
    end
  end
  greatest_product
end

# problem_8 ==> 40824

# <--------------------------------------------------------------------------->

# Problem 9: Find the Pythagorean triplet for which
# a < b < c && a + b + c = 1000. Then, find the product a * b * c.

def problem_9(sum)
  array = []
  # Divide the number by two and then subtract one 
  # to ensure there are no zeros in the triplet.
  ((sum / 2) - 1).downto(1) { |n| array << n }

  # Iterate through possible c values. 
  array.each do |c|
    remainder = sum - c
    # Create and iterate another array to run through the 
    # difference of the sum and c. 
    array2 = (1..remainder).to_a
    array2.each do |a|
      b = remainder - a
      if (a**2 + b**2 == c**2)
        return puts a, b, c
      end
    end
  end
end

# problem_9 ==> [200, 375, 425]

# The problem asked to find the product a * b * c.
# I'm more interested in finding the triplet. 
# Nonetheless, the product is 31875000.

# <--------------------------------------------------------------------------->

# Problem 10: Find the sum of all the primes below 2_000_000.

# I came up with two solutions that will return the right answer:

# Using the Ruby's Prime module
def problem_10
  require 'prime'
  Prime.each(2_000_000).reduce(:+)
end

# Find all the prime numbers under 2_000_000, and push them into an array.
# Then iterate through the array to find the sum. 
# Takes a very looooooong time. The first solution is much better.  
def problem_10
  def is_prime?(num)
    (2..num-1).each { |x| return false if num % x == 0 }
    return true
  end

  primes = []
  (2..200_000_000).each do |num| 
    while num < 2_000_000
      if num.is_prime?
       primes << num
      end
    end
  end
  primes.reduce(:+)
end

# problem_10 ==> 142913828922

# <--------------------------------------------------------------------------->