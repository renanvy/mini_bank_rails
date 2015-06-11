class AddColumnBalanceToBankAccounts < ActiveRecord::Migration
  def change
    add_column :bank_accounts, :balance, :float, default: 0.0
  end
end
