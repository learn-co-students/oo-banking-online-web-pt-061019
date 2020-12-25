class Transfer
 require 'pry'
  attr_reader
  attr_accessor :status, :sender, :receiver, :amount, :transfer

  def initialize(sender, receiver, amount)
    @transfer = transfer
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
     @sender.valid? && @receiver.valid? ? true : false
   end



  def execute_transaction
    if self.valid? && self.status != "complete" && sender.balance >= self.amount
      @sender.balance -= @amount
      @receiver.balance += @amount
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
 end

 def reverse_transfer
    if self.valid? && self.status == "complete" && @sender.balance > @amount
      @sender.balance += @amount
      @receiver.balance -= @amount
     self.status = "reversed"
    end
  end
end
