class User < ApplicationRecord
has_secure_password
has_many :contents
has_many :favorites
validates :e_mail, uniqueness: {case_sensitive: false}


end
