class AddSiteToTour < ActiveRecord::Migration[5.0]
  def change
    add_column :tours, :site, :string
  end
end
