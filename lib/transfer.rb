class Transfer

  attr_reader :status
  attr_accessor :sender, :receiver, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    @sender.valid?
    @receiver.valid?
  end
#sender = amanda -> 950
#receiver = avi -> 1050
  def execute_transaction
    if  @sender.valid? && @status == "pending" && @sender.balance >= @amount
        @sender.balance -= @amount
        @receiver.deposit(@amount)
        @status = "complete"
    else
        @status = "rejected"
        return "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      @receiver.balance -= @amount
      @sender.deposit(@amount)
      @status = "reversed"
    end
  end

end
