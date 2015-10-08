class CreateServers < ActiveRecord::Migration
  def change
    create_table :servers do |t|
      t.text :hostname
      t.text :serial
      t.text :os
      t.text :server_type
      t.text :asset_tag
      t.references :account, index: true, foreign_key: true
      t.references :room, index: true, foreign_key: true
      t.references :site, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
