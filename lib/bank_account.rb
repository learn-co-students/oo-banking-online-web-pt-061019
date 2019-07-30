class BankAccount

  attr_reader :name
  attr_accessor :balance, :status

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def deposit(amount)
    @balance += amount.to_i
  end

  def display_balance
    return "Your balance is $#{@balance.to_i}."
  end

  def valid?
    if @balance.to_i <=0 || @status == "closed"
      return false
    else
      return true
    end
  #  if @balance.to_i <= 0
      #return false
    #elsif
    #  @status == "closed"
    #  return false
    #else
    #  return true
    #end
  end

  def close_account
    @status = "closed"
  end

end
