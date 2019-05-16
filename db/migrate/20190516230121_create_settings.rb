class CreateSettings < ActiveRecord::Migration[5.2]
  def change
    create_table :settings do |t|
      t.integer :large_image
      t.integer :medium_image
      t.integer :small_image

      t.timestamps
    end
  end
end
