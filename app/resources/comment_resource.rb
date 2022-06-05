class CommentSerializer < JSONAPI::Resource
  attributes :id, :person, :post, :body
end
