RSpec.shared_examples "require login" do
  describe "#new" do
    context "when not logged in" do
      it "is denied access" do
        get :new

        expect(response).to redirect_to(login_path)
        expect(flash[:alert]).to eq t("flash.unauthorised")
      end
    end
  end
end
