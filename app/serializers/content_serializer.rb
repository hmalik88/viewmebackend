class ContentSerializer < ActiveModel::Serializer
attributes :id, :user_id, :channel, :name, :url
belongs_to :user

end
