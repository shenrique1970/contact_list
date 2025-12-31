class User < ApplicationRecord
  has_secure_password

  # Relacionamento: um usuário tem muitos contatos
  has_many :contacts, dependent: :destroy

  # Validações
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end
