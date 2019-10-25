
class Genre 
    attr_accessor :name, :songs  
  extend Concerns::Findable
  
  @@all= []
  
  def initialize(name)
     @name = name 
    # @@all << self 
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
     genres = self.new(name)
     genres.save
     genres
  end  
  
  def artists
      songs.collect{|a|a.artist}.uniq   
  end	  
end 





