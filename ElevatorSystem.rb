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
    process_request(start_floor, end_floor > start_floor ? Elevator::DIRECT[:up] : Elevator::DIRECT[:down])
  end
  
  def process_request(floor_number, direction)
    #This function is going to be added to a thread to process inputs received
    while true
      elevator = get_closest_elevator(floor_number, direction)
      floor = elevator.next_floor
      current_floor = elevator.current_floor
      begin
        if floor >= 0
          if current_floor > floor
            while current_floor > floor
              elevator.current_floor(current_floor -= 1)
            end
          else
            while current_floor < floor
              elevator.current_floor(current_floor += 1)
            end
          end
          puts "Welcome to Floor : #{elevator.current_floor}"
        end
      rescue Exception => error
       # If a new request has interrupted a current request processing then check -
       # if the current request is already processed
       # otherwise add it back in request Set
        if elevator.current_floor != floor
          @request_set << floor
        end
      end
    end
    
  end
  
  
  def listening_for_request
    #This function is going to be added to a thread to listen for inputs
    
    while true
      floor_number = nil
      begin
        #Read input from console
        puts"Which floor are you on?"
        floor_number = $stdin.gets.chomp
        puts"Which floor are you  going to?"
        end_floor_number = $stdin.gets.chomp
      rescue => error
        error.backtrace 
      end
      
      if is_valid_floor_number?(floor_number)
        puts "User Pressed : " + floor_number
        elevator_request(floor_number, end_floor_number)
        
      else
        puts "Floor Request Invalid : " + floor_number
        exit(0)
        
      end
    end
    
    
  end
    
  def get_closest_elevator(floor_number, direction)
    min = nil
    final_elevator = @elevator_set.first
    @elevator_set.each do |elevator|
      if direction == elevator.direction
         gap_btn_floors = num.abs(floor_number - elevator.current_floor)
        if min.nil?
          min = gap_btn_floors
          final_elevator = elevator
        else
          if gap_btn_floors < min
            min = gap_btn_floors
            final_elevator = elevator
          end
        end
      end
    end
    return final_elevator

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