require 'pry'
class BankAccount
  attr_accessor :bank_account, :balance, :status
  attr_reader :name, :deposit

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end
# binding.pry
  def deposit(money)
    balance = @balance += 1
    money = @deposit
    balance << money
  end
end
