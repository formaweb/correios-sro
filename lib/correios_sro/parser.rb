module CorreiosSRO
  class << self
    WEBSRO = "http://websro.correios.com.br/sro_bin/txect01$.QueryList?P_LINGUA=001&P_TIPO=001&P_COD_UNI"

    def track(number)
      @html = Nokogiri::HTML open("#{WEBSRO}=#{number}")

      if @html.xpath("//tr").count > 0
        track = Track.new number
        parse track

        return track
      end

      return false
    end

    private
    def parse(track)
      @html.xpath("//tr[position() > 1]").each do |row|
        if row.search("td").count > 1
          track << Status.new.tap { |status|
            status.date = DateTime.strptime row.search("td[@rowspan][1]").text.strip, "%d/%m/%Y %H:%M"
            status.place = row.search("td[2]").text.strip
            status.track = row.search("td[3]").text.strip

            if row.search("td[@rowspan='2'][1]").count > 0
              status.details = row.search(".//following-sibling::tr[1]").text.strip
            end
          }
        end
      end
    end

  end
end
