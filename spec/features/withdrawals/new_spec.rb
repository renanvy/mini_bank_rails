require "rails_helper"

feature "New withdrawal" do

  let(:bank_account) { create(:bank_account) }
  
  before(:each) do
    login_as(bank_account, scope: :bank_account)
    visit "/dashboard"
    click_link "Efetuar saque"
  end

  scenario "New withdrawal with valid fields" do
    
    within "#new_withdrawal" do
      fill_in "withdrawal[value]", with: "10.0"
    end

    click_button "Sacar"

    expect(page).to have_content("Saque feito com sucesso.")
  end

end