# lesson 14
# 

# repeat - less 13
# 

@hh = {}

def add_pirson bb, options # hash only end
  
  puts 'Already exists!' if @hh[ options[ :name ]]
  
  @hh[ options[ :name ]] = options[ :age ] 
  
end

def show_hash
  
  @hh.each { |k,v| puts "name: #{k}; age: #{v}" }
  
end

loop do
  
  print 'Enter name: '
  name = gets.strip.capitalize
  
  break if name.empty?
  
  print 'Enter age: '
  age = gets.to_i
  
#  h_optins = { :name => name, :age => age }
#  add_pirson h_optins

  add_pirson 55, :name => name, :age => age
    
end

show_hash
