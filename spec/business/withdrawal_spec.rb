require "rails_helper"

describe Withdrawal, type: :business do

  let(:bank_account) { create(:bank_account, balance: 100.0) }

  describe ".process(withdrawal_params)" do

    it "discount -10 from bank account" do
      expect { 
        Withdrawal.process(value: 10.0, current_bank_account_id: bank_account.id) 
      }.to change {
        bank_account.reload.balance
      }.from(100.0).to(90.0) 
    end
  end

end