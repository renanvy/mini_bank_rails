require "rails_helper"

feature "Movimentations", type: :feature do

  let(:bank_account)     { create(:bank_account) }
  let(:bank_account_two) { create(:bank_account_two) }
  
  before(:each) do
    login_as(bank_account, scope: :bank_account)
    visit "/dashboard"

    create(
      :movimentation, 
      bank_account: bank_account,
      account_destiny_id: bank_account_two.id,
      value: 10.0,
      created_at: "2015-06-11 19:23:49",
      operation: "Transferência"
    )

    click_link "Extrato"
  end

  scenario "list all movimentations from bank account" do
 
    fill_in "extract[start_date]", with: "2015/06/11" 
    fill_in "extract[end_date]",   with: "2015/06/12" 

    click_button "Filtrar"

    expect(page).to have_content("Transferência")
    expect(page).to have_content("R$ 10,00")
  end

end