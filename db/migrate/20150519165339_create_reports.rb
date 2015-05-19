class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.text :comment
      t.float :latitude
      t.float :longitude
      t.string :report_type

      t.timestamps null: false
    end
  end
end
