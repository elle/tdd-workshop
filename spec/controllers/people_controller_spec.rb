require "rails_helper"

RSpec.describe PeopleController do
  include_examples "require login"
  include_examples "require admin"

  describe "#create" do
    context "when params for person are invalid" do
      it "renders #new" do
        admin = double(:person, :admin? => true)
        allow(controller).to receive(:current_user).and_return(admin)

        post :create, params: { person: { first_name: "", email: "" } }

        expect(response).to render_template(:new)
      end
    end
  end
end
