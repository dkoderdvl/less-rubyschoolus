# lesson 15
#

class Song
  
  attr_accessor :name, :duration
  
  def initialize name, dyration
    
    @name = name
    @duration = duration
    
  end
  
  
  
end

song_1 = Song.new 'The show must go on', 6

puts song_1.name

