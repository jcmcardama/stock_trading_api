class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable

  alias_method :authenticate, :valid_password?

  validates :email, presence: true
  validates :password, presence: true, confirmation: true
  # only allow letter, number, underscore and punctuation.
  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true

  attr_writer :login

  def self.from_token_payload(payload)
    self.find payload["sub"]
  end

  def login
    @login || self.username || self.email
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if (login = conditions.delete(:login))
      where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email)
      where(conditions.to_h).first
    end
  end
end
