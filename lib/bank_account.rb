class BankAccount
  attr_accessor :balance, :status
  attr_reader :name 
  
  def initalize(name)
    @name = name 
    @balance = 1000
    @status = "open"
    
end

def deposit(amount)
  @balance += amount 
end 

def display_balance 
  "Your Balnce is $#{@balance}."
end 

def vaild?
  if @status == "open" && @balance > 0 
    true 
  else
    false 
    
  end 
  
end 

def close_account
  @status = "cloud"
  
end 

end 
