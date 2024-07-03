class CreateClimbs < ActiveRecord::Migration[7.1]
  def change
    create_table :climbs do |t|
      t.string :name
      t.integer :grade_id
      t.string :location
      t.string :climb_type
      t.integer :attempts
      t.text :comments

      t.timestamps
    end
  end
end
