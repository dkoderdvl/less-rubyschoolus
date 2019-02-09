# less 13
# 

class Book

  @hh = {}

  def add_pirson options 
    
    puts 'Already exists!' if @hh[ options[ :name ]]
    
    @hh[ options[ :name ]] = options[ :age ] 
    
  end

  def show_hash
    
    @hh.each { |k,v| puts "name: #{k}; age: #{v}" }
    
  end
  
end

loop do
  
  print 'Enter name: '
  name = gets.strip.capitalize
  
  break if name.empty?
  
  print 'Enter age: '
  age = gets.to_i
  
  h_optins = { :name => name, :age => age }
  
  add_pirson h_optins
    
end

show_hash
