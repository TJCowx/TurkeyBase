# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
# => YO THESE EXAMPLES THEY HAVE ARE SICK! except Legolas > Luke, have to change that
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Legolas', movie: movies.last)

# Create the default admin
User.create!(user_id: "admin",
             is_admin: true,
             password: "admin_pass",
             password_confirmation: "admin_pass",
             login_role: true,
             active_user: false)

# Create the default sales role
User.create!(user_id: "sales",
             is_admin: false,
             password: "sales_pass",
             password_confirmation: "sales_pass",
             login_role: true,
             active_user: false)

# Create a test non-login role
User.create!(user_id: "Test non-login",
             is_admin: false,
             password: "password",
             password_confirmation: "password",
             login_role: false,
             active_user: true)

# Create a test non-login role
User.create!(user_id: "Test Disabled User",
            is_admin: false,
            password: "password",
            password_confirmation: "password",
            login_role: false,
            active_user: false)
