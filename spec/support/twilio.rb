RSpec.configure do |config|
  config.before(:each) do
    stub_const("Twilio::REST::Client", FakeSms)
  end
end
