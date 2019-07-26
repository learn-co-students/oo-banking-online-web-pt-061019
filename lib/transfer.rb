class Transfer
  attr_reader :sender, :receiver 
  attr_accessor :status, :amount
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end
  
  def valid?
    receiver.valid? && sender.valid? && self.status == "pending" && sender.balance >= amount
  end
  
  def execute_transaction
      if valid?
      sender.balance -= amount
      receiver.deposit(amount)
      self.status = "complete"
    else self.status = "rejected"
      "Transaction rejected. Please check your account balance."
  end
end

  def reverse_transfer
    if self.status == "complete"
      sender.deposit(amount)
      receiver.balance -= amount
      self.status = "reversed"
    end
  end
end