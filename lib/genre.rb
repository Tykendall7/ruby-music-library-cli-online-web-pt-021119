class Genre
  extend Concerns::Findable
  
  attr_accessor :name, :songs, :artists
  
  @@all = []
  
  def initialize (name)
    @name = name
    @@all << self
    @songs = []
  end
  
  def artists
    songs.collect { |s| s.artist}.uniq
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    self.all.clear
  end
  
  def save
    @@all << self.class.all
  end
  
  def self.create(genre)
   genre= self.new (genre)
   @genre= genre
   @genre
 end
  
  
end