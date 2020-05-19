# This is responsible for scraping my web page.
# This file WILL use nokogiri
# This file will never use puts


class Scraper
  attr_accessor :doc

  def initialize
    @doc = Nokogiri::HTML(HTTParty.get("https://www.dcnr.pa.gov/StateParks/FindAPark/Pages/default.aspx").body)
  end

  def scrape_park_page
    binding.pry

    # doc.css("strong").children[1].text
    # => "Alphabetical listing of all Pennsylvania state parks"
  end

end
# state_parks = {}

# Find a State Park = doc.css("ms-rteElement-H1").text
# List of state parks = doc.css.a.text