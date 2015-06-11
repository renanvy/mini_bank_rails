class AccountNumberValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors[attribute] << "Conta não encontrada" if BankAccount.find_by(number: value).nil?
  end
end