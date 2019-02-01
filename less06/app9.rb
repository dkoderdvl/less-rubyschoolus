print "Введите сумму для ежемесячных накоплений: "
x = gets.to_f

print "Введите количество месяцев: "
nmm = gets.to_i

s = 0

1.upto(nmm) do |mm|

    s = s + x
    puts "Накопления за #{mm} месяц составят: #{s}"

end