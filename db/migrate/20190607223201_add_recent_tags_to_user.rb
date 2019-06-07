class AddRecentTagsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :recent_tags, :string, array: true, default: []
  end
end
