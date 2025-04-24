class ReacreateUsersWithUuid < ActiveRecord::Migration[7.1]
  def change
    enable_extension 'uuid-ossp' unless extension_enabled?('uuid-ossp')

    drop_table :users

    create_table :users, id: :uuid do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.datetime :last_active_at

      t.timestamps
    end
  end
end