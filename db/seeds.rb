def create_user(email, name)
  User.create!(
    name: name,
    email: email,
    password: 'password'
  )
  end

1...20.times do |i|
  create_user("person_#{i}@test#{i}.io", "person_#{i}")
end
