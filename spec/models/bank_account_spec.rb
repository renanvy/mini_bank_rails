require 'rails_helper'

describe BankAccount, type: :model do

  
  
  context "validations" do
    it { should validate_presence_of(:name) }
  end

  context "associations" do
    it { should have_many(:movimentations) }
  end

  describe "#generate_account_number" do
  
    let(:bank_account) { build(:bank_account, number: nil) }

    it do
      bank_account.save!
      expect(bank_account.number).not_to be_nil 
    end
  end
end
