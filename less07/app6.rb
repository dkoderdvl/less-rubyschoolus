# Программа гости
print "Сколько гостей к вам прийдет? "
n = gets.to_i

if  n <= -100
    puts "Это какая то шутка"
    exit
end

if n < 0
    puts "Ошибка ввода данных, гостей не может быть меньше 0"
    exit
end

if n != 0
    puts "Отлично, кто-то будет"
end

if n == 1
    puts "Придет 1"
end

if n == 2
    puts "Придет 2"
end

if n >= 3
    puts "Будет много гостей"
end
