class Employee < ActiveRecord::Base
  belongs_to :user

	# do sprawdzania poprawności maila
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	# walidacje
	validates :firstname,  presence: true, length: {minimum: 2,  maximum: 20 }
	validates :midname,  length: {maximum: 20 }
	validates :lastname,  presence: true, length: { minimum: 3, maximum: 40 }
	validates :pesel,  presence: true, length: { minimum: 6 }
	validates :address, presence: true, length: {maximum: 255}
	validates :city, presence: true, length: {maximum: 50}
	validates :state, presence: true, length: {maximum: 50}
	validates :postal, presence: true, length: {maximum: 20}
	validates :country, presence: true, length: {maximum: 50}
	validates :phone, presence: true, length: {maximum: 20},
	  					format: { with: /\+?\d+/ }
	validates :gender, presence: true
	validates :department, presence: true, length: {maximum: 50}
	validates :birthdate, presence: true
	validates :hiredate, presence: true
	validates :email, presence: true, length: { maximum: 255 },
                      format: { with: VALID_EMAIL_REGEX },
                      uniqueness: { case_sensitive: false }
    validates :hrsperweek,  presence: true, :numericality => { :greater_than_or_equal_to => 0 }
    validates :wage,  presence: true, :numericality => { :greater_than_or_equal_to => 0 }
    validates :nationality,  presence: true, length: {maximum: 50}
    validates :marital,  presence: true, length: {maximum: 50}

    validates_format_of :wage, :with => /\A\d+\.*\d{0,2}\z/

    validates_inclusion_of :gender, :in => %w( M F ) # płeć M lub F
end
