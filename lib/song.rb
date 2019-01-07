class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    self.all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    search = self.all.detect {|s| s.name == name}
    search
  end

  def self.find_or_create_by_name(name)
    search = self.find_by_name(name)
    if search
      search
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    sort = self.all.sort_by {|s| s.name}
    sort
  end

  def self.new_from_filename(filename)
    filename_array = filename.split(" - ")
    artist = Artist.find_or_create_by_name(filename_array[0])
    genre = Gere.find_or_create_by_name(filename_array[2].split(".mp3")[0])
    song = Song.new(filename_array[1],artist,genre)
    song
  end
end
