# однорукий бандит

print "Сколько вам лет? "
ny = gets.to_i

print "Хотите играть? (Y/N)"
answer = gets.strip.upcase

if ny >= 18 && answer = "Y"
    puts "Давай поиграем!"
    
    money = 100
    djeckpot = false

    puts "Ваш начальный баланс #{money}$"

    1000.times do

    puts "Введите Enter чтобы дернуть ручку..."
    gets

    x = rand(0..9)
    y = rand(0..9)
    z = rand(0..9)

    puts "Бандит говорит | #{x} | #{y} | #{z} |"

    money_t = money

    # 000
    if x == 0 && y == 0 && z == 0

	puts "Ваш баланс обнулен"
	money = 0

    end

    # 111
    if x == 1 && y == 1 && z == 1

	puts "Вам зачислено 10$"
	money = money + 10

    end

    # 222
    if x == 2 && y == 2 && z == 2

	puts "Вам зачислено 20$"
	money = money + 20

    end

    # 333
    if x == 3 && y == 3 && z == 3

	puts "Вам зачислено 30$"
	money = money + 30

    end

    # 444
    if x == 4 && y == 4 && z == 4

	puts "Вам зачислено 40$"
	money = money + 40

    end

    # 555
    if x == 5 && y == 5 && z == 5

	puts "Вам зачислено 50$"
	money = money + 50

    end

    # 666
    if x == 6 && y == 6 && z == 6

	puts "Баланс резко ополовинился Х%#"
	money = money / 2

    end

    # 777
    if x == 7 && y == 7 && z == 7

	puts "Вы сорвали Джек пот 1 000 000$"
	money = money + 1000000
	djeckpot = true

    end

    # 888
    if x == 8 && y == 8 && z == 8

	puts "Вам зачислено 80$"
	money = money + 80

    end

    # 999
    if x == 9 && y == 9 && z == 9

	puts "Вам зачислено 90$"
	money = money + 90

    end

    # 123
    if x == 1 && y == 2 && z == 3

	puts "Вам зачислено 123$"
	money = money + 123

    end

    if x == y - 1 && x == z - 2

	money_in = (x + y + z) * 3
	puts "Вам зачислено #{money_in}"
	money = money + money_in

    end

    if money_t == money
        
	# два значения одинаковых
	if x == y || x == z || y == z

	    money_in = (x + y + z) * 2
	    puts "Вам зачислено #{money_in}"
	    money = money + money_in
	
	end
	    
    end

    if money_t == money
 
	money_out = x + y + z
	puts "С баланса вычтено #{money_out}$"
	money = money - money_out

    end

    if money <= 0

	puts "Вы проиграли все ваши деньги и печень с почкой"
	exit

    end

    puts "Осталось денег на балансе: #{money}$"

    end

    if djeckpot
        sleep 5
	puts "Что то пошло не так Ваш баланс обнулен "
    end

end
