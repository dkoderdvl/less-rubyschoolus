# расчет заначки за несколько лет

print "Введите количество лет накоплений: "
yy_count = gets.to_i

print "Введите ежемесячную сумму заначки: "
mm_sum = gets.to_f

sum = 0

1.upto(yy_count) do |yy|

    1.upto(12) do |mm|

	sum = sum + mm_sum
	puts "Год #{yy} меяц #{mm} заныкано: #{sum}"

    end
end