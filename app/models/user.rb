class User < ApplicationRecord
    has_secure_password     # Needed for hasing password
end
