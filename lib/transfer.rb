class Transfer
  attr_accessor :sender, :receiver, :amount, :status, :count
  
  def initialize(sender, reciever, amount)
    @sender = sender 
    @reciever = reciever
    @amount = amount
    @status = "pending"
  end
  
  def both_valid?
    @sender.valid? && @reciever.valid? ? true : false
    end
  end
  
  def execute_transaction
    if @sender.balance < @amount
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
      
    elsif @status == "complete"
      puts "Transaction was already executed."
    else
      @sender.deposit( @amount * -1 )
      @reciever.deposit( @amount )
      @status = "complete"
    end
  end
  
  def reverse_transfer
    if @status = "complete"
      @sender.balance += @amount
      @reciever.balance -= @amount
      @status = "reversed"
    end
  end
  
end
