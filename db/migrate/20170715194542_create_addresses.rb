class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.string :address
      t.string :city
      t.references :user, foreign_key: true
      t.string :zipcode
      t.string :neighborhood
      t.string :state
      t.string :complement

      t.timestamps
    end
  end
end
