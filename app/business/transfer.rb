class Transfer
  include ActiveModel::Model

  TAXES = {
    business_hour: 5,
    off_business_hour: 7,
    weekend: 7,
    big_quantity: 100
  }

  attr_accessor :account_number, :value, :account_debited_id

  validates :account_number, :value, presence: true
  validates :account_number,         numericality: { only_integer: true }
  validates :value,                  numericality: { greater_than: 0.0 }
  validates :account_number,         account_number: true
  validate  :verify_account_destiny

  def self.process(transfer_params)
    new(transfer_params).tap(&:process)
  end

  def process
    return unless valid?

    account_credited.update(balance: account_credited.balance + value.to_d)
    account_debited.update(balance: account_debited.balance - value.to_d)

    save_movimentation
    apply_taxes(account_debited)
  end

  private

  def apply_taxes(account_debited)
    tax = if Date.current.sunday? || Date.current.saturday?
      TAXES[:weekend]
    else
      if Time.current.beginning_of_hour.hour >= 9 and Time.current.end_of_hour.hour <= 18
        TAXES[:business_hour]
      else
        TAXES[:off_business_hour]
      end
    end

    final_tax = (value.to_d >= 1000) ? (tax + 10) : tax

    account_debited.update(balance: account_debited.balance - final_tax)
  end

  def account_credited
    BankAccount.find_by(number: account_number)
  end

  def account_debited
    BankAccount.find(account_debited_id)
  end

  def movimentation
    @movimentation ||= Movimentation.new(
                                          operation: "Transferência", 
                                          bank_account_id: account_debited.id, 
                                          account_destiny_id: account_credited.id,
                                          value: value
                                        )
  end

  def save_movimentation
    movimentation.save!
  end

  def verify_account_destiny
    if account_number == account_debited.number
      errors.add(:account_number, "Você não pode efetuar transferências para sua conta")
    end
  end

  def bank_account_balance
    errors.add(:value, "Saldo insuficiente") if value.to_d > account_debited.balance
  end

end