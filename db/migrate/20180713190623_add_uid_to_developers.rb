class AddUidToDevelopers < ActiveRecord::Migration[5.2]
  def change
    add_column :developers, :uid, :integer
  end
end
