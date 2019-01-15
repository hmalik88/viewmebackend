class Content < ApplicationRecord
has_many :purchases
has_many :users, through: :purchases
has_one_attached :clip

end
