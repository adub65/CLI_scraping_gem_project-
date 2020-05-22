# This is responsible for scraping my web page.
# This file WILL use nokogiri
# This file will never use puts

class Scraper
  BASE_PATH = "https://www.dcnr.pa.gov".freeze

  def scrape_parks
    index_page = Nokogiri::HTML(
      HTTParty.get("#{BASE_PATH}/StateParks/FindAPark").body)

    state_parks = index_page.css(".ms-rtestate-field p a").reject do |park|
      park.text.match("Facebook") || park.text.match("Twitter")
    end

    state_parks.each do |park|
      park_name = park.text
      park_link = BASE_PATH + park.attr("href")
      StatePark.new(park_name, park_link)
    end
  end

  def scrape_park_page(park)
    park_page = Nokogiri::HTML(
      HTTParty.get(park.url.to_s).body
    )
    park.description = park_page.css(".ms-rteElement-H1")[0].next.text

    park_direction = park_page.css("h2.ms-rteElement-H2").find do |el|
      el.text == "Directions"
    end
    park.location = if park_direction
                      park_direction.next.text
                    else
                      "See website for more details."
                    end

    park_reserve = park_page.css("h2.ms-rteElement-H2").find do |el|
      el.text == "Reservations"
    end
    park.reservation = if park_reserve
                         park_reserve.next.text.gsub("\n   ", "")
                       else
                         "No reservations available."
                       end

    park_activity = park_page.css("h2.ms-rteElement-H2").find do |el|
      el.text == "Learn, Experience, Connect"
    end
    park.experience = if park_activity
                        park_activity.next.text
                      else
                        "See website for more details."
                      end
  end
end
