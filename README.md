OVERVIEW

You must write a program to operate an elevator system with a dynamic number of elevators and a number of floors. Your code should handle requests for passengers to ride the elevator. A passenger request will have a requesting floor(initial location) and a direction. Once a passenger enters the elevator they will then submit which floor/floors they wish to travel(destination floor). As an alternative, you might have just one request (requesting_floor, destination_floor). As time passes elevators should meet the passenger requests and travel to the desired floors. Bonus points if the elevator system is efficient (or at least tries to be).

EXAMPLE

Exercising the elevator system might look something like this:
elevator_system = ElevatorSystem.new(elevators: 3, floors: 10)
elevator_system.elevator_request(floor: 1, direction: :up)
elevator_system.time_passed
elevator_system.time_passed
elevator_system.time_passed
"Passenger(s) picked up from floor 1"
elevator_system.floor_request(7)
elevator_system.floor_request(9)
elevator_system.time_passed
elevator_system.time_passed
elevator_system.time_passed
elevator_system.time_passed
"Passenger(s) dropped off on floor 7"
elevator_system.time_passed
"Passenger(s) dropped off on floor 9"
