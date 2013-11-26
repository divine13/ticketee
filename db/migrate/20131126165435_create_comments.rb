class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :text
      t.references :ticket
      t.references :user

      t.timestamps
    end
  end
end
