require "rails_helper"

feature "New transfers" do

  let(:bank_account)     { create(:bank_account) }
  let(:bank_account_two) { create(:bank_account_two) }
  
  before(:each) do
    login_as(bank_account, scope: :bank_account)
    visit "/dashboard"
    click_link "Efetuar transferência"
  end

  scenario "New transfer with valid fields" do
    within "#new_transfer" do
      fill_in "transfer[value]",          with: "10.0"
      fill_in "transfer[account_number]", with: bank_account_two.number
    end

    click_button "Fazer transferência"

    expect(page).to have_content("Transferência feita com sucesso.")
  end

end