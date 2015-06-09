class Deposit
  
  include ActiveModel::Model

  attr_accessor :account_number, :value

  validates :account_number, :value, presence: true
  validates :account_number,         numericality: { only_integer: true }
  validates :value,                  numericality: { greater_than: 0.0 }
  validate  :verify_account_number

  def self.process(deposit_params)
    new(deposit_params).tap(&:process)
  end

  def process
    return unless valid?

    account_credited = BankAccount.find_by(number: account_number)
    account_credited.update(balance: account_credited.balance + value.to_d)

    # save_transaction
  end

  private

  def transaction
    # @transaction ||= Transaction.new(...........)
  end

  def save_transaction
    # transaction.save!
  end

  def verify_account_number
    errors.add(:account_number, "Conta não encontrada") if BankAccount.find_by(number: account_number).nil?
  end

end