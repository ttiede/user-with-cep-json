class User < ApplicationRecord
  # Validations
  validates_presence_of :address, :name, :email
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  # Kaminari
  paginates_per 5

  # Associations
  has_one :address, dependent: :destroy

  accepts_nested_attributes_for :address

  def as_json(options = {})
    h = super(options)
    h
  end
end
