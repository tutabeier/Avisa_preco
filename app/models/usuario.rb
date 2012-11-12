class Usuario < ActiveRecord::Base
  attr_accessible :email, :nome, :senha
  validates_uniqueness_of :email # verifica a unicidade do email no banco
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i # expressão regular do email
  validates :nome,     :presence      => true # verifica presena do nome
  validates :email,    :presence      => true, # verifica presena do email
                       :format        => { :with => email_regex } # com o formato da expressão regular
  validates :senha,    :presence      => true # verifica presena da senha
end
