# less 13
# books

def show_book param
  
  puts '=' * 40, '</br>'
  puts "Name book: #{param[ :name ]}", '</br>'
  puts '-' * 30, '</br>'
  
  book = param[ :book ]
  
  book.each { |k,v| puts "Name: #{k}, age: #{v} ", '</br>' if book[k]}
  
end

puts '<body>'

book1 = { 'Mike'=>22, 'Max'=>27, 'Jon' => 25, 'Jr' => 11, 'Dmitry' => 42 }
h_param = { :book => book1, :name => 'book 1' }
show_book h_param




puts '</body>'
