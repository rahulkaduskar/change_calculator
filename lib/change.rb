# This class is to calcute change of given number
class Change
  COIN_AMOUNT_STRING = {quarters: 25, dimes: 10,  nickels: 5, pennies: 1 }

  # This method is used to validate input
  def self.change(amount)
    begin
      raise ArgumentError.new("Invalid Amount. Amount should be positive number") if !amount.is_a?(Numeric) || amount < 0
      return self.calculate_change(amount)
    rescue Exception => e
      return  e.message
    end
  end

  # This method is used to calculate change recursively
  def self.calculate_change(amount)
    return {} if amount < 1

    change_coins = {}
    coin = COIN_AMOUNT_STRING.values.reject{|x| x > amount }.max
    if coin > 0 && amount >= coin
      key = COIN_AMOUNT_STRING.key(coin)
      change_coins[key] = (amount/coin)
      remaining_amount = amount - (coin * change_coins[key])
      change_coins.merge!(self.calculate_change(remaining_amount  ))
    end
    change_coins
  end

end