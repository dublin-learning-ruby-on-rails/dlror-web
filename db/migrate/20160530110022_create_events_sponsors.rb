class CreateEventsSponsors < ActiveRecord::Migration
  def change
    create_table :events_sponsors do |t|
      t.belongs_to :event, index: true, foreign_key: true
      t.belongs_to :sponsor, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
