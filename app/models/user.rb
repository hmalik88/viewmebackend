class User < ApplicationRecord
has_secure_password
has_many :purchases
has_many :contents, through: :purchases
has_many :contents
validates :e_mail, uniqueness: {case_sensitive: false}


end
