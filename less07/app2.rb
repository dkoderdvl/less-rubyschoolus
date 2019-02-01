print "Вы довольны своей зарплатой? (Y/N)"
answer = gets.strip

#if answer.upcase = "Y"
#    puts "Очень хорошо"
#end
#if answer.upcase = "N"
#    puts "Очень плохо"
#end

if answer.upcase == "Y"
    puts "Очень хорошо"
elsif answer.upcase == "N"
    puts "Очень плохо"
else
    puts "Не правильное значение"
end

#изменен