# lesson 14
#

class Book
  
  attr_reader :last_person
  attr_accessor :rw
  
  def initialize
    
    @hh = {}
    
  end

  def add_pirson options 
    
    puts 'Already exists!' if @hh[ options[ :name ]]
    
    @hh[ options[ :name ]] = options[ :age ]
    
    @last_person =  options[ :name ]
    
  end

  def show_hash
    
    @hh.each { |k,v| puts "name: #{k}; age: #{v}" }
    
  end
  
end

b = Book.new

loop do
  
  print 'Enter name: '
  name = gets.strip.capitalize
  
  break if name.empty?
  
  print 'Enter age: '
  age = gets.to_i
  
  h_optins = { :name => name, :age => age }
  
  b.add_pirson h_optins
    
end

b.show_hash

puts "Last person: #{b.last_person}"

b.rw = 'rw'
puts b.rw

