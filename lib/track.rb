class Track
  attr_reader :number, :status

  def initialize(number)
    @number = number
    @status = Array.new
  end

  def <<(status)
    @status << status
    @status.sort! do |a, b|
      a.date <=> b.date
    end
  end

  def first
    @status.first
  end

  def last
    @status.last
  end
end