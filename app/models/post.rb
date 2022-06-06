class Post < ApplicationRecord
  belongs_to :person

  has_many :comments
  
  def self.published
    # where("published_on <= ?", Time.current)
    where(published_on: ..Time.current)
  end
end
