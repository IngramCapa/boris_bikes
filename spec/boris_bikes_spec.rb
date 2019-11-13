require "boris_bikes"

# the shared examples were written for the method which takes health points off bikes
# with each return. method not written yet.

RSpec.shared_examples "bike examples" do
  # mock bike to test class methods
  let(:test_bike1) { Bike.new }
  let(:test_bike2) { Bike.new }

  before(:each) do
    # in the instance of low health:
    test_bike1.health = 3
    # in the instance of good health:
    test_bike2.health = 8
  end
end


# RSpec.describe "customer rents bike" do
#   let(:test_docking_station) { DockingStation.new }
# end

RSpec.describe Customer do
  it "should have money to spend" do
    expect(subject).to respond_to(:budget)
  end

  it "it needs to be able to store a bike" do
    expect(subject).to respond_to(:rented_bike)
    expect(subject.rented_bike).to be_an_instance_of(Array)
  end

  it "needs to know when it rented a bike" do
    expect(subject).to respond_to(:rental_time)
  end
end

RSpec.describe DockingStation do
  # mock variables for docking stations with default and bespoke values
  let(:default_docking_station) { DockingStation.new }
  let(:bespoke_docking_station) { DockingStation.new(20) }

  it "should have a bike rack" do
    expect(subject).to respond_to(:bike_rack)
  end
  
  it "should be able to store bikes" do
    expect(subject.bike_rack).to be_an_instance_of(Array)
    expect(subject.bike_rack).to all(be_an_instance_of(Bike))
  end

  it "should have a finite capacity for bike storage" do
    # 10 by default
    expect(subject).to respond_to(:max_bikes)
    expect(subject.max_bikes).to be_an_instance_of(Integer)
    expect(default_docking_station.max_bikes).to be 10
  end

  context "when given an bespoke capacity" do
    it "should have a bespoke 'max_bikes' value" do
      expect(bespoke_docking_station.max_bikes).to be 20
    end
  end

  context "to check number of docked bikes (.existing_bikes)" do 
    it "should count the number of docked bikes" do 
      expect(subject).to respond_to(:existing_bikes)
      expect(subject.existing_bikes).to be_an_instance_of(Integer)
      expect(subject.existing_bikes).to eq subject.bike_rack.length
    end
  end

end

RSpec.describe Bike do

  it "should have a functioning status" do
    expect(subject).to respond_to(:working)
    expect(subject.working).to be(true).or be(false)
    expect(subject).to respond_to(:health)
  end

  it "should have an availability status" do
    expect(subject).to respond_to(:in_use)
    expect(subject.in_use).to be(true).or be(false)
  end

  context "bike condition (.health)" do
    include_examples "bike examples"

    it "should be an integer" do
      expect(subject.health).to be_an_instance_of(Integer)
      expect(subject.health).to be_between(0, 10)
    end

    it "should check for wear and tear" do
      expect(subject).to respond_to(:broken?)
      expect(subject.broken?).to be(true).or be(false)
    end

    context "when 'health' is too low" do
      include_examples "bike examples"

      before(:each) do
        test_bike1.working = test_bike1.broken? ? false : true
        test_bike2.working = test_bike2.broken? ? false : true
      end

      it "should update functioning status to false" do
        expect(test_bike1.working).to be_falsy
        expect(test_bike2.working).to be_truthy
      end
    end
  end
end

RSpec.describe Staff do

end