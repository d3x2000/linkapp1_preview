class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :article, foreign_key: true
      t.boolean :type

      t.timestamps
    end
  end
end
