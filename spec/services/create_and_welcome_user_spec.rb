require "rails_helper"

RSpec.describe CreateAndWelcomeUser do
  it "can be initialized with user params" do
    user_params = attributes_for(:user)

    expect do
      described_class.new(user_params)
    end.not_to raise_error
  end

  describe ".call" do
    it "saves a user" do
      user_params = attributes_for(:user)

      expect do
        described_class.call(user_params)
      end.to change(Person, :count).by(1)
    end

    it "invites a new user" do
      user_params = { first_name: "John", email: "john@example.com" }
      allow(InviteUserJob).to receive(:perform_later)

      described_class.call(user_params)

      expect(InviteUserJob).to have_received(:perform_later)
    end

    it "returns the user" do
      user_params = attributes_for(:user)

      result = described_class.call(user_params)

      expect(result).to be_kind_of(Person)
    end

    context "when invalid user params" do
      it "does not save user" do
        allow(InviteUserJob).to receive(:perform_later)

        result = described_class.call({})

        expect(result.errors.messages[:first_name]).to include "can't be blank"
      end

      it "doesn't invite user" do
        allow(InviteUserJob).to receive(:perform_later)

        result = described_class.call({})

        expect(InviteUserJob).not_to have_received(:perform_later)
      end
    end
  end
end
