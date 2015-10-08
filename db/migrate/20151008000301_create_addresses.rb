class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.inet :ip
      t.cidr :netmask
      t.references :server, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
