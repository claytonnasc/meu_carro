class Modelo < ActiveRecord::Base  
  validates_presence_of :nome, :message => "O nome do carro deve ser preenchido."
  validates_presence_of :cor, :message => "A cor do carro deve ser preenchido."
  validates_presence_of :descricao, :message => "A descrição do carro deve ser preenchido."
  validates_presence_of :ano, :message => "O ano do carro deve ser preenchido."
  

  has_attached_file :cover, :styles { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/default.png"
end