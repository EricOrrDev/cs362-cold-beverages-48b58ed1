require_relative '../lib/freezer'

describe 'A freezer' do

  it "has a capacity by default"do
    freezer = Freezer.new
    expect(freezer.capacity).to eq(100)
  end

  it "has a capacity when specified"do
    freezer = Freezer.new(1000)
    expect(freezer.capacity).to eq(1000)
  end

  it "is initially is room temp"do
    freezer = Freezer.new
    expect(freezer.temperature).to eq(70) #70 degrees is the assumed default, not even passed into constructor
  end
  it "remaining capacity goes down as items are added" do
    freezer = Freezer.new(100)
    expect(freezer.remaining_capacity).to eq(100)
    pizza = Item.new('Leftover Pizza', 5)
    beer = Item.new('Beer', 10)
    freezer.add(pizza)
    freezer.add(beer)
    expect(freezer.remaining_capacity).to eq(85)
  end
  
  it "lowers temperature by setting level" do
    freezer = Freezer.new
    expect(freezer.temperature).to eq(70)
    freezer.set_level(1)
    expect(freezer.temperature).to eq(60)
    freezer.set_level(2)
    expect(freezer.temperature).to eq(50)
  end
end
