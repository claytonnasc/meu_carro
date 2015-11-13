class AddAttachmentCoverToCarros < ActiveRecord::Migration
  def self.up
    change_table :carros do |t|
      t.attachment :cover
    end
  end

  def self.down
    remove_attachment :carros, :cover
  end
end
