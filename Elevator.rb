class Elevator
  attr_reader :current_floor
  attr_accessor :direction
  DIRECTION = {:up => 0, :down => 1}
  
  def initialize()
    @direction = Elevator::DIRECTION[:up]
    @current_floor = 0
  end
  
  
  def next_floor(elev_set)
  end


  def current_floor=(value) #  setter

  end


end


