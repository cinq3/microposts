class AddDetailsToUser < ActiveRecord::Migration
  def change
    add_column :users, :birthyear, :integer
    add_column :users, :birthmonth, :integer
    add_column :users, :birthday, :integer
    add_column :users, :description, :string
    add_column :users, :location, :string
  end
end
