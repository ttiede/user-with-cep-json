class User < ApplicationRecord

  #Validations
  #validates_presence_of :address

  # Kaminari
  paginates_per 5

  # Associations
  has_one :address

  accepts_nested_attributes_for :address, update_only: true


  def as_json(options={})
    h = super(options)
    h
  end
end
