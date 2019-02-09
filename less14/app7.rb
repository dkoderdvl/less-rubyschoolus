# lesson 14
#

class Airplane
  
  attr_reader :model
  attr_reader :altitude
  attr_reader :speed
  
  def initialize(model)
    
    @model = model
    @speed = 0
    @altitude = 0
    
  end
  
  def fly
    
    @speed = 800
    @altitude = 10_000
    
  end
  
  def land
    
    @speed = 0
    @altitude = 0
    
  end
  
  def state
    
    "Model: #{@model}, Speed: #{@speed}, Alt: #{@altitude}"
    
  end
  
  def moving?
    
    return @speed > 0
    
  end
end

plane1 = Airplane.new('Boing-777')

puts "Model: #{plane1.model}, Speed: #{plane1.speed}, Alt: #{plane1.altitude}"
puts '-' * 30
puts plane1.state
puts "Is moving: #{plane1.moving?}"

plane1.fly

puts '-' * 30
puts plane1.state
puts "Is moving: #{plane1.moving?}"

plane1.land

puts '-' * 30
puts plane1.state
puts "Is moving: #{plane1.moving?}"





