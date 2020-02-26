
class Customer  
 
  attr_reader :first_name,:last_name,:email,:card_numb,:phone_numb

  def initialize(first_name,last_name,email='',phone_numb='',card_numb='')
    @first_name = first_name
    @last_name = last_name
    @email = email
    @phone_numb = phone_numb
    @card_numb = card_numb
  end

  def to_s
    "#{self.first_name} #{self.last_name} #{self.email}"
  end

  def change_info(new_info)
    self.first_name = new_info[:first_name] if new_info[:first_name] != nil
    self.last_name = new_info[:last_name] if new_info[:last_name] != nil
    self.email= new_info[:email] if new_info[:email] != nil
    self.phone_numb = new_info[:phone_numb] if new_info[:phone_numb] != nil
  end
    
end