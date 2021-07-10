require "pry"

class Transfer
  # your code here

  attr_accessor :sender, :receiver, :amount, :status, :has_transfered

  @@all_transfers = []

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
    @has_transfered = false
    @@all_transfers << self
  end

  def all_transfers
    @@all_transfers
  end

  def valid?
    if @sender.valid? == true && @receiver.valid? == true
      true
    else
      false
    end
    # expect(avi.valid?).to eq (true)
  end

  def execute_transaction

    if self.has_transfered == true || @sender.balance < @amount
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    else
      @receiver.balance += @amount
      @sender.balance -= @amount
      self.status = "complete"
      self.has_transfered = true
    end
    
    # if self.has_transfered == true || @sender.balance < @amount
    #   # binding.pry
    #   self.status = "rejected"
    #   puts "Transaction rejected. Please check your account balance."
    # else
    #     @receiver.balance += @amount
    #     @sender.balance -= @amount
    #     self.status = "complete"
    #     self.has_transfered = true
    # end

    # if self.has_transfered == false
    #   if @sender.valid? == true
    #     @receiver.balance += @amount
    #     @sender.balance -= @amount
    #     self.status = "complete"
    #     self.has_transfered = true
    #   elsif @sender.valid? == false
    #     self.status = "rejected"
    #     puts "Transaction rejected. Please check your account balance."
    #   else
    #   end
    # else self.has_transfered == true
    #   self.status = "rejected"
    #   puts "Transaction rejected. Please check your account balance."
    # end

    # x = @receiver.name
    # y = @sender.name
    # z = @amount
    # ledger = []
    #
    # while ledger.include?("#{y} >> #{z} >> #{x}") == false do
    #   # binding.pry
    #   @receiver.balance += @amount
    #   @sender.balance -= @amount
    #   self.status = "complete"
    #   # binding.pry
    #   ledger << "#{y} >> #{z} >> #{x}"
    # # else ledger.include?("#{y} >> #{z} >> #{x}") == true
    #   @receiver.balance
    # end


    # while @sender.valid? == true
    #   @receiver.balance += @amount
    #   @sender.balance -= @amount
    #   self.status = "complete"
    # else
    #   "Transaction rejected. Please check your account balance."
    #   self.status = "rejected"
    # end

    # if @sender.valid? == false
    #   "Transaction rejected. Please check your account balance."
    #   self.status = "rejected"
    # else
    #   @receiver.balance += @amount
    #   @sender.balance -= @amount
    #   self.status = "complete"
    # end

    # ledger = {}
    # ledger[:@receiver] = []
    # ledger[:@receiver] << "sender"
    #
    # receiver:

    # binding.pry
  end

  def reverse_transfer
    if self.status == "complete"
      @receiver.balance -= @amount
      @sender.balance += @amount
      self.status = "reversed"
    end
  end

end
