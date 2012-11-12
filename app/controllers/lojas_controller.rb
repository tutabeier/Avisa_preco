class LojasController < ApplicationController
  
  # Mostra toda as lojas e os patterns.
  def index
    @lojas = Loja.find(:all)
  end
  
  # Renderiza o form de inclusão.
  def incluir
    @loja = Loja.new
  end
  
  # Cria uma nova loja.
  # Não faz verificação ainda.
  def criar
    loja = Loja.new
    loja.nome = params['loja']['nome']
    loja.pattern_preco = params['loja']['pattern_preco']
    loja.save
    redirect :action => 'index'
  end
end