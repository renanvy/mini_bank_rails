class Withdrawal
  include ActiveModel::Model

  attr_accessor :value, :current_bank_account_id

  validates :value, presence: true, numericality: { greater_than: 0.0 }
  validate  :bank_account_balance

  def self.process(withdrawal_params)
    new(withdrawal_params).tap(&:process)
  end

  def process
    return unless valid?

    current_bank_account.balance -= value.to_d
    current_bank_account.save!

    # save_transaction
  end

  private

  def current_bank_account
    BankAccount.find(current_bank_account_id)
  end

  def transaction
    # @transaction ||= Transaction.new(...........)
  end

  def save_transaction
    # transaction.save!
  end

  def bank_account_balance
    errors.add(:value, "Saldo insuficiente") if value.to_d > current_bank_account.balance
  end

end