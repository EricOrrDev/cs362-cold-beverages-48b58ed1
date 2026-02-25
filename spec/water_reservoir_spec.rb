require_relative '../lib/water_reservoir'

describe 'A water reservoir' do

  it "has a capacity by default"do
    water_reservoir = WaterReservoir.new
    expect(water_reservoir.capacity).to eq(10)
  end

  it "has a capacity when specified"do
    water_reservoir = WaterReservoir.new(100)
    expect(water_reservoir.capacity).to eq(100)
  end

  it "raises error when negative capacity is specified"do
    expect{WaterReservoir.new(-100)}.to raise_error("Capacity must be positive")
  end

  it "can be filled" do
    water_reservoir = WaterReservoir.new
    water_reservoir.fill
    expect(water_reservoir.current_water_volume).to eq(water_reservoir.capacity)
  end

  it "can be emptied" do
    water_reservoir = WaterReservoir.new(100)
    water_reservoir.fill
    water_reservoir.drain(50)
    expect(water_reservoir.current_water_volume).to eq(50)
  end

  it "cannot have a negative current volume" do
    water_reservoir = WaterReservoir.new(100)
    water_reservoir.fill
    water_reservoir.drain(500)
    expect(water_reservoir.current_water_volume).to eq(0)
  end

end
