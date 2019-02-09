# lesson 15
#

class Country
  
  attr_reader :name
  attr_reader :airports
  
  def initialize name
    
    @name = name
    @airports = []
    
  end
  
  def add_airport airport
    
    @airports << airport
    
  end
  
  def get_airports_list
    
    list = ''
    
    @airports.each_with_index do |airport, i|
      
      list += "#{i+1}. #{airport.name};\n"
      
    end
    
    list
    
  end
  
  def get_airports_list_with_airplanse
    
    list = ''
    
    @airports.each do |airport|
      
      list += "#{airport.name};\n#{airport.get_airplanse_list}\n"
      
    end
    
    list
    
  end
  
end

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

russia = Country.new 'Russia'

russia.add_airport ( Airport.new 'Sheremet' )
russia.add_airport ( Airport.new 'Vnukovo' )

models_airplanse = [ 'Boing-777', 'SuperJet-200', 'Kukuruznik', 'Il-86']

russia.airports.each do |airport|
  
  rand(10..20).times do
    
    airport.add_airplane Airplane.new models_airplanse[rand(0..3)]
    
  end
  
end


puts russia.name
puts russia.get_airports_list_with_airplanse
