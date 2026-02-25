require_relative '../lib/refrigerator'

describe 'A refrigerator' do
  let(:chiller) { Chiller.new}
  let(:freezer) {Freezer.new}
  let(:water_reservoir) {WaterReservoir.new}
  let(:water_dispenser){ WaterDispenser.new(water_reservoir)}
  let(:refrigerator) {Refrigerator.new(chiller, freezer, water_dispenser, water_reservoir)}

  it "initially is turned off" do
    expect(refrigerator.to_s).to include("Power: off") 
  end

  it "can be turned on" do
    refrigerator.plug_in
    expect(refrigerator.to_s).to include("Power: on") 
  end

  it "turns off when unplugged" do
    refrigerator.plug_in
    expect(refrigerator.to_s).to include("Power: on")
    refrigerator.unplug
    expect(refrigerator.to_s).to include("Power: off") 
  end

  it "has expected default capacity" do
    expect(refrigerator.to_s).to include("Storage: 200 of 200 available")
  end

  it "remaining capacity goes down as items are added" do
    pizza = Item.new('Leftover Pizza', 5)
    refrigerator.chill(pizza)
    beer = Item.new('Beer', 10)
    refrigerator.freeze(beer)
    ice_cream = Item.new('Ice Cream', 10)
    refrigerator.chill(ice_cream)
    expect(refrigerator.to_s).to include("Storage: 175 of 200 available")
  end

  it "has expected temperatures" do
    refrigerator.plug_in
    expect(refrigerator.to_s).to include("Temps: Chiller is 70, Freezer is 70")
    refrigerator.set_chiller_level(1)
    refrigerator.set_freezer_level(1) 
    expect(refrigerator.to_s).to include("Temps: Chiller is 65, Freezer is 60")
  end

  
end
