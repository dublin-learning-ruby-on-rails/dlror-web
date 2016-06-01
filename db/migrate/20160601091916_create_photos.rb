class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer :meetup_id
      t.belongs_to :event, index: true, foreign_key: true
      t.jsonb :raw_data, default: {}

      t.timestamps null: false
    end
    add_index :photos, :meetup_id
  end
end
