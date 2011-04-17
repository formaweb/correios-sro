require "rubygems"
require "nokogiri"
require "open-uri"
require "track"
require "status"

class CorreiosSRO

  def self.track(number)
    @xml = open("http://correios-api.appspot.com/yql?numero=#{number}")
    track = Track.new(number)

    status = nil
    status = self.parse(track)
    track << status if not status.nil?

    return track
  end

  private
  def self.parse(track)
    xml = Nokogiri::XML(@xml)
    status = nil

    xml.xpath('/results/status').each do |value|
      status = Status.new
      status.date = value.search('data').inner_text
      status.place = value.search('local').inner_text
      status.track = value.search('situacao').inner_text
      status.details = value.search('detalhes').inner_text
    end
    
    return status
  end

end