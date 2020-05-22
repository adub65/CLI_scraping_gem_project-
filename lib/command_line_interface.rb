class CommandLineInterface
  def call
    welcome
    Scraper.new.scrape_parks
    run
  end

  def run
    park_list
    prompt_to_input

    input = gets.strip.to_i
    input_condition(input)

    park = park_position(input)

    display_park_info(park)
    display_additional_park_info(park)

    end_commands(park)
  end

  def welcome
    puts "Hello! Welcome to the PA State Parks info app.".colorize(:blue)
    sleep(2)
  end

  def park_list
    StatePark.all.map do |park|
      puts "#{park.id}. #{park.name}".colorize(:light_blue)
    end
  end

  def prompt_to_input
    puts "For more info, type the number of the park.".colorize(:blue)
  end

  def display_park_info(park)
    puts "You have chosen #{park.name}."
    puts park.description
    puts "______________________________"
    puts "#{more_info}#{park.name}?".colorize(:blue)
  end

  def display_additional_park_info(park)
    input = gets.strip.downcase
    if input == "yes"
      Scraper.new.scrape_park_page(park)
      park_info(park)
      options(park)
    else
      redirect
    end
  end

  def park_info(park)
    puts "Website: #{park.url}".colorize(:light_blue)
    puts "Location in PA: #{park.location}".colorize(:light_blue)
    puts "Reservations: #{park.reservation}".colorize(:light_blue)
    puts "Experiences: #{park.experience}".colorize(:light_blue)
    puts "______________________________"
  end

  def park_position(input)
    StatePark.find_by_id(input)
  end

  def input_condition(input)
    if input.to_i >=0 && input.to_i <= 122
      true
    else
      puts "Invalid entry. Please try again.".colorize(:red)
      sleep(1)
      run
    end
  end

  def more_info
    "Would you like to find out more about "
  end

  def options(park)
    puts back
    puts "#{visit}#{park.name}."
    puts exit_message
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
      open_url(park)
    elsif input2 == "exit"
      goodbye
    else
      puts "Invalid entry, redirecting back to park list."
      run
    end
  end

  def back
    "Type 'back' to return to the park list."
  end

  def visit
    "Type 'open' to visit the info webpage for "
  end

  def exit_message
    "Type 'exit' to exit out of the movie list."
  end

  def open_url(park)
    HTTParty.get(park.url.to_s)
  end

  def goodbye
    puts "Thanks for checking out PA State Parks.".colorize(:green)
    puts "Have a great day!".colorize(:light_green)
  end

end
