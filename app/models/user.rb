class User < ApplicationRecord
    has_secure_password     # Needed for hashing password
end
