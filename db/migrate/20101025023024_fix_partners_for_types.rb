class FixPartnersForTypes < ActiveRecord::Migration
  def self.up
    remove_column :partners, :partner_type
    add_column :partners, :partner_type_id, :integer
  end

  def self.down
    add_column :partners, :partner_type, :integer
    remove_column :partners, :partner_type_id
  end
end
