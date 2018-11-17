class AddSubtypeToResource < ActiveRecord::Migration[5.2]
  def change
    add_column :resources, :subtype, :integer
  end
end
