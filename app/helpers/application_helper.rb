module ApplicationHelper
  def current_page(path)
    "active" if current_page?(path)
  end

  def status(movimentation)
    if movimentation.bank_account == current_bank_account && (movimentation.operation == "Transferência" || movimentation.operation == "Saque")
      "danger"
    elsif movimentation.bank_account != current_bank_account && movimentation.operation == "Transferência"
      "success"
    elsif movimentation.bank_account == current_bank_account && movimentation.operation == "Depósito"
      "info"
    elsif movimentation.bank_account != current_bank_account && movimentation.operation == "Depósito"
      "success"
    end
  end
end
