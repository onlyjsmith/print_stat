class Stat < ActiveRecord::Base
  require 'open-uri'
  
  def self.refresh_all
    # TODO: Add grape in with different parser
    printers = {"fennel" => "localhost", "gooseberry" => "gooseberry"}#, "grape" => "grape"} 
    unless Stat.recently_refreshed
      now = Time.now
      printers.each do |printer|
        Stat.refresh(printer, now)
      end
    end
  end
  
  def self.recently_refreshed
    if Stat.last.nil?
      return false
    else
      return false
      # ((Time.now - Stat.last.last_check) /60 > 900)
    end
  end
  
  def self.refresh(printer, time)
    doc = Nokogiri::HTML(open("http://#{printer[1]}.local./counters/usage.php")) 
    total = doc.css(".odd:nth-child(1) .normalTextCenter").text
    black = doc.css(".even:nth-child(2) .normalTextCenter").text
    colour = doc.css(":nth-child(5) .normalTextCenter").text
    Stat.create(:printer_name => printer[0], :black_pages => black, :colour_pages => colour, :last_check => time)
  end
end
