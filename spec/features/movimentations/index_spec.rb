require "rails_helper"

feature "Movimentations" do

  let(:bank_account)     { create(:bank_account) }
  let(:bank_account_two) { create(:bank_account_two) }
  
  before(:each) do
    login_as(bank_account, scope: :bank_account)
    visit "/dashboard"

    create(:movimentation, bank_account: bank_account, account_destiny_id: bank_account_two.id)
    click_link "Extrato"
  end

  scenario "list all movimentations from bank account" do
    expect(page).to have_content("Transferência")
    expect(page).to have_content("R$ 10,00")
  end

end