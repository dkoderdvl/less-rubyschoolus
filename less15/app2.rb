# lesson 15
#

class Airport
  
  attr_reader :name
  attr_reader :airplanse
  
  def initialize name
    
    @name = name
    @airplanse = []
    
  end
  
  def add_airplane airplane
    
    @airplanse << airplane
    
  end
  
  def get_airplanse_list
    
    list = ''
    
    @airplanse.each_with_index do |airplane, i|
      
      list += "#{i+1}. #{airplane.state};\n"
      
    end
    
    list
    
  end
  
end

class Airplane
  
  attr_reader :model
  
  def initialize model
    
    @model = model
    
  end
  
  def state
    
    "Model: #{@model}"
    
  end
  
end


airports = [ ( Airport.new 'Sheremet' ), ( Airport.new 'Vnukovo' ) ]
#ap = Airport.new 'Sheremet'
#airports << ap #Airport.new 'Sheremet'
#airports << ( Airport.new 'Vnukovo' )

models_airplanse = [ 'Boing-777', 'SuperJet-200', 'Kukuruznik', 'Il-86']

airports.each do |airport|
  
  rand(10..20).times do
    
    airport.add_airplane Airplane.new models_airplanse[rand(0..3)]
    
  end
  
  
end

airports.each do |airport|
  
  puts airport.name
  puts airport.get_airplanse_list
  
end

