admin = User.create!(	
	name:  "admin",
  email: "admin@example.com",
	password:              "apptivism",
	password_confirmation: "apptivism",
	admin: true,
	activated: true,
	activated_at: Time.zone.now)

# 99.times do |n|
#   name  = Faker::Name.name
#   email = "example-#{n+1}@example.com"
#   password = "password"
#   User.create!(name:  name,
#                email: email,
#                password:              password,
#                password_confirmation: password,
#								 activated: true,
#								 activated_at: Time.zone.now)
# end