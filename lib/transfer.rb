class Transfer
  attr_reader :sender, :receiver, :amount
  attr_accessor :status

  #

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if valid? && @status == "pending"
        sender.balance -= amount
        receiver.balance += amount
        # binding.pry
        @status = "complete" #self.status???
      end
    if !@sender.valid?
      # binding.pry
      @status = "rejected"
      p "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if valid? && @status == "complete"
      sender.balance += amount
      receiver.balance -= amount
      @status = "reversed"
    end
  end

end
