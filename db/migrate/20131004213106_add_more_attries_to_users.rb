class AddMoreAttriesToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :unconfirmed, :boolean
  end
end
