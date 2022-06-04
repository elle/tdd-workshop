class Post < ApplicationRecord
  belongs_to :person, optional: false
  has_many :comments

  validates :title, presence: true

  def self.published
    where(published_on: ..Time.current)
  end

  def self.today
    start_of_day = Date.current.beginning_of_day
    end_of_day = Date.current.end_of_day
    where(published_on: start_of_day..end_of_day)
  end

  def self.visible(user)
    where(person: user).or(published)
  end
end
