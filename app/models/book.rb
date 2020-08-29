class Book < ApplicationRecord
	validates :title, presence: true #空欄でないことを確認
	validates :body, presence: true #バリデーションチェック設定
end
