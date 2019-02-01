# крутилка

str = "\\|/-"

#puts "-"

#10.times {|i| print "#{str[i]}"}

100.times do
    4.times do |i| 
	print "#{str[i]}\r"
	sleep 0.1
    end
end


