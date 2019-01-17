class UserSerializer < ActiveModel::Serializer
attributes :id, :first_name, :last_name, :e_mail, :address_line_1, :address_line_2, :unit, :city, :state, :zip_code
has_many :contents
has_many :purchases

end
