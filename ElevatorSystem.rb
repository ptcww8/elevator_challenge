require_relative "Elevator"

class ElevatorSystem
  require 'set'
  attr_accessor :no_of_floors, :number_of_elevators, :elevator_set, :request_processor, :request_listener
  
  
  def initialize(elevators: elevs, floors: fls)
    @no_of_floors = fls
    @number_of_elevators = elevs
    @elevator_set = Array.new(elevs, Elevator.new)
  end
  
  
  def elevator_request(start_floor, end_floor)
    Elevator.add_floor(start_floor)
    Elevator.add_floor(end_floor)
  end
  
  def process_request(floor_number, direction)
    
  end
  
  
  def listening_for_request
    
    
  end
    
  def get_closest_elevator(floor_number, direction)
    min = nil

  end
  
  
  def is_valid_floor_number?(floor)
    if floor.to_i && floor.to_i <= @no_of_floors
      return true
    else
      return false
    end    
  end
  
end

#el_system = ElevatorSystem.new(elevators: 3, floors: 10)