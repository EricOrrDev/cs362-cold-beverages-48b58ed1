class WaterDispenser

  attr_reader :reservoir

  def initialize(reservoir)
    @reservoir = reservoir
  end

  def dispense(vessel)
    if(reservoir.current_water_volume < vessel.volume)
      fill_amount = reservoir.current_water_volume
    else
      fill_amount = vessel.volume
    end

    reservoir.drain(fill_amount)
    vessel.fill_partially(fill_amount)
  end

end
