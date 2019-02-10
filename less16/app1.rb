# lesson 16
# 

class Animal
  
  attr_reader :name
  
  def initialize name
    
    @name = name
    
  end
  
  def run
    
    puts "#{@name} is running..."
    
  end
  
  def jump
  
    eat
    
    puts "#{@name} is jumping..."
    
  end
  
  #private
  protected
  
  def eat
    
    puts 'I am eating...'
    
  end
  
  private :eat
  
end

class Cat < Animal
  
  def initialize name
    
    super name
    
  end
  
  def say_meow
    
    eat
    
    puts "#{@name} say: Meeeeoooow!"
    
  end
  
end

#~ animal = Animal.new 'cat'
#~ animal.jump

cat = Cat.new 'busya'
cat.say_meow
