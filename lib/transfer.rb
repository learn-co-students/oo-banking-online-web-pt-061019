class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    if sender.valid? && receiver.valid?
        true
    end
  end

  def execute_transaction
    # @sender.balance -= @amount
    # @receiver.balance += @amount
    # if @sender.balance < @amount
    #    @status = "rejected"
    #    return "Transaction rejected. Please check your account balance."
    if @sender.balance > amount && valid? && @status == "pending"
        @status = "complete"
        @sender.balance -= @amount
        @receiver.balance += @amount
    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end

    def reverse_transfer
      if @status == "complete"
        @sender.balance += @amount
        @receiver.balance -= @amount
        @status = "reversed"
      end
    end
end
