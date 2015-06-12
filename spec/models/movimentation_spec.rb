require 'rails_helper'

describe Movimentation, type: :model do

  let(:movimentation) { create(:movimentation, created_at: "2015-06-11 23:41:29") }

  context "associations" do
    it { should belong_to(:bank_account) }
  end

  describe "scope by_period" do
    it do
      expect(
        Movimentation.by_period(
          "2015-06-11",
          "2015-06-12",
          movimentation.bank_account
        )
      ).to include(movimentation)
    end
  end
 
  describe "scope by_bank_account" do
    it do
      expect(Movimentation.by_bank_account(movimentation.bank_account)).to include(movimentation)
    end
  end
  
end