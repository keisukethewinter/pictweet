FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)} #{"abe"}
    email                 {Faker::Internet.free_email} #{"kkk@gmail.com"}
    password              {Faker::Internet.password(min_length: 6)}#{"00000000"}
    password_confirmation {password}
  end
end