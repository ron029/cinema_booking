# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  admin           :string(1)
#  email           :string
#  full_name       :string
#  mobile_number   :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
FactoryBot.define do
  factory :user do
    full_name { "MyString" }
    email { "MyString" }
    mobile_number { "MyString" }
    password_digest { "MyString" }
    admin { "MyString" }
  end
end
