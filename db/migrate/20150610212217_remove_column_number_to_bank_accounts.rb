class RemoveColumnNumberToBankAccounts < ActiveRecord::Migration
  def change
    remove_column :bank_accounts, :number
  end
end
