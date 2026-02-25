require_relative '../lib/chiller'

describe 'A chiller' do
  it "has a capacity by default"do
    chiller = Chiller.new
    expect(chiller.capacity).to eq(100)
  end

  it "has capacity when specified" do
    chiller = Chiller.new(1000)
    expect(chiller.capacity).to eq(1000)
  end

  it "is initially is room temp" do
    chiller = Chiller.new
    expect(chiller.temperature).to eq(70)
  end

  it "lowers temperature changes when set" do
    chiller = Chiller.new
    chiller.set_level(1)
    expect(chiller.temperature).to eq(65)
    chiller.set_level(2)
    expect(chiller.temperature).to eq(60)
  end

  it "remaining capacity goes down as items are added" do
    chiller = Freezer.new(100)
    expect(chiller.remaining_capacity).to eq(100)
    pizza = Item.new('Leftover Pizza', 5)
    beer = Item.new('Beer', 10)
    chiller.add(pizza)
    chiller.add(beer)
    expect(chiller.remaining_capacity).to eq(85)
  end
end
