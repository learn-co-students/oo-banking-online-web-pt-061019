class Transfer

  attr_accessor :status, :amount
  attr_reader :sender, :receiver

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end


  def valid?
    if self.sender && self.receiver && self.amount && sender.valid? && receiver.valid? && @amount <= @sender.balance
      true
    else
      false
    end
  end

   def reverse_transfer
     if @status == "complete"
     self.receiver.balance -= @amount
     self.sender.balance += @amount
     @status = "reversed"
   end

 end

  def execute_transaction
    if !valid?
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    elsif @status == "complete"
      return "Transaction was already executed"
    else
       valid? && @status == "pending" && amount < self.sender.balance
               self.sender.balance -= amount
               self.receiver.balance += amount
               self.status = "complete"

    end
  end
  end
