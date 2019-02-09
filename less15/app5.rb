# lesson 15
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
    
    puts "#{@name} is jumping..."
    
  end
  
end

class Cat < Animal
  
  def initialize name
    
    super name
    
  end
  
  def say_meow
    
    puts "#{@name} say: Meeeeoooow!"
    
  end
  
end

class Dog < Animal
  
  def initialize name
    
    super name
    
  end
  
  def say_bark
    
    puts "#{@name} say: Woof-woof!"
    
  end
  
end

cat = Cat.new 'Busya'
cat.run
cat.say_meow

dog = Dog.new 'Palkan'
dog.jump
dog.say_bark
