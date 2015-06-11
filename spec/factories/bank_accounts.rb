FactoryGirl.define do

  factory :bank_account do
    name "Renan"
    number 00001
    email "renanvy@gmail.com"
    password 12345678
    password_confirmation 12345678
    balance 100.0
    active true
  end

end
