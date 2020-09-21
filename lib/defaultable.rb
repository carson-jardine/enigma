module Defaultable
  
  def default_key
    sprintf('%05d', rand(10 ** 5))
  end

  def default_date
    Date.today.strftime("%d%m%y")
  end
end
