class CreateTweets < ActiveRecord::Migration[6.0]
  def change
    create_table :tweets do |t|
      t.string :message
      t.references :pack, null: false, foreign_key: true

      t.timestamps
    end
  end
end
