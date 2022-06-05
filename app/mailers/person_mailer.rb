class PersonMailer < ApplicationMailer
  def invite(person)
    @person = person

    mail to: @person.email
  end
end
