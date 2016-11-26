# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Teacher.create(name: 'Параход')
Group.create(style:'Хастел', title: 'ДнД')
Lesson.create(style:'Хастел',start_time:'2016-11-23T10:11:00', group_id: '1', duration: 60, teacher_ids: [1])
User.create(email: 'test@test.com', password: 'qazwsx', admin: 'true', first_name: 'Админ', last_name: 'Админов')
User.create(email: 'test2@test.com', password: 'qazwsx', first_name: 'Вася', last_name: 'Васин')