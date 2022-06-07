require "rails_helper"

RSpec.describe Dashboard do
  describe "#todays_posts" do
    it "returns posts created today" do
      # should test that when we call `todays_posts` it calls `.today` on Post
      allow(Post).to receive(:today)
      dashboard = Dashboard.new(posts: Post.all, user: double)

      dashboard.todays_posts

      expect(Post).to have_received(:today)
    end
  end

  describe "#visible_posts" do
    it "returns posts visible to the current user" do
      user = double(:user)
      dashboard = Dashboard.new(posts: Post.all, user: user)
      allow(Post).to receive(:visible).with(user)

      dashboard.visible_posts

      expect(Post).to have_received(:visible).with(user)
    end
  end
end
