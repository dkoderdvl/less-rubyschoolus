# lesson 15
# 

class Album
  
  attr_reader :name
  attr_reader :songs
  attr_reader :duration
  
  def initialize name
    
    @name = name
    @songs = []
    @duration = 0
    
  end
  
  def add_song song
    
    @songs << song
    @duration += song.duration
    
  end
  
  def get_songs_list
    
    list = "Album: #{@name}, dur: #{@duration}\n"
    
    @songs.each_with_index do |song, i|
      
      list += "#{i+1}. Name: #{song.name}, dur: #{song.duration};\n"
      
    end
    
    list
    
  end
  
end

class Song
  
  attr_reader :name
  attr_reader :duration
  
  def initialize name, duration
    
    @name = name
    @duration = duration
    
  end
  
end

alb = Album.new 'My list'

alb.add_song ( Song.new 'song 1', 6 )
alb.add_song ( Song.new 'song 2', 7 )
alb.add_song ( Song.new 'song 3', 8 )
alb.add_song ( Song.new 'song 4', 9 )
alb.add_song ( Song.new 'song 5', 10 )

puts alb.get_songs_list
