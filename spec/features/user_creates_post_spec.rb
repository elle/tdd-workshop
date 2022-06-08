require "rails_helper"

RSpec.feature "user creates post" do
  scenario "and publishes it" do
    user = create(:person)

    login_as user

    visit new_post_path
    fill_in :post_title, with: "Amazing news"
    fill_in :post_body, with: "Lorem ipsum"
    click_on "Publish"

    expect(page)
      .to have_text t("flash.actions.create.notice", resource_name: "Post")
    expect(page).to have_text(user.first_name)
    expect(page).to have_text "Amazing news"
    expect(page).to have_text "Published on"
  end
end
