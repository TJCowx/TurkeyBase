# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create the default admin
User.create!(user_id: "admin",
             is_admin: true,
             password: "admin_pass",
             login_role: true)

# Create the default sales role
User.create!(user_id: "sales",
             is_admin: false,
             password: "admin_pass",
             login_role: true)

# Create a test non-login role
User.create!(user_id: "Test non-login",
             is_admin: false,
             password: "password",
             login_role: false)
