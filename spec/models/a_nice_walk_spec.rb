require_relative "../../app/models/a_nice_walk"

RSpec.describe ANiceWalk do
  context "without a pet" do
    it "is impossible" do
      alice = double(pets: [])

      expect do
        described_class.for(alice)
      end.to raise_error CantWalkWithoutPets
    end
  end

  context "with pets" do
    it "does not raise an error" do
      alice = double(pets: [double])
      allow(alice).to receive(:update)

      expect do
        described_class.for(alice)
      end.not_to raise_error
    end

    it "makers the walker happy" do
      alice = double(pets: [double])
      allow(alice).to receive(:update)

      described_class.for(alice)

      expect(alice).to have_received(:update).with(happiness: 20)
    end
  end
end
