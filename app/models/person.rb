class Person < ApplicationRecord
  validates :admin, inclusion: { in: [true, false]}
  validates :email, uniqueness: true
  validates :first_name, presence: true

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  after_initialize :set_token

  def confirmed?
    confirmed_at.present?
  end

  def full_name
    [first_name, last_name].compact.join(" ").titleize
  end

  private

  def set_token
    self.token = SecureRandom.hex(10).encode("UTF-8")
  end
end
