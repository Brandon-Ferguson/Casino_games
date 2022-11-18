class Player

  attr_accessor :name, :age, :money
  
  def initialize(name, age, money)
    @name = name
    @age = age
    @money = money
  end
  
  def change_money(num)
    @money += num
  end
  
  def change_age(num)
    @age += num
  end

end