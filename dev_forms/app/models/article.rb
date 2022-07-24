class Article < ApplicationRecord
	has_one :comment, dependent: :destroy
end
