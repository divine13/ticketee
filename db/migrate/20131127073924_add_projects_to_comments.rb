class AddProjectsToComments < ActiveRecord::Migration
  def change
    add_reference :comments, :project, index: true
  end
end
