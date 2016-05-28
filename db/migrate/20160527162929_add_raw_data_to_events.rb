class AddRawDataToEvents < ActiveRecord::Migration
  def change
    add_column :events, :raw_data, :jsonb, default: {}
  end
end
