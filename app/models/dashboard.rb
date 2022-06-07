class Dashboard
  attr_reader :posts, :user

  def initialize(posts:, user:)
    @posts = posts
    @user = user
  end

  def todays_posts
    posts.today
  end

  def visible_posts
    posts.visible(user)
  end
end
