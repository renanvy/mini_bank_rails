require "rails_helper"

describe Transfer, type: :business do
  let(:account_debited)  { create(:bank_account,     balance: 100.0) }
  let(:account_credited) { create(:bank_account_two, balance: 0.0) }

  let(:quantity) { 50 }

  describe ".process(transfer_params)" do
    it "add +10 to account_credited" do
      expect { 
        Transfer.process(value: 10.0, account_debited_id: account_debited.id, account_number: account_credited.number) 
      }.to change {
        account_credited.reload.balance
      }.from(0.0).to(10.0) 
    end
  end

  context 'tax value' do
    it do
      week_day_comercial_hour = DateTime.new(2015, 06, 12, 10, 00, 00)
      expect(tax_by_date(week_day_comercial_hour, quantity)).to eql(Transfer::TAXES[:business_hour])
    end

    it do
      week_day_off_comercial_hour = DateTime.new(2015, 06, 13, 10, 00, 00)
      expect(tax_by_date(week_day_off_comercial_hour, quantity)).to eql(Transfer::TAXES[:off_business_hour])
    end

    it do
      weekend = DateTime.new(2015, 06, 24, 20, 00, 00)
      expect(tax_by_date(weekend, quantity)).to eql(Transfer::TAXES[:weekend])
    end

    context 'when quantity > 1000 add more 10 in tax' do
      let(:quantity) { 1500 }
      it do
        week_day_comercial_hour = DateTime.new(2015, 06, 12, 10, 00, 00)
        expect(tax_by_date(week_day_comercial_hour, quantity)).to eql(Transfer::TAXES[:business_hour] + 10)
      end

      it do
        week_day_off_comercial_hour = DateTime.new(2015, 06, 13, 10, 00, 00)
        expect(tax_by_date(week_day_off_comercial_hour, quantity)).to eql(Transfer::TAXES[:off_business_hour] + 10)
      end

      it do
        weekend = DateTime.new(2015, 06, 13, 20, 00, 00)
        expect(tax_by_date(weekend, quantity)).to eql(Transfer::TAXES[:weekend] + 10)
      end
    end
  end
end