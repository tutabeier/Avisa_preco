class RemoveUrlFromLoja < ActiveRecord::Migration
  def up
    remove_column :lojas, :url
  end

  def down
    add_column :lojas, :url, :string
  end
end
