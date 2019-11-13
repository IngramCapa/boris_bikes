require "boris_bikes"

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
  it "should have a bike rack" do
    expect(subject).to respond_to(:bike_rack)
  end
  
  it "should be able to store bikes" do
    expect(subject.bike_rack).to be_an_instance_of(Array)
    expect(subject.bike_rack).to all(be_an_instance_of(Bike))
  end

  it "should have a finite capacity for bike storage" do
    expect(subject).to respond_to(:max_bikes)
    expect(subject.max_bikes).to be_an_instance_of(Integer)
  end

  context "to check number of docked bikes" do 
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

  context "bike condition" do
    it "should be an integer" do
      expect(subject.health).to be_an_instance_of(Integer)
      expect(subject.health).to be_between(0, 10)
    end
  end
end

RSpec.describe Staff do

end