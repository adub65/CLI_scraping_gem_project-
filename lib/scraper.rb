# This is responsible for scraping my web page.
# This file WILL use nokogiri
# This file will never use puts

class Scraper
  BASE_PATH = "https://www.dcnr.pa.gov/StateParks/FindAPark"

# scrapes URL to get a list of state parks and deletes instances of "Facebook" from array. Returns array with parks and URLs.
  def self.scrape_index_page
    index_page = Nokogiri::HTML(HTTParty.get(BASE_PATH).body)

    state_parks = index_page.css(".ms-rtestate-field p a").reject { |park|
      park.text.match("Facebook") || park.text.match("Twitter") }
    state_parks.each do |park|
      park_name = park.text
      park_link = "https://www.dcnr.pa.gov" + park.attr("href")
      StatePark.new(park_name, park_link)
    end
  end
end

#scrapes each state park's page to get the name, description of park, directions, and contact info.
  def self.scrape_park_profile_page(park_url)
    park_page = Nokogiri::HTML(HTTParty.get(BASE_PATH).body)
    park name = park_page.css(".ms-rteElement-H1").text
    description = park_page.css(".ms-rteElement-H1 p").text
    directions = park_page.css(".ms-rteElement-H2[1] p").text
    contact us = park_page.css("#RightSocialZone table").text

  end
