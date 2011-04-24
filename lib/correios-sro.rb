require "rubygems"
require "nokogiri"
require "open-uri"
require "date"
require "track"
require "status"

class CorreiosSRO

  def self.track(number)
    @xml = open("http://correios-api.appspot.com/yql?numero=#{number}")
    @xml = Nokogiri::XML(@xml)

    if @xml.xpath('/results/status').count > 0
      track = Track.new(number)
      self.parse(track)

      return track
    else
      return false
    end
  end

  private
  def self.parse(track)
    @xml.xpath('/results/status').each do |value|
      track << Status.new.tap { |s|
        s.date = DateTime.strptime(value.search('data').inner_text, '%d/%m/%Y %H:%M')
        s.place = value.search('local').inner_text
        s.status = value.search('situacao').inner_text
        s.details = value.search('detalhes').inner_text
      }
    end
  end

end