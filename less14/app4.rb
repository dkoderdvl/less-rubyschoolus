# lesson 14
# 

class Animal
  
  
  def run
    
    @name = 'dog'
    puts "#{@name} is running"
    
  end
  
  def stop
    
    puts "#{@name} is stoping"
    
  end
  
end

a = Animal.new

a.run
a.stop
