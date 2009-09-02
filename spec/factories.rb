Factory.define :question do |q|
  q.body Faker::Lorem.paragraph
end

Factory.define :user do |u|
  u.login "mcmaloney"
  u.sequence(:email) { |e| "michael#{e}@gmail.com" }
  u.first_name Faker::Name.first_name
  u.last_name Faker::Name.last_name
  u.password "123abc123"
  u.password_confirmation "123abc123"
end