class Artist
  extend Concerns::Findable
  attr_accessor :name, :artist, :songs, :genres
  
  @@all = []
  
  def initialize (name)
    @name = name
    @@all << self
    @songs = []
  end
  
  def genres
    songs.collect { |s| s.genre}.uniq
  
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
  
  def self.create(artist)
   artist= self.new (artist)
   @artist= artist
   @artist
 end
  
  def add_song(song)
       if song.artist == nil
      song.artist = self
      end
       @songs << song unless self.songs.include? (song)
 end
  
end