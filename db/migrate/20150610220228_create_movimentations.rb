class CreateMovimentations < ActiveRecord::Migration
  def change
    create_table :movimentations do |t|
      t.string :operation
      t.references :bank_account, index: true, foreign_key: true
      t.integer :account_destiny_id
      t.float :value

      t.timestamps null: false
    end
  end
end
