# This is responsible for scraping my web page.
# This file WILL use nokogiri
# This file will never use puts

class Scraper
  attr_accessor :doc

  def initialize
    @doc = Nokogiri::HTML(open(https://www.dcnr.pa.gov/StateParks/FindAPark/Pages/default.aspx))
  end

end