class AddVoteDownToArticles < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :vote_down, :integer, default: 0
  end
end
