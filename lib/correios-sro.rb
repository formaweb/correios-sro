require "rubygems"
require "date"
require "open-uri"
require "nokogiri"
require "track"
require "status"

class CorreiosSRO

  def self.track(number)
    @html = Nokogiri::HTML(open("http://websro.correios.com.br/sro_bin/txect01$.QueryList?P_LINGUA=001&P_TIPO=001&P_COD_UNI=#{number}"))

    if @html.xpath("//tr").count > 0
      track = Track.new(number)
      self.parse(track)

      return track
    else
      return false
    end
  end

  private
  def self.parse(track)

    @html.xpath("//tr[position() > 1]").each do |row|
      if row.search("td").count > 1
        track << Status.new.tap { |s|
          s.date = DateTime.strptime(row.search("td[@rowspan][1]").text.strip, "%d/%m/%Y %H:%M")
          s.place = row.search("td[2]").text.strip
          s.track = row.search("td[3]").text.strip
          s.details = row.search(".//following-sibling::tr[1]").text.strip if row.search("td[@rowspan='2'][1]").count > 0
        }
      end
    end

  end

end