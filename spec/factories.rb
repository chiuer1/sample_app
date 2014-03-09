FactoryGirl.define do
  factory :user do
    name      "Factory Created"
    email      "factory@def.org"
    password      "foobar"
    password_confirmation      "foobar"
  end
end
