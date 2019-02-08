# less 13
# books

def show_book param
  
  puts
  puts '=' * 40
  puts "Name book: #{param[ :name ]}"
  puts '-' * 30
  
  book = param[ :book ]
  
  book.each { |k,v| puts "Name: #{k}, age: #{v}" if book[k]}
  
end

book1 = { 'Mike'=>22, 'Max'=>27}
h_param = { :book => book1, :name => 'book 1' }
show_book h_param

book2 = { 'Jon' => 25, 'Jr' => 11, 'Dmitry' => 42 }
h_param = { :book => book2, :name => 'book 2' }
show_book h_param


book3 = book1.merge book2
h_param = { :book => book3, :name => 'book3 = book1.merge book2' }
show_book h_param

#~ book3 = book1.merge! book2
#~ h_param = { :book => book3, :name => 'book3 = book1.merge! book2 |book3|' }
#~ show_book h_param
#~ h_param = { :book => book1, :name => 'book3 = book1.merge! book2 |book1|' }
#~ show_book h_param

book1.merge! book2
h_param = { :book => book1, :name => 'book1.merge! book2' }
show_book h_param

