class CreateMessages < ActiveRecord::Migration[7.1]
  def change
    create_table :messages do |t|
      t.text :content
      t.uuid :sender_id
      t.uuid :receiver_id

      t.timestamps
    end
  end
end
