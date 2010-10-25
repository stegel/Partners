class CreatePartnerTypes < ActiveRecord::Migration
  def self.up
    create_table :partner_types do |t|
      t.string :name
      t.timestamps
    end
    
    PartnerType.create(:name => "Contractor")
    PartnerType.create(:name => "Designer")
    PartnerType.create(:name => "Partner")
  end

  def self.down
    drop_table :partner_types
  end
end
