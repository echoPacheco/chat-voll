class Message < ApplicationRecord
    belongs_to :sender, class_name: 'User'
    belongs_to :receiver, class_name: 'User'
    has_one_attached :file

    def file_url
        Rails.application.routes.url_helpers.rails_blob_url(file, only_path: true) if file.attached?
    end
end
