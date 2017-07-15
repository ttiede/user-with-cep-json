class AddressSerializer < ActiveModel::Serializer
  attributes :id, :street, :city, :zip

  belongs_to :user do
    link(:related) { user_address_url(object.contact.id) }
  end
end
