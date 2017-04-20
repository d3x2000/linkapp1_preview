class RemoveVoteUpFromArticless < ActiveRecord::Migration[5.0]
  def change
    remove_column :articles, :vote_up, :boolean
  end
end
