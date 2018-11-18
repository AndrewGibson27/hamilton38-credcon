class AddTrendingToResources < ActiveRecord::Migration[5.2]
  def change
    add_column :resources, :trending, :boolean, not_null: true
  end
end
