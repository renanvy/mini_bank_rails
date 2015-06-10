class AddColumnNumberToBankAccounts < ActiveRecord::Migration
  def change
    add_column :bank_accounts, :number, :string
  end
end
