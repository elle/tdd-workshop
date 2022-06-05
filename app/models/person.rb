class Person < ApplicationRecord
  has_many :posts, dependent: :destroy

  validates :admin, inclusion: { in: [ true, false ] }
  validates :email, presence: true, uniqueness: true
  validates :first_name, presence: true

  after_initialize :set_token

  def full_name
    [first_name, last_name].compact.join(" ").titleize
  end

  def invite
    InviteUserJob.perform_later(id)
  end
  # Job.perform_later -> queues the job (super fast)
  # web worker that is listening
  # once it sees the job in the queue, it grabs it
  # when it executes it -> PersonMailer.invite(user).deliver_now

  private

  def set_token
    self.token = SecureRandom.hex(10).encode("UTF-8")
  end
end
