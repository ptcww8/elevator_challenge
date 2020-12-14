class Elevator
  attr_reader :current_floor
  attr_accessor :direction
  DIRECTION = {:up => 0, :down => 1}
  
  def initialize()
    @direction = Elevator::DIRECTION[:up]
    @current_floor = 0
  end
  
  
  def next_floor(elev_set)
    elev_array = elev_set.to_a
    floor = nil
    if @direction == Elevator::DIRECTION[:up]
      if elev_array.last > @current_floor
        floor = elev_array[@current_floor + 1]
      else
        floor = elev_array[@current_floor - 1]
      end
    else
      if @current_floor > 0
        floor = elev_array[@current_floor - 1] 
      else
        floor = elev_array[@current_floor + 1]
      end
    end
    
    if floor == nil
      begin
        puts "Waiting at Floor: " + @current_floor
        Thread.stop
      catch Exception => error
        puts error.backtrace 
      end
    else
      elev_set.delete(floor)
    end

    return (floor == nil) ? -1 : floor
  end


  def current_floor=(value) #  setter

  end


end


