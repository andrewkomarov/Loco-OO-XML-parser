class Output

  def initialize(results)
    @results = results
  end

  def to_console
    @results.each do |r|
      i=0
      print "\nID: #{r.id} | Train Changes: #{r.connections.length-1} | #{r.connections.length} connections:\n"
      print "=======================================================================\n"
      r.connections.each do |c|
        i+=1
        # determining time the passenger has to train change
        if r.connections[i]
          next_train_deptime = DateTime.parse(r.connections[i].deptime).to_time
          time_to_change = next_train_deptime.to_i - c.arrival_time.to_i
        end
        print "\n#{c.start} - #{c.finish}"
        print "\nTrain Name: #{c.train}"
        print "\nDeparture: #{c.departure_time}"
        print "\nArrival: #{c.arrival_time}"
        print "\nDuration: #{Utils.seconds_to_time(c.duration)}"
        print "\nFares:"
        c.fares.each do |f|
          print "\n\t#{f.name} - #{f.price.currency} #{f.price.value}"
        end
        if r.connections[i]
          print "\n\t\n\tTime to change train: #{Utils.seconds_to_time(time_to_change)}"
        end
        print "\n-----------------------------------------------------------------------"
      end
      print "\n\n"
    end
  end

end