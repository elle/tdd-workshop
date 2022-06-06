require "rails_helper"

RSpec.describe Person do
  context "validations" do
    subject { build(:person) }

    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_uniqueness_of(:email) }
    it { is_expected.to allow_value(false).for(:admin) }
    it { is_expected.to allow_value(true).for(:admin) }
    it { is_expected.not_to allow_value(nil).for(:admin) }
  end

  context "associations" do
    it { is_expected.to have_many(:posts).dependent(:destroy) }
    it { is_expected.to have_many(:comments).dependent(:destroy) }
  end

  describe "#admin" do
    it "defaults to false" do
      person = described_class.new

      expect(person).not_to be_admin
      # expect(person.admin).to eq false
      # expect(person.admin).to be_falsy
    end
  end

  describe "#full_name" do
    context "when only first name is present" do
      it "returns first_name" do
        person = described_class.new(first_name: "Surya")

        result = person.full_name

        expect(result).to eq "Surya"
      end
    end

    context "when both first and last names are present" do
      it "returns first and last names" do
        person = described_class.new(first_name: "Surya", last_name: "Setiyaputra")

        result = person.full_name

        expect(result).to eq "Surya Setiyaputra"
      end
    end

    it "returns a titleized full name" do
      person = described_class.new(first_name: "thor", last_name: "odinson")

      result = person.full_name

      expect(result).to eq "Thor Odinson"
    end
  end

  describe "#confirmed?" do
    context "when confirmed_at is present" do
      it "returns true" do
        person = described_class.new(confirmed_at: Time.current)

        expect(person).to be_confirmed
      end
    end

    context "when confirmed_at is nil" do
      it "return false" do
        expect(described_class.new).not_to be_confirmed
      end
    end
  end

  describe "#set_token" do
    context "on initialize" do
      it "sets a random token" do
        expect(Person.new.token).to be_present
      end
    end
  end
end
