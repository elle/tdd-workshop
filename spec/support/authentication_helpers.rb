module AuthenticationHelpers
  def login_as(user)
    visit login_path

    within "form" do
      fill_in :session_email, with: user.email
      click_on t("sessions.new.log_in")
    end
  end
end

RSpec.configure do |config|
  config.include AuthenticationHelpers, type: :feature
end
