class User < ApplicationRecord
  # 小文字に変換
  before_save {self.email.downcase!}
  # nameのバリデーション
  validates :name, presence: true, length: {maximum:50}
  # emailのバリデーション
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  # パスワードを暗号化して保存する
  has_secure_password
  
  has_many :tasks
end
