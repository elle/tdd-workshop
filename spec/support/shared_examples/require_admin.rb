RSpec.shared_examples "require admin" do
  describe "#new" do
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
end

