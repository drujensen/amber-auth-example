require "amber"
require "../src/models/*"

user = User.new
user.email = "admin@example.com"
user.password = "password"
user.save
