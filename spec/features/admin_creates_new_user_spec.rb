require "rails_helper"

RSpec.feature "creating a person" do
  scenario "with valid data" do
    admin = create(:admin)
    login_as(admin)

    visit new_person_path

    fill_in :person_first_name, with: "Mike"
    fill_in :person_email, with: "mike@example.com"
    check :person_admin
    click_on "Create person"

    expect(page).to have_text "Person was successfully created"
    new_person = Person.find_by(email: "mike@example.com")

    expect(page).to have_text "Mike"
    expect(page).to have_text "Admin: yes"
    expect(current_path).to eq person_path(new_person)
  end
end
