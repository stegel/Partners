class CreatePartnerPages < ActiveRecord::Migration
  def self.up
    create_table :partners do |t|
	t.string :name
	t.string :address
	t.string :city
	t.string :state, :default => "CT"
	t.string :zip
	t.string :cell
	t.string :business
	t.string :fax
	t.string :first_name
	t.string :last_name
	t.string :website
	t.text :description
	t.integer :partner_type
	t.string :flickr_id
	t.integer :page_id
	t.timestamps
    end
  end

  def self.down
    drop_table :partner_pages
  end
end
