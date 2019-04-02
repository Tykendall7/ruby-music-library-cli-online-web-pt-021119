class Song
  attr_accessor :name, :song, :artist, :genre
 
  
  @@all = []
  
  def initialize (name, artist = nil, genre = nil)
    @name = name
    @@all << self
    self.artist=(artist) if artist
   self.genre=(genre) if genre
  end
  
  def artist=(artist)
    @artist = artist
   artist.add_song(self) unless artist.nil?
  end
  def genre=(genre)
    @genre= genre
    genre.songs << self unless genre.songs.include?(self)
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
  
  def self.create(song)
   song= self.new (song)
   @song= song
   @song
 end
  
def self.find_by_name(name)
    self.all.find{|s| s.name == name}
  end
  
     def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end
  
end