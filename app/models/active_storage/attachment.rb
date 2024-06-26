# app/models/active_storage/attachment.rb
class ActiveStorage::Attachment < ApplicationRecord
  # Include this line if it's not already present to ensure the model is correctly inherited
  self.table_name = 'active_storage_attachments'

  # Define ransackable attributes
  def self.ransackable_attributes(auth_object = nil)
    %w[blob_id created_at id name record_id record_type]
  end
end
