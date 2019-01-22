class ContentSerializer < ActiveModel::Serializer
attributes :id, :user_id, :channel, :name, :url
has_many :users
has_many :purchases
belongs_to :user

end
