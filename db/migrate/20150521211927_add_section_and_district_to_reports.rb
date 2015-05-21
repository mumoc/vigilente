class AddSectionAndDistrictToReports < ActiveRecord::Migration
  def change
    add_column :reports, :section, :integer
    add_column :reports, :district, :integer
    remove_column :reports, :box_number
  end
end
