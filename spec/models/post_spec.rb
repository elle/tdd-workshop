require "rails_helper"

RSpec.describe Post do
  include ActiveSupport::Testing::TimeHelpers

  context "validations" do
    # validate title, and body, person
  end

  context "associations" do
    # belongs to person
    # has_many comments
  end

  describe ".published" do
    context "when published_on is set to today or the past timestamp" do
      it "returns the past or today's posts" do
        _draft = create(:post, title: "Draft", published_on: nil)
        yesterday_post = create(:post, title: "Yesterday", published_on: 1.day.ago)
        todays_post = create(:post, title: "Today", published_on: Time.current)
        future_post = create(:post, title: "Tomorrow", published_on: 1.day.from_now)

        result = described_class.published

        expect(result).to eq [yesterday_post, todays_post] # match_array # include
      end
    end
  end

  describe ".today" do
    # return only posts from today
  end

  describe ".visible?" do
    # return all published posts by anyone
    # if the posts are by me `Post.visible?(user)`
    #   -> return all my posts as well, regardless whether they are published or not
  end
end
