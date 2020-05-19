# This class is responsible for communication with the user.
# This is where ill use 'puts' a lot.
# This will never use nokogiri
# This will have to invoke Scraper

class Cli
  def call
    scraper = Scraper.new
    scraper.scrape_park_page
  end
end