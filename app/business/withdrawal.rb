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

    current_bank_account.update(balance: current_bank_account.balance - value.to_f)

    save_movimentation
  end

  private

  def current_bank_account
    BankAccount.find(current_bank_account_id)
  end

  def movimentation
    @movimentation ||= Movimentation.new(
                                          operation: "Saque", 
                                          bank_account_id: current_bank_account.id, 
                                          account_destiny_id: "",
                                          value: value.to_f
                                        )
  end

  def save_movimentation
    movimentation.save!
  end

  def bank_account_balance
    errors.add(:value, "Saldo insuficiente") if value.to_f > current_bank_account.balance
  end

end