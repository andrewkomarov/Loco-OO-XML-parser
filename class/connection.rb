class Connection

  attr_accessor :start, :finish, :deptime, :artime, :train, :fares

  def initialize
    @fares = []
  end

  def duration
    arrival_time.to_i - departure_time.to_i
  end

  def arrival_time
    DateTime.parse(@artime).to_time
  end

  def departure_time
    DateTime.parse(@deptime).to_time
  end

end