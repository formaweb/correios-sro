require_relative "test_helper"

class TrackTest < Minitest::Test
  
  def setup
    @track  = CorreiosSRO::Track.new '12345'
    @status = CorreiosSRO::Status.new.tap { |status|
              status.date = DateTime.strptime("21/10/2015 07:28", "%d/%m/%Y %H:%M")
              status.place = "sample place"
              status.track = "sample track"
              status.details = "first track"
    }
    @status_two = CorreiosSRO::Status.new.tap { |status|
              status.date = DateTime.strptime("21/10/2015 07:28", "%d/%m/%Y %H:%M")
              status.place = "sample place 2"
              status.track = "sample track 2"
              status.details = "second track"
    }
    
  end

  def test_can_add_status_to_track_element
    @track << @status
    assert @track.status == [ @status ]
  end

  def test_can_return_the_first_track_element
    @track << @status
    assert @track.first == @status
  end

  def test_can_return_the_last_track_element
    @track << @status << @status_two
    assert @track.last == @status_two
  end

end