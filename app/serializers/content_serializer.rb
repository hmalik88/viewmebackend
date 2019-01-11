class ContentSerializer < ActiveModel::Serializer
attributes :id, :user_id, :channel
has_many :users
has_many :purchases

end
