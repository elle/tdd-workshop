require "rails_helper"

RSpec.describe Person do
  context "validations" do
    # add validations first_name. email, admin
  end

  context "associations" do
    # has_many posts, dependent
  end

  describe "admin" do
    # defaults to false, otherwise returns true
  end

  describe "full_name" do
    # when only first name is present -> returns first_name
    # when both first and last, returns both
    # returns a titleized full name
  end
end
