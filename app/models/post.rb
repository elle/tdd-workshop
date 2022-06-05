class Post < ApplicationRecord
  belongs_to :person

  has_many :comments

  enum status: {
    draft: 0,
    finished: 1,
    reviewed: 2,
    accepted: 3,
    published: 4,
    promoted: 5,
    rejected: 6,
    archived: 7,
  }
end
