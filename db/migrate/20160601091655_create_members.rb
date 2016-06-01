class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.integer :meetup_id
      t.jsonb :raw_data, default: {}

      t.timestamps null: false
    end
    add_index :members, :meetup_id
  end
end
