class AddPasswordToDevelopers < ActiveRecord::Migration[5.2]
  def change
    add_column :developers, :password_digest, :string
  end
end
