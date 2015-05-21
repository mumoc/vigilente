class AddBoxNumberToReports < ActiveRecord::Migration
  def change
    add_column :reports, :box_number, :string
  end
end
