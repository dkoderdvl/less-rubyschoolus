# lesson 15
# 

class Artist
  
  attr_reader :name, :albums
  
  def initialize name
    
    @name = name
    @albums = []
    
  end
  
  def add_album album
    
    @albums << album
    
  end
  
  def get_albums
    
    list = "Artist: #{@name}\n"
    
    @albums.each_with_index do |album, i|
      
      list += "#{i+1}. Album: #{album.name}, dur: #{album.duration};\n"
      
    end
    
    list
    
  end
  
  def get_albums_whis_songs
    
    list = "Artist: #{@name}\n"
    
    @albums.each do |album|
      
      list += "#{album.get_songs_list}\n"
      
    end
    
    list
    
  end
  
end

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

art = Artist.new 'Kumar'

art.add_album ( Album.new 'My list' )

art.albums[0].add_song ( Song.new 'song 1', 6 )
art.albums[0].add_song ( Song.new 'song 2', 7 )
art.albums[0].add_song ( Song.new 'song 3', 8 )
art.albums[0].add_song ( Song.new 'song 4', 9 )
art.albums[0].add_song ( Song.new 'song 5', 10 )

puts art.get_albums_whis_songs
