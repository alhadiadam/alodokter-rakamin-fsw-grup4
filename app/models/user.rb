class User < ApplicationRecord
  has_secure_password
  validates :fullname, presence: true, on: :create
  validates :email, presence: true, on: :create
  validates :password, length: { minimum: 6 }, presence: true, on: :create
  validates :address, presence: true, on: :create
  validates :IdCardNumber, presence: true, on: :create
  validates :BirthDate, presence: true, on: :create
  validates :gender, presence: true, on: :create

  def generate_password_token!
    self.password_reset_token = generate_token
    self.password_reset_sent_at = Time.now.utc
    save!
   end
   
   def password_token_valid?
    (self.password_reset_sent_at + 2.hours) > Time.now.utc
   end
   
   def password_reset!(password)
    self.password_reset_token = nil
    self.password = password
    save!
   end
   
   private
   
   def generate_token
    SecureRandom.hex(10)
   end
   

  
  
end
