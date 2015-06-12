require "rails_helper"

describe Deposit, type: :business do

  let(:account_origin)  { create(:bank_account) }
  let(:account_destiny) { create(:bank_account_two, balance: 0.0) }

  context "validations" do
    it { should validate_presence_of(:account_number) }
    it { should validate_presence_of(:value) }
    it { should validate_numericality_of(:account_number).only_integer }
    it { should validate_numericality_of(:value).is_greater_than(0.0) }
  end

  describe ".process(deposit_params)" do
    it "deposit +10 to account destiny" do
      expect { 
        Deposit.process(value: 10.0, current_bank_account_id: account_origin.id, account_number: account_destiny.number) 
      }.to change {
        account_destiny.reload.balance
      }.from(0.0).to(10.0) 
    end
  end

end