class AddPublishAtToTweets < ActiveRecord::Migration[7.1]
  def change
    add_column :tweets, :publish_at, :datetime
  end
end
