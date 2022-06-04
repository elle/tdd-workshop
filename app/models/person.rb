class Person < ApplicationRecord
  has_many :posts, dependent: :destroy

  validates :admin, inclusion: { in: [ true, false ] }
  validates :email, presence: true, uniqueness: true
  validates :first_name, presence: true

  after_initialize :set_token

  def full_name
    [first_name, last_name].compact.join(" ").titleize
  end

  private

  def set_token
    self.token = SecureRandom.hex(10).encode("UTF-8")
  end
end
