class Transfer
  
  attr_accessor :sender, :receiver, :amount, :status
  
  
  def initialize(sender, receiver, amount)
    @sender = sender 
    @receiver = receiver 
    @amount = amount 
    @status = "pending"
  end 
  
  def valid?
    if sender.valid? == true && receiver.valid? == true 
      true 
    else 
      false 
    end 
  end 
  
  def execute_transaction 
    if sender.valid? == true && sender.balance > @amount && @status == "pending" 
      sender.balance = sender.balance - @amount
    receiver.balance = receiver.balance + @amount 
    @status = "complete"
  else 
    @status = "rejected"
    return "Transaction rejected. Please check your account balance."
    end 
  end 
  
  def reverse_transfer 
    if @status == "complete"
      sender.balance = sender.balance + @amount 
      receiver.balance = receiver.balance - @amount 
      @status = "reversed"
    end 
  end 
end
