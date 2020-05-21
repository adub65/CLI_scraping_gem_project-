# This is responsible for the blueprint of a State Park
# This will never use nokogiri
# This will never use puts
# store all of my State Parks instance data, i.e. attributes

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
