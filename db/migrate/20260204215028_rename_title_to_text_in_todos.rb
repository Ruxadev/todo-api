class RenameTitleToTextInTodos < ActiveRecord::Migration[8.0]
  def change
    rename_column :todos, :title, :text
  end
end