class CreateAndWelcomeUser
  def initialize(user_params)
    @user_params = user_params
  end

  def self.call(user_params)
    new(user_params).call
  end

  def call
    if person.valid? && person.save
      InviteUserJob.perform_later(person.id)
    end

    person
  end

  private

  attr_reader :user_params

  def person
    @person ||= Person.new(user_params)
  end
end
