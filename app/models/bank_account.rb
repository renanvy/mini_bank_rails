class BankAccount < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true

  before_create :generate_account_number

  private

  def generate_account_number
    new_number = (BankAccount.count + 1).to_s
    self.number = new_number.rjust(5, "0").to_s
  end
end
