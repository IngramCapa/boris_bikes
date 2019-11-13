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
  
end

RSpec.describe Bike do

end

RSpec.describe Staff do

end