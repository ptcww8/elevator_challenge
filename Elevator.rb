require 'set'
class Elevator
  attr_reader :current_floor
  attr_accessor :direction
  DIRECT = {:up => 0, :down => 1}
  @@request_set = SortedSet.new
  
  def initialize()
    @direction = Elevator::DIRECT[:up]
    @current_floor = -1
  end

  def self.add_floor(new_floor)
    @@request_set << new_floor
    @@request_set
  end
  
  def self.get_sorted_set
    @@request_set 
  end
  
  
  
  def next_floor
    #This function is going to give you the next floor the elevator is going to
    elev_array = @@request_set.to_a
    floor = nil
    if @direction == Elevator::DIRECT[:up]
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
      @@request_set.delete(floor)
    end

    return (floor == nil) ? -1 : floor
  end


  def current_floor=(value) #  setter
    @direction =  @current_floor > value ? Elevator::DIRECT[:down] : Elevator::DIRECT[:up]
    @current_floor = value
    sleep(3)
  end


end

#elA = Elevator.new
#elB = Elevator.new
#elA.current_floor
#Elevator.add_floor(5)
#Elevator.add_floor(5)
#Elevator.add_floor(5)
 
