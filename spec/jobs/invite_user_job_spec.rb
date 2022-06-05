require "rails_helper"

RSpec.describe InviteUserJob do
  describe "#perform" do
    it "calls on the PersonMailer" do
      user = double("person", id: 1)
      allow(Person).to receive(:find).and_return(user)
      allow(PersonMailer).to receive_message_chain(:invite, :deliver_now)

      described_class.new.perform(user.id)

      expect(PersonMailer).to have_received(:invite)
    end
  end

  describe ".perform_later" do
    it "adds the job to the queue :user_invites" do
      allow(PersonMailer).to receive_message_chain(:invite, :deliver_now)

      described_class.perform_later(1)

      expect(enqueued_jobs.last[:job]).to eq described_class
    end
  end
end
