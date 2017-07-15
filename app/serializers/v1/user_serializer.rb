module V1
  class UserSerializer < ActiveModel::Serializer
    attributes :id, :name, :email

    has_one :address do
      link(:related) { v2_user_address_url(object.id) }
    end
  end
end
