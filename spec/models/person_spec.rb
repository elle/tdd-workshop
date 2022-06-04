require "rails_helper"

RSpec.describe Person do
  context "validations" do
    subject { build(:person) }

    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:email) }
    it { is_expected.to allow_value(false).for(:admin) }
    it { is_expected.to allow_value(true).for(:admin) }
    it { is_expected.not_to allow_value(nil).for(:admin) }
  end

  context "associations" do
    it { is_expected.to have_many(:posts).dependent(:destroy) }
  end

  describe "#admin" do
    it "defaults to false" do
      # build(:person) is slower then Person.new
      expect(Person.new).not_to be_admin
    end

    context "when set to true" do
      it "returns true" do
        person = Person.new(admin: true)

        expect(person).to be_admin
      end
    end
  end

  # # for instance methods
  # . for class methods
  describe "#full_name" do
    context "with first name only" do
      it "returns first name alone" do
        person = Person.new(first_name: "Peter")

        result = person.full_name

        expect(result).to eq("Peter")
      end
    end

    context "with first and last names" do
      it "returns both" do
        person = Person.new(first_name: "Peter", last_name: "Quill")

        expect(person.full_name).to eq("Peter Quill")
      end
    end
  end

  it "returns a titleized fullname" do
    person = Person.new(first_name: "peter", last_name: "quill")

    expect(person.full_name).to eq("Peter Quill")
  end

  describe "#confirmed?" do
    # when present -> returns true
    # when nil -> returns false
  end

  describe "#set_token" do
    context "on initialize" do
      it "sets a random token" do
        expect(Person.new.token).to be_present
      end
    end
  end
end

