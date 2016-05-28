class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :meetup_id
      t.string :presentation_embeds, array: true, default: []
      t.string :links, array: true, default: []

      t.timestamps null: false
    end
    add_index :events, :meetup_id
  end
end
