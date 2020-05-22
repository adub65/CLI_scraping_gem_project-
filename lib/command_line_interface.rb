class CommandLineInterface
  def call
    puts "Hello! Welcome to the PA State Parks info app.".colorize(:blue)
    sleep(2)
    Scraper.new.scrape_parks
    run
  end

  def run
    park_list
    puts "For more info, type the number of the park.".colorize(:red)

    input = gets.strip
    park = park_position(input)
    input_condition(input)

    display_park_info(park)
    display_additional_park_info(park)

    end_commands(park)
  end

  def park_list
    StatePark.all.map do |park|
      puts "#{park.id}. #{park.name}".colorize(:light_blue)
    end
  end

  def input_condition(input)
    if input == "exit"
      goodbye
    elsif input.to_i >= 0 && input.to_i <= 122
      # unless an input is a park id, show "invalid entry."
      true
    else
      puts "Invalid entry. Please try again.".colorize(:red)
      sleep(1)
      run
    end
  end

  def park_position(input)
    StatePark.find_by_id(input)
  end

  def display_park_info(park)
    puts "You have chosen #{park.name}.".colorize(:green)
    Scraper.new.scrape_park_page(park)
    puts park.description.to_s.colorize(:light_green)
    puts "--------------------------------------"
    puts "Would you like more info on #{park.name}, yes or no?".colorize(:red)
  end

  def display_additional_park_info(park)
    input = gets.strip.downcase
    if input == "yes"
      park_info(park)
      options(park)
    elsif input == "exit"
      goodbye
    else
      redirect
    end
  end

  def park_info(park)
    puts "Website: #{park.url}".colorize(:light_blue)
    puts "Location in PA: #{park.location}".colorize(:light_blue)
    puts "Reservations: #{park.reservation}".colorize(:light_blue)
    puts "Experiences: #{park.experience}".colorize(:light_blue)
    puts "----------------------------------------"
  end

  def options(park)
    puts "Type 'back' to return to the park list."
    puts "Type 'open' to visit the info webpage for #{park.name}."
    puts "Type 'exit' to exit out of the park app."
  end

  def redirect
    puts "Going back to park list...".colorize(:red)
    sleep(1)
    run
  end

  def end_commands(park)
    input2 = gets.strip.downcase
    if input2 == "back"
      redirect
      run
    elsif input2 == "open"
      Launchy.open(park.url.to_s)
    elsif input2 == "exit"
      goodbye
    end
  end

  def goodbye
    puts "Thanks for checking out PA State Parks.".colorize(:green)
    puts "Have a great day!".colorize(:light_green)
    exit
  end
end
