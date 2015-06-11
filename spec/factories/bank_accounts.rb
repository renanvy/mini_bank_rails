FactoryGirl.define do

  factory :bank_account do
    name "Renan"
    number "00001"
    email "renanvy@gmail.com"
    password 12345678
    password_confirmation 12345678
    balance 100.0
    active true

    factory :bank_account_two do
      name "Camila"
      number "00002"
      email "camila@gmail.com"
      password 12345678
      password_confirmation 12345678
      balance 200.0
      active true
    end
  end

end
