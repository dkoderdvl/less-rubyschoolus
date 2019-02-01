# Калькулятор

print "Введите a: "
a = gets.to_f

print "Введите b: "
b = gets.to_f

print "Введите действие (+ - * /): "
action = gets.strip


if action == "+"
    value = a + b
    puts "Ответ = #{value}"
elsif action == "-"
    value = a - b
    puts "Ответ = #{value}"
elsif action == "*"
    value = a * b
    puts "Ответ = #{value}"
elsif action == "/"
    unless b == 0
        value = a / b
	puts "Ответ = #{value}"
    else
	puts "Делить на ноль нельзя!!!"
    end
else
    puts "Вы ввели не правильное действие"
end