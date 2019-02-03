# Программа игра "Однорукий бандит"

puts "Программа - Однорукий бандит"
print "Вы хотите сыграть в игру? (Y/N)"
togame = gets.strip.upcase

unless togame == "Y"

  puts "Очень жаль"
  exit

end

print "Введите свое имя: "
username = gets.strip.capitalize

print "Привет, #{username}! Сколько Вам лет? "
age = gets.to_i

if  age < 18

  puts "Очень жаль #{username} но Вам еще нет 18 лет"
  exit

end

balance = 100
strspace = " " * 80

puts "И так, #{username} приступим! Ваш первоначальный баланс 100$"

puts "Нажмите Enter для продолжения игры..."
gets

while balance > 0


  x = rand(0..9)
  y = rand(0..9)
  z = rand(0..9)

  print "\r| #{x} | #{y} | #{z} |"

  sum = 0


  if x == 0 && y == 0 && z == 0

    sum = 10

  elsif x == 1 && y == 1 && z == 1

    sum = 20

  elsif x == 2 && y == 2 && z == 2

    sum = 30

  elsif x == 3 && y == 3 && z == 3

    sum = 40

  elsif x == 4 && y == 4 && z == 4

    sum = 50

  elsif x == 5 && y == 5 && z == 5

    sum = 60

  elsif x == 6 && y == 6 && z == 6

    sum = -60

  elsif x == 7 && y == 7 && z == 7

    sum = 1_000_000

  elsif x == 8 && y == 8 && z == 8

    sum = 90

  elsif x == 9 && y == 9 && z == 9

    sum = 100

  end

  if sum == 0 && x == 1 && y == 2 && z == 3

    sum = 123

  end

  if sum == 0 && (x == y || x == z || y == z)

    sum = (x + y + z) * 2

  end

  if sum == 0

    sum = 0 - (x + y + z) * 2

  end

  if sum == 1_000_000

    message = "#{username} Вы сорвали jackpot в 1 000 000$"

  elsif sum > 0

    message = "Ваш баланс увеличился на #{sum}$"

  else

    message = "Ваш баланс уменьшился на #{sum}$"

  end

  balance = balance + sum

  print "| #{x} | #{y} | #{z} | Ваш баланс = #{balance}$. #{message}. Нажмите Enter для продолжения..."
  gets

  truble = rand(0..27)

  if sum == 1_000_000 || truble == (x + y + z)

    10.times do

      rand(5..15).times {print rand(30..120).chr}
      sleep(rand(0.03..0.9))

    end

    puts
    puts "#{username} что то пошло не так. Ваш баланс обнулился"
    exit

  end


end

