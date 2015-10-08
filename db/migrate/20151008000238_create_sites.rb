class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.text :name
      t.text :address
      t.text :city
      t.text :country
      t.text :lon
      t.text :lat
      t.references :account, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
