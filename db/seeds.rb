30.times do |n|
  email = Faker::Internet.email
  name = Faker::Name.name
  password = "password"
  User.create!(
    name: name,
    email: email,
    password: password,
    password_confirmation: password
    )
end

User.all.each do |user|
  user.surgical_operations.create!(
    title: 'タイトル',
    content: '手順',
    status: '編集済み',
    medical_department: '診療科目',
    image: File.open('./app/assets/images/test.jpg')
  )
end