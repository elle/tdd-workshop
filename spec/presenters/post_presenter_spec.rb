require "rails_helper"

RSpec.describe PostPresenter do
  describe "#intro" do
    context "when description is present" do
      it "returns h3 and p tags " do
        html = "<h3>Description</h3><p>Lorem</p>"
        post = instance_double(Post, description: "Lorem")

        presenter = described_class.new(post)

        expect(presenter.intro).to eq html
      end
    end

    context "when description is not present" do
      it "returns nil" do
        post = instance_double(Post, description: nil)

        presenter = described_class.new(post)

        expect(presenter.intro).to be_nil
      end
    end
  end

  describe "#published_date" do
    context "when unpublished" do
      it "returns nil" do
        post = instance_double(Post, published_on: nil)

        presenter = described_class.new(post)

        expect(presenter.published_date).to be_nil
      end
    end

    context "when published" do
      it "returns formated string" do
        html = "Published on Jun 03"
        date =  Time.zone.parse("2022-06-03").to_date
        post = instance_double(Post, published_on: date)

        presenter = described_class.new(post)

        expect(presenter.published_date).to eq html
      end
    end
  end

  describe "#written_by" do
    it "returns the name of the person the post belongs to" do
      html = "<p>Written by Emily</p>"
      person = instance_double(Person, first_name: "Emily")
      post = instance_double(Post, person: person)

      presenter = described_class.new(post)

      expect(presenter.written_by).to eq html
    end
  end
end
