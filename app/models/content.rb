class Content < ApplicationRecord
belongs_to :user
has_one_attached :clip
validates :name, presence: true

end
