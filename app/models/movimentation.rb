class Movimentation < ActiveRecord::Base
  belongs_to :bank_account

  scope :by_bank_account, -> (account) {
    where("bank_account_id = :account OR account_destiny_id = :account", account: account.id)
  }
end
