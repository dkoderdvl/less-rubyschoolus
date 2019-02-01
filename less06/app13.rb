# Вывод введенного слова через -

print "Введите слово: "
str = gets.chomp

str.size.times do |n|

    print str[n]
    print "-"

    sleep rand(0.03..2)

end

puts