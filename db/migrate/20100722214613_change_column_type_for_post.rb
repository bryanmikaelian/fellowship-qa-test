class ChangeColumnTypeForPost < ActiveRecord::Migration
  def self.up
    change_column :blogs, :post, :text, :limit => 1000
  end

  def self.down
  end
end
