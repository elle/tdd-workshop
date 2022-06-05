class Person < ApplicationRecord
  after_initialize :set_token

  private

  def set_token
    self.token = SecureRandom.hex(10).encode("UTF-8")
  end
end
