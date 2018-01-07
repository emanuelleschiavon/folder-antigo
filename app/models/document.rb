class Document < ApplicationRecord
	VALID_FILE_FORMAT = /\A([\w]+)(.pdf)\Z/i
	validates :title, presence: true, uniqueness: { case_sensitive: false }, lenght: { minimum: 3 }, format: { with: VALID_FILE_FORMAT, message: "Invalid filename" }
	validates :content, presence: true
end