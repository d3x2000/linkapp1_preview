class AddVoteUpToArticles < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :vote_up, :integer, default: 0
  end
end
