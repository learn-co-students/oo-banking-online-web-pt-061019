class Transfer

  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    # your code her
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    self.sender.valid?
    self.receiver.valid?
  end

  def execute_transaction

    if self.sender.balance > @amount

      if self.status != "complete"

        self.sender.balance = self.sender.balance - self.amount
        self.receiver.balance = self.receiver.balance + self.amount
        self.status = "complete"
      end

    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

end
