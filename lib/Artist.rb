require 'pry'
class Artist 
       attr_accessor :name, :songs
  
  @@all= []
  
  def initialize(name)
     @name = name 
     @@all << self 
     @songs = []
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
      self.new(name).save
      self
  end 
  
  def add_song(song)
    song.artist = self unless song.artist == self
    @songs << song unless @songs.include?(song)
  end 
  
  def genres
      songs.collect{|s|s.genre}.uniq   
  end	  
end 











