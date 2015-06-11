require "rails_helper"

feature "Balance" do

  let(:bank_account)     { create(:bank_account, balance: 100.0) }
  
  before(:each) do
    login_as(bank_account, scope: :bank_account)
    visit "/dashboard"
    
    click_link "Exibir saldo"
  end

  scenario "show balance" do
    expect(page).to have_content("Saldo: R$ 100,00")
  end

end