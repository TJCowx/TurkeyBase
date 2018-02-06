class User < ApplicationRecord
  # Validate the User ID for being there, max 30 characters, and unique
  validates :user_id, presence: true, length: {maximum:30},
                length: {minimum:2},
                uniqueness: {case_sensitive: false}


  has_secure_password     # Needed for hashing password
  # validate the Password for being there & matching confirmation
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
end
