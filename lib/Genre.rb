class Genre 
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
  
  def artists
      songs.collect{|a|a.artist}.uniq   
  end	  
end 





