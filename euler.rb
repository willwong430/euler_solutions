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

# Problem 8: Find the greatest product of five 
# consecutive digits in the 1000-digit number.

def problem_8
  num = "7316717653133062491922511967442657474235534919493496983520312774506326239578318016984801869478851843858615607891129494954595017379583319528532088055111254069874715852386305071569329096329522744304355766896648950445244523161731856403098711121722383113622298934233803081353362766142828064444866452387493035890729629049156044077239071381051585930796086670172427121883998797908792274921901699720888093776657273330010533678812202354218097512545405947522435258490771167055601360483958644670632441572215539753697817977846174064955149290862569321978468622482839722413756570560574902614079729686524145351004748216637048440319989000889524345065854122758866688116427171479924442928230863465674813919123162824586178664583591245665294765456828489128831426076900422421902267105562632111110937054421750694165896040807198403850962455444362981230987879927244284909188845801561660979191338754992005240636899125607176060588611646710940507754100225698315520005593572972571636269561882670428252483600823257530420752963450"
  greatest_product = 1
  current_product = 1
  x = 0
  y = 5
  while x <= num.length - 5
    num[x, y].chars.each { |z| current_product *= z.to_i }
    if current_product >= greatest_product
      greatest_product = current_product
      current_product = 1
      x += 1
    else
      current_product = 1
      x += 1
    end
  end
  greatest_product
end

# problem_8 ==> 40824

# <--------------------------------------------------------------------------->

# Problem 9: 
