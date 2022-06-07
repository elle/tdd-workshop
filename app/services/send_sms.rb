require "twilio-ruby"

class SendSms
  attr_reader :body, :from, :to

  def initialize(to:, body:)
    @from = ENV.fetch("TWILIO_FROM_NUMBER")
    @to = to
    @body = body
  end

  def self.call(to:, body:)
    new(to: to, body: body).call
  end

  def call
    client.messages.create(from: from, to: to, body: body)
  end

  private

  def client
    @client ||= ENV["SMS_CLASS"].constantize.new(
      ENV.fetch("TWILIO_ACCOUNT_SID"),
      ENV.fetch("TWILIO_ACCOUNT_TOKEN"),
    )
  end
end
