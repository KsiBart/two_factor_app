class User < ActiveRecord::Base

  
  has_many :employees
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :two_factor_authenticatable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :phone_number,  presence: true, length: { is: 9 }
  validates :phone_number, numericality: { only_integer: true }

  has_one_time_password

  def send_two_factor_authentication_code
    if active_sms? && phone_number 
      @client = Twilio::REST::Client.new(ENV['account_sid'], ENV['auth_token'])
      @client.messages.create(
        from: '+48799449356',
        to: self.phone_number,
        body: self.otp_code
      )
    end
  end

  def disable_sms
    self.active_sms = false
    save
  end

  def enable_sms
    self.active_sms = true
    save
  end

end
