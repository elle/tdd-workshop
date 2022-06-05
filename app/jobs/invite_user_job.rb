class InviteUserJob < ApplicationJob
  queue_as :user_invites

  def perform(user_id)
    user = Person.find(user_id)
    if user
      PersonMailer.invite(user).deliver_now
    end
  end
end
