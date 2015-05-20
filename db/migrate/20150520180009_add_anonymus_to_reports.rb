class AddAnonymusToReports < ActiveRecord::Migration
  def change
    add_column :reports, :anonymus, :boolean
  end
end
