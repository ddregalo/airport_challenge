require_relative '../lib/plane'

describe Plane do

  describe '#land' do
    # testing for instruct_land method
    it 'should land plane into @landed_planes' do
      # test landing plane assuming good weather and instruct sent from airport
      #london = object_double(Airport.new, :weather => 1)  # Trying to setup double
      airport = Airport.new
      plane = Plane.new
      airport.instruct_land(plane)
      airport.current_weather = 1
      # allow(london).to receive(:land.and_return(london.landed_planes << plane) #double setup
      expect(plane.land(airport)).to eq(airport.landed_planes)
    end

    it 'should not allow plane to land if airport is at full capacity' do
      # raises error if try to land plane at airport with zero capacity
      airport = Airport.new(0)
      plane = Plane.new
      airport.current_weather = 1
      airport.instruct_land(plane)
      expect { plane.land(airport) }.to raise_error('No capacity in airport')
    end

    it 'should not allow plane to land if plane is already landed' do
      # raises error if try to land the same plane twice
      london = Airport.new
      plane = Plane.new
      london.current_weather = 1
      london.land(plane)
      expect { london.land(plane) }.to raise_error('Plane already landed')
    end

    it 'should not allow planes to land without instruct_land from airport' do
      #do not let planes land if not instructed to by airport
      london = Airport.new
      plane = Plane.new
      london.current_weather = 1
      expect { london.land(plane) }.to raise_error('No instruct from airport to land')
    end
  end

end
