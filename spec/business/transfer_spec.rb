require "rails_helper"

describe Transfer, type: :business do
  let(:account_debited)  { create(:bank_account,     balance: 100.0) }
  let(:account_credited) { create(:bank_account_two, balance: 0.0) }

  describe ".process(transfer_params)" do
    it "add +10 to account_credited" do
      expect { 
        Transfer.process(value: 10.0, account_debited_id: account_debited.id, account_number: account_credited.number) 
      }.to change {
        account_credited.reload.balance
      }.from(0.0).to(10.0) 
    end
  end
end