require "rails_helper"

RSpec.describe "PostsAPI" do
  describe "get api/v1/posts" do
    it "is successful" do
      create_list(:post, 2)

      get "/api/v1/posts"

      expect(response.status).to eq 200
    end

    it "returns the correct number of posts" do
      create_list(:post, 2)

      get "/api/v1/posts"

      posts = JSON.parse(response.body)

      expect(posts.count).to eq(2)
    end
  end
end
