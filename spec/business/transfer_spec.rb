require "rails_helper"

describe Transfer, type: :business do

  context "validations" do
    it { should validate_presence_of(:account_number) }
    it { should validate_presence_of(:value) }
    it { should validate_numericality_of(:account_number).only_integer }
    it { should validate_numericality(:value).is_greater_than(0.0) }
  end

end