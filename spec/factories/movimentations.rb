FactoryGirl.define do
  factory :movimentation do
    operation "Transferência"
    value 10.0
    association :bank_account
  end

end
