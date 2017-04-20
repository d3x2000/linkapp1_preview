class RemoveVoteDownFromArticless < ActiveRecord::Migration[5.0]
  def change
    remove_column :articles, :vote_down, :boolean
  end
end
