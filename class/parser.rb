class Parser

  attr_accessor :results

  def initialize(filename)
    @results = []
    @filename = filename
  end

  def parse
    doc = Nokogiri::XML File.open @filename
    # parsing <SearchResult> nodes
    doc.xpath('//SearchResult').each do |r|
      result = SearchResult.new
      result.id = r.xpath('ID').text
      # parsing <Connection> nodes
      r.xpath('Connections/Connection').each do |c|
        connection = Connection.new
        connection.start = c.xpath('Start').text
        connection.finish = c.xpath('Finish').text
        connection.deptime = c.xpath('DepartureTime').text
        connection.artime = c.xpath('ArrivalTime').text
        connection.train = c.xpath('TrainName').text
        # parsing <Fare> nodes
        c.xpath('Fares/Fare').each do |f|
          fare = Fare.new
          price = Price.new
          fare.name = f.xpath('Name').text
          price.currency = f.xpath('Price/Currency').text
          price.value = f.xpath('Price/Value').text
          fare.price = price
          connection.fares << fare
        end
        result.connections << connection
      end
      @results << result
    end
  end

end