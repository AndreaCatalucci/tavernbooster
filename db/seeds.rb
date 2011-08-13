# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'ffaker'

%w(administrator cashier cook waiter).each do |role|
  Role.find_or_create_by_name(role)
end

%w(primo secondo bevanda).each do |course_type|
  CourseType.find_or_create_by_name(course_type)
end

(1..50).each do |n|
  Table.find_or_create_by_number(n)
end

#create fake users
#20.times do |n|
#  us = User.new(:username=> Faker::Internet.user_name, :first_name => Faker::Name.first_name, :last_name => Faker::Name.last_name, :password => 'password')
#  us.role = Role.find((n % 4) + 1)
#  us.save
#end

#create fake courses
15.times do |n|
  cou = Course.new(:name => Faker::Lorem.words(3), :price => n.to_f)
  cou.course_type = CourseType.find( (n % 3) + 1)
  cou.save
end