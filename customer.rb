class Customer  
 
  attr_reader :first_name,:last_name,:email

  def initialize(first_name,last_name,email,phone_numb,card_numb)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @phone_numb = phone_numb
    @card_numb = card_numb
  end

  def to_s
    "#{self.first_name} #{self.last_name} #{self.email}"
  end
    
end