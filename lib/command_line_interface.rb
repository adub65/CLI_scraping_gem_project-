# This class is responsible for communication with the user.
# This is where we'll use 'puts' a lot.
# This will never use nokogiri
# This will have to invoke Scraper

class CommandLineInterface
  attr_reader :scraper

  def call
    puts "Hello! Welcome to the PA State Parks info app."
    @scraper = Scraper.new
    scraper.scrape_index_page
    start
  end

  def start
    park_list
    loop do
      make_selection

      input = gets.strip.downcase
      if input == "exit"
        goodbye
        exit
      elsif input.to_i <= 0
      puts "Invalid entry. Please try again."
      elsif
        park = park_position(input)
        park_info(park)
      end
    end
  end

  def park_list
    puts "List of all the state parks in Pennsylvania:"
    StatePark.all.map { |park| puts "#{park.id}. #{park.name}" }
  end

  def make_selection
    puts "Type the number of the park you wish to see more info about."
    puts "To exit, type exit"
  end

  def park_info(park)
    scraper.scrape_park_page(park)
    puts park.name
    puts park.url
    puts park.location
    puts park.description
    puts park.experience
  end

  def park_position(input)
    StatePark.find_by_id(input.to_i)
  end

  def goodbye
    puts "Thanks for checking out PA State Parks."
    puts "Have a great day!"
  end
end