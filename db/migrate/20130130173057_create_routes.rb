class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.references :activity_object
      t.references :location
      t.references :guide
      t.string :title

      t.timestamps
    end
    add_index :routes, :activity_object_id
    add_index :routes, :location_id
    add_index :routes, :guide_id
  end
end
