require "rails_helper"

RSpec.describe PersonMailer do
  describe "invite" do
    context "headers" do
      it "renders the subject" do
        person = build(:person)

        mail = described_class.invite(person)

        expect(mail.subject).to eq t("person_mailer.invite.subject")
      end

      it "sends to the right email" do
        person = build(:person)

        mail = described_class.invite(person)

        expect(mail.to).to eq [person.email]
      end

      it "renders the from email" do
        person = build(:person, token: "abc")

        mail = described_class.invite(person)

        expect(mail.from).to eq [ENV.fetch("DEFAULT_EMAIL")]
      end
    end

    it "includes the correct url with the user's token" do
      person = build(:person, token: "abc")

      mail = described_class.invite(person)

      expect(mail.body.encoded)
        .to include new_confirmation_url(token: person.token)
    end
  end
end
