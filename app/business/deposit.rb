class Deposit
  
  include ActiveModel::Model

  attr_accessor :account_number, :value, :current_bank_account_id

  validates :account_number, :value, presence: true
  validates :account_number,         numericality: { only_integer: true }
  validates :value,                  numericality: { greater_than: 0.0 }
  validate  :verify_account_number

  def self.process(deposit_params)
    new(deposit_params).tap(&:process)
  end

  def process
    return unless valid?

    account_credited.update(balance: account_credited.balance + value.to_d)

    save_movimentation
  end

  private

  def account_credited
    BankAccount.find_by(number: account_number)
  end

  def current_bank_account
    BankAccount.find(current_bank_account_id)
  end

  def movimentation
    @movimentation ||= Movimentation.new(
                                          operation: "Depósito", 
                                          bank_account_id: current_bank_account.id, 
                                          account_destiny_id: account_credited.id,
                                          value: value
                                        )
  end

  def save_movimentation
    movimentation.save!
  end

  def verify_account_number
    errors.add(:account_number, "Conta não encontrada") if BankAccount.find_by(number: account_number).nil?
  end

end