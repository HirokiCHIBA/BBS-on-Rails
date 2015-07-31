class Post < ActiveRecord::Base
  validates :author, presence: true
  validates :content, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :mail, allow_blank: true, format: { with: VALID_EMAIL_REGEX }
  # has_secure_password

  # private

  # def validate_password?
  #   password.present? || password_confirmation.present?
  # end

  scope :load_newer_than, lambda { |id| 
    where("id > ?", id).order(created_at: :desc, id: :desc)
  }
  scope :load_page, lambda { |p|
    number = p.to_i - 1
    order(created_at: :desc, id: :desc).limit(10).offset(10 * number)
  }
end
