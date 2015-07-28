class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.integer :reply_to
      t.string :content

      t.timestamps
    end
  end
end
