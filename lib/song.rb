class Song

  attr_accessor :artist, :name, :genre

  @@all = []

  def initialize(name)
      @name = name
      save
    end

    def name=(name)
      @name = name
    end

    def artist=(artist)
      @artist = artist
    end

    def artist_name
      self.artist.name
    end

    def songs
      Song.all.select {|song| song.artist == self}
    end

    def save
      @@all << self
    end

    def self.all
      @@all
    end

    def artist_name=(name)

      if (self.class.nil?)
        self.class = Artist.new(name)
      else
        self.class.name = name
      end
    end

    def self.new_by_filename(filename)
      artist_name, song_name, extra = filename.split(" - ")
      song = self.new(song_name)
      artist = Artist.find_or_create_by_name(artist_name)
      artist.add_song(song)
    end


    # def self.new_by_filename(filename)
    #   artist_name = filename.split(" - ")[0]
    #   song_name = filename.split(" - ")[1]
    #   song = self.new(song_name)
    #   artist = Artist.find_or_create_by_name(artist_name)
    #   artist.add_song(song)
    # end
end
