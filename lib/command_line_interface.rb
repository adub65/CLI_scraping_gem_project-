# This class is responsible for communication with the user.
# This is where we'll use 'puts' a lot.
# This will never use nokogiri
# This will have to invoke Scraper

class CommandLineInterface
  def call
    puts "Hello! Welcome to the PA State Parks info app."
    Scraper.scrape_index_page

    puts "Type the first letter of the park to begin your search. (To view a list of all state parks, type ALL.)"

    command = gets.strip.downcase
     command == "all"
      parks = StatePark.all
      parks.map { |park| puts "#{park.id}. #{park.name}" }
        #elsif invalid_input?(command)#make sure code is exactly a letter regex(must be 1 character)
      # puts "hey try again"
    # else
    #   parks = StatePark.parks_starting_with(command)
    #   parks.each do |park|
    #     puts "#{park.id}. #{park.name}"
  end
end
      # input of id number


  # def invalid_input?(command)
  #   false
  # end
