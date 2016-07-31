class Transfer
  attr_reader :receiver, :sender, :amount, :pending
  attr_accessor :status

  def initialize(sender, receiver, amount)
    @receiver = receiver
    @sender = sender
    @amount = amount
    @status = "pending"
  end

  def valid?
    self.sender.valid? && self.receiver.valid?
  end

  def execute_transaction
    if self.status == "pending" && self.sender.balance < amount
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    elsif self.status == "complete"
      "Transaction completed"
    else
      self.sender.balance -= amount
      self.receiver.balance += amount
      self.status = "complete"
    end
  end

  def reverse_transfer
    if self.status == "complete"
      self.status = "reversed"
      self.sender.balance += amount
      self.receiver.balance -= amount
    end
  end
end
