require "rails_helper"

RSpec.describe SendSms do
  describe ".call" do
    it "sends an sms to user" do
      phone_number = "0400123456"
      body = "Hi"

      described_class.call(to: phone_number, body: body)

      last_message = FakeSms.messages.last
      expect(last_message.to).to eq phone_number
      expect(last_message.body).to eq body
      expect(last_message.from).to eq ENV.fetch("TWILIO_FROM_NUMBER")
    end
  end
end
