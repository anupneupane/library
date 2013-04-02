class AddTokenAndSecretToTwitterAuth < ActiveRecord::Migration
  def change
    add_column :twitter_auths, :token, :string
    add_column :twitter_auths, :secret, :string
  end
end
