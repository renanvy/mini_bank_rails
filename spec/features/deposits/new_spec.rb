require "rails_helper"

feature "NewDeposit" do

  let(:bank_account) { create(:bank_account) }
  
  before(:each) do
    login_as(bank_account, scope: :bank_account)
    visit "/dashboard"
    click_link "Efetuar depósito"
  end

  scenario "New deposit with valid fields" do
    
    within "#new_deposit" do
      fill_in "deposit[value]", with: "10.0"
      fill_in "deposit[account_number]", with: "1234"
    end

    click_button "Fazer depósito"

    expect(page).to have_content("Depósito realizado com sucesso.")
  end

  scenario "New deposit with invalid fields" do
    
    within "#new_deposit" do
      fill_in "deposit[value]", with: "-1"
      fill_in "deposit[account_number]", with: "1234"
    end

    click_button "Fazer depósito"

    expect(page).to have_content("Por favor, corrija os problemas abaixo:")
  end

end