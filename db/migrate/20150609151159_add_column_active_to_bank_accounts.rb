class AddColumnActiveToBankAccounts < ActiveRecord::Migration
  def change
    add_column :bank_accounts, :active, :boolean, default: true
  end
end
