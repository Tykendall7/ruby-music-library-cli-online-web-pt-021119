class Song
  attr_accessor :name, :artist, :genre
 
  
  @@all = []
  
  def initialize (name, artist = nil, genre = nil)
    @name = name
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
    @@all = []
  end
  
  def save
    @@all << self
  end
  
  def self.create(name)
   song= self.new(name)
   song.save
   song
 end
  
  def self.find_by_name(song_name)
    self.all.find{|s| s.name == song_name}
  end
  
   def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name) == nil
      self.create(song_name)
    else
      self.find_by_name(song_name)
    end
  end
  
end