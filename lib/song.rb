class Song
  attr_accessor :name, :artist_name
  @@all = []
  
  def self.create 
    s = self.new 
    s.save 
    s
  end 
 
  def self.create_by_name(new_song_name)
    s = self.new 
    s.name = new_song_name
    s.save 
    s
  end
 
  def self.new_by_name(new_song_name)
    s = self.new 
    s.name = new_song_name
    s
  end 
  
  def self.find_by_name(song_name) 
    self.all.detect {|d| d.name == song_name}
  end
  
  def self.find_or_create_by_name(searched_song)
    
    song_search = find_by_name(searched_song)
    if song_search == nil
     create_by_name(seached_song)
    else
      song_search
    end
  end 

  def self.alphabetical
    self.all.sort_by { |d| d.name}
  end 
  
  def self.new_from_filename(artist_song_mp3)
    c = self.new 
    c.name = artist_song_mp3.split(/[^a-zA-Z\s]|\s-\s/)[1] 
    c.artist_name = artist_song_mp3.split(/[^a-zA-Z\s]|\s-\s/)[0]
    c
  end 
  
  def self.create_from_filename(mp3_formatted_file)
    # Build a class constructor that accepts a filename in the 
    # format of " - .mp3", for example "Taylor Swift - Blank Space.mp3".
    
    # Given Song.new_from_filename("Taylor Swift - Blank Space.mp3"), 
    # the constructor should return a new Song instance with the song 
    # name set to Blank Space and the artist_name set to Taylor Swift.
    c = self.new 
    c.name = mp3_formatted_file.split(/[^a-zA-Z\s]|\s-\s/)[1] 
    c.artist_name = mp3_formatted_file.split(/[^a-zA-Z\s]|\s-\s/)[0]
    c.save
    c
  end 
 
  def self.all
    @@all
  end
 
  def save
    self.class.all << self
  end
  
  def self.destroy_all
    self.all.clear
  end
 
end

zaza = Song.create
zaza.name = "Sugar Zaza"
zaza.artist_name = "Shoshi"

loon = Song.create
loon.name = "Moon Landing"
loon.artist_name = "Major Tom"

Song.all

song = Song.create
song.name = "Haunted House"
Song.all.include?(song)

song2 = Song.new_by_name("The Middle")
#=> #<Song @name="The Middle">
song2.name #=> "The Middle"
song2

song3 = Song.create_by_name("Banjo-Song")
#=> #<Song:0x007fd2a2989ff0 @name="Banjo-Song">
song3
#=> #<Song:0x007fd2a2989ff0 @name="Banjo-Song">
song3.artist_name = "Redneck Dude"
Song.all.include?(song3)
#=> true

Song.find_by_name("Banjo-Song")

# song4 = Song.find_or_create_by_name("Sugar Zaza")
song5 = Song.find_or_create_by_name("Banjo-Song")
Song.all

song_6 = Song.find_or_create_by_name("Blank Space")
song_7 = Song.find_or_create_by_name("Blank Space")
song_6 == song_7
Song.alphabetical

song8 = Song.new_from_filename("Taylor Swift - Blank Space.mp3")
song8.name #=> "Blank Space"
song8.artist_name #=> "Taylor Swift"

song9 = Song.create_from_filename("Nancy Ajram - Ani Alyek.mp3")
song9.name #=> "Anu Alyek"
song9.artist_name #=> "Nancy Ajram"