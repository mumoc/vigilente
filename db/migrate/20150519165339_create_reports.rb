class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.text :comment
      t.float :lat
      t.float :lng
      t.string :report_type
      t.string :provider
      t.string :uid
      t.string :user

      t.timestamps null: false
    end
  end
end
