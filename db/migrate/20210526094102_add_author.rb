class AddAuthor < ActiveRecord::Migration[6.1]
  add_reference :posts, :author, foreign_key: {to_table: :users}
  def change
  end
end
