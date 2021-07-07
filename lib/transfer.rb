class Transfer

    attr_accessor :sender, :receiver, :status, :amount

    def initialize(sender, receiver, amount)
        @sender = sender
        @receiver = receiver
        @status = "pending"
        @amount = amount
    end

    def valid?
        @sender.valid? && @receiver.valid?
    end

    def execute_transaction
        if @status != "pending"
            return
        end
        if @amount > @sender.balance
            @status = "rejected"
            return "Transaction rejected. Please check your account balance."
        end
        @sender.balance = @sender.balance - @amount
        @receiver.balance += @amount
        @status = "complete"
    end

    def reverse_transfer
        if @status != "complete"
            return
        end
        @receiver.balance -= @amount
        @sender.balance += @amount
        @status = "reversed"

    end
end
