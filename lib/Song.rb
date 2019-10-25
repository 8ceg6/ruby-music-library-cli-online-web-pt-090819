require 'pry'
class Song 
  attr_accessor :name, :artist, :genre
  
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
     @name = name 
     
     self.artist = artist if artist!=nil
     self.genre= genre if genre!=nil
  end 
  
  def self.all
      @@all 
  end 
  
  def self.destroy_all
      self.all.clear
  end 
  
  def save
     @@all << self
  end 
  
  def self.create(name)
      new_song = self.new(name)
      new_song.save
      new_song
  end 
  
  def artist= (artist)
      @artist = artist
      artist.add_song(self)
  end
  
  def genre=(genre)
      @genre = genre	   
      genre.songs << self unless genre.songs.include?(self)	    
  end	  
  
  def  self.find_by_name(name)
      @@all.detect {|n| n.name == name }
  end
  
  def  self.find_or_create_by_name(name)
       self.find_by_name(name) || self.create(name)
  end   
  
  def  self.new_from_filename(file)
        artist = file.split(" - ")[0]
        song = file.split(" - ")[1]
        genre = file.split(" - ")[2].chomp(".mp3")
        
         new_song = Song.new(song)
         new_song.artist = Artist.find_or_create_by_name(artist)
         new_song.genre = Genre.find_or_create_by_name(genre)
        new_song
  end 
  
  def self.create_from_filename(filename)
      song = self.new_from_filename(filename)
      song.save
      
   
  end   
  
end 







