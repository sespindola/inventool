class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.text :name
      t.site :references

      t.timestamps null: false
    end
  end
end
