require 'pry'
class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = 50
  end

  def valid?
    @receiver.valid?
    @sender.valid?
    #  binding.pry
  end

  def execute_transaction
    sender.balance -= amount
    receiver.balance += amount
    @status = "complete"
    # binding.pry
  end
end
