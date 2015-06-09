class Withdrawal
  include ActiveModel::Model

  attr_accessor :value, :current_bank_account_id

  validates :value, presence: true

  def self.process(withdrawal_params)
    new(withdrawal_params).tap(&:process)
  end

  def process
    return unless valid?

    current_bank_account = BankAccount.find(current_bank_account_id)

    current_bank_account.balance -= value.to_d
    current_bank_account.save!

    # save_transaction
  end

  private

  def transaction
    # @transaction ||= Transaction.new(...........)
  end

  def save_transaction
    # transaction.save!
  end

end