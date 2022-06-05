# Preview all emails at http://localhost:3000/rails/mailers/person
class PersonPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/person/invite
  def invite
    person = FactoryBot.build(:person)
    PersonMailer.invite(person)
  end
end
