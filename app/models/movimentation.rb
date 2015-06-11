class Movimentation < ActiveRecord::Base
  belongs_to :bank_account

  scope :by_period, ->(start_date, end_date, account) {
    where("date(created_at) BETWEEN ? AND ?", start_date, end_date).by_bank_account(account)
  }

  scope :by_bank_account, -> (account) {
    where("bank_account_id = :account OR account_destiny_id = :account", account: account.id)
  }
  
end
