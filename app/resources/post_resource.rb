class PostSerializer < ActiveModel::Serializer
  has_many :comments

  attributes :id, :title, :body
end
