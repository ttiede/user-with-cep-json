require 'correios-cep'
class Address < ApplicationRecord
  before_save :populating_address_by_zipcode
  validate :validade_zipcode

  belongs_to :user

  protected

  def populating_address_by_zipcode
    errors.add(:zipcode, 'Invalid Zipcode') if address_by_cep.empty?
    unless address_by_cep.empty?
      self.address = address_by_cep[:address]
      self.neighborhood =	address_by_cep[:neighborhood]
      self.zipcode = address_by_cep[:zipcode]
      self.city =	address_by_cep[:city]
      self.state = address_by_cep[:state]
    end
  end

  private

  def validade_zipcode
    errors.add(:zipcode, 'Zipcode is empty.') if zipcode.to_s.empty?
    errors.add(:zipcode, "Zipcode isn't valid.") if address_by_cep.nil? || address_by_cep.empty?
  end

  def address_by_cep
    address_by_cep = nil
    address_by_cep = Correios::CEP::AddressFinder.get(zipcode.to_s) unless zipcode.nil?
    address_by_cep
  end
end
