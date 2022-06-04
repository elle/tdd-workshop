require "rails_helper"

RSpec.feature "user logs in" do
  scenario "and log out" do
    name = "Sylvie"
    user = create(:person, first_name: name)

    visit root_path

    expect(page).not_to have_text(name)
    expect(page).not_to have_text t("application.user_nav.log_out")

    click_on t("sessions.new.log_in")

    within "form" do
      fill_in :session_email, with: user.email
      click_on t("sessions.new.log_in")
    end

    expect(page).to have_text t("flash.sessions.create.notice")
    expect(page).to have_text(name)
    expect(page).to have_text t("application.user_nav.log_out")
    expect(page).not_to have_text t("application.user_nav.log_in")

    click_on t("application.user_nav.log_out")

    expect(page).to have_current_path(root_path)
    expect(page).to have_text t("flash.sessions.destroy.notice")
    expect(page).not_to have_text(name)
    expect(page).not_to have_text t("application.user_nav.log_out")
  end
end