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
    image: File.open('./public/images/img/test.jpg')
  )
end

readings_list = []
User.all.ids.each do |user_id|
  SurgicalOperation.all.each do |surgical_operation|
    readings_list << { user_id: user_id, surgical_operation_id: surgical_operation.id }
  end
end
Reading.create!(readings_list)
