class ChangeColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :name, :first_name
    rename_column :users, :password, :password_digest
  end
end
