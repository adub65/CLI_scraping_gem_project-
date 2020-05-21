class StatePark
  @@all = []

  attr_reader :name, :url, :id
  attr_accessor :description, :reservation, :location, :experience

  def initialize(name, url)
    @name = name
    @url = url
    @description = description
    @location = location
    @experience = experience
    @@all << self
    @id = @@all.count
  end

  def self.all
    @@all
  end

  def self.find_by_id(id)
    all.find { |park| park.id == id }
  end

end
