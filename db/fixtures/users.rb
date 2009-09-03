password = "123abc123"

User.seed(:login, :email, :curator) do |s|
  s.login = "mcmaloney"
  s.email = "maloney.mc@gmail.com"
  s.password = password
  s.password_confirmation = password
  s.curator = true
end