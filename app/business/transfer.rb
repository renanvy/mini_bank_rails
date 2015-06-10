class Transfer
  
  include ActiveModel::Model

  attr_accessor :account_number, :value, :account_debited_id

  validates :account_number, :value, presence: true
  validates :account_number, numericality: { only_integer: true }
  validates :value, numericality: { greater_than: 0.0 }
  validate  :verify_account_number
  validate  :bank_account_balance

  def self.process(transfer_params)
    new(transfer_params).tap(&:process)
  end

  def process
    return unless valid?

    account_credited.update(balance: account_credited.balance + value.to_d)
    account_debited.update(balance: account_debited.balance - value.to_d)

    # save_transaction
  end

  private

  def account_credited
    BankAccount.find_by(number: account_number)
  end

  def account_debited
    BankAccount.find(account_debited_id)
  end

  def transaction
    # @transaction ||= Transaction.new(...........)
  end

  def save_transaction
    # transaction.save!
  end

  def verify_account_number
    if BankAccount.find_by(number: account_number).nil?
      errors.add(:account_number, "Conta não encontrada")
    elsif account_number.to_i == account_debited.number
      errors.add(:account_number, "Você não pode efetuar transferências para sua conta")
    end
  end

  def bank_account_balance
    errors.add(:value, "Saldo insuficiente") if value.to_d > account_debited.balance
  end

end