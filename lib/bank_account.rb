class BankAccount
  attr_accessor :balance, :status
  attr_reader :name
  # :name changed from attr_accessor
  # but not sure if it will raise_error when name change


  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def deposit(amount)
    @balance += amount
  end

  def display_balance
    "Your balance is $#{@balance}."
  end

  def valid?
    @status == "open" && @balance > 0
  end

  def close_account
    @status = "closed"
  end

end
