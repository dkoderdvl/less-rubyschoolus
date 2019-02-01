print "Сколько будем играть в латерею: "
n = gets.to_i

vr = 0;

1.upto(n) do |i|

    x = rand(1..50)
    #puts x

    puts "Попытка #{i}"

	if x == 27
		puts "вы выграли на #{i} разе"
		vr = i
	
	end

end

unless vr ==  0
    puts "Вы выграли на #{vr} ходу"
end