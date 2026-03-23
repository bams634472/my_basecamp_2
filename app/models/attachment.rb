class Attachment < ApplicationRecord
  belongs_to :project
  belongs_to :user
  has_one_attached :file

  def file_icon
    case file.content_type
    when /image/ then "📷"
    when "application/pdf" then "📄"
    when /excel|spreadsheet/ then "📊"
    else "📎"
    end
  end

  def file_extension
    File.extname(filename || file.filename.to_s)
  end
end