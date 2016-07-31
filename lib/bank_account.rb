class BankAccount
  attr_reader :name
  attr_accessor :balance, :status

  def initialize(name)
    @name = name
    @account = 0001
    @balance = 1000
    @status = "open"
  end

  def deposit(amount)
    #question: why doesn't self.blance += amount pass when balance is only reader?
    @balance += amount
  end

  def display_balance
    "Your balance is $#{self.balance}."
  end

  def valid?
    self.status == "open" && self.balance > 0
  end

  def close_account
    self.status = "closed"
  end
end
