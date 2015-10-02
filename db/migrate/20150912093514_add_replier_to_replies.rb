class AddReplierToReplies < ActiveRecord::Migration
  def change
    add_column :replies, :replier, :integer
  end
end
