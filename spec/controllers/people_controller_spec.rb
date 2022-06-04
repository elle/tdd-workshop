require "rails_helper"

RSpec.describe PeopleController do
  describe "#new" do
    context "when not logged in" do
      it "is denied access" do
        get :new

        expect(response).to redirect_to(login_path)
        expect(flash[:alert]).to eq t("flash.unauthorised")
      end
    end

    context "when logged in user who is not an admin" do
      it "is denied access" do
        user = double(:person, :admin? => false)
        allow(controller).to receive(:current_user).and_return(user)

        get :new

        expect(response).to redirect_to(login_path)
        expect(flash[:alert]).to eq t("flash.unauthorised")
      end
    end
  end

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
