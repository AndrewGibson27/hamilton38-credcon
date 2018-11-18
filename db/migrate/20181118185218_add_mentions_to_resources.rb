class AddMentionsToResources < ActiveRecord::Migration[5.2]
  def change
    add_column :resources, :mentions, :integer
  end
end
