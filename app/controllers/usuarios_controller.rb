class UsuariosController < ApplicationController
  
  def index
  end

  # Renderiza formulário de login.
  def login
    @usuario = Usuario.new
  end
  
  # Verifica se o usuário passado pela view login existe e a senha confere.
  # Se existir, redireciona pro index.
  # Se não existir, renderiza a tela de login.
  def do_login
    usuario = Usuario.find_by_email_and_senha(params['usuario']['email'], params['usuario']['senha'])
    if usuario.nil?
      redirect_to :action => 'login'
    else
      @usuario = usuario
      redirect_to :action => 'index'
    end
  end
  
  # Renderiza a view para criar um novo usuário
  def signup
    @usuario = Usuario.new
  end
  
  # Verifica se os parâmetros não são null.
  # Se não forem, salva no banco de dados.
  # Se algum for, renderiza a view de signup.
  def do_signup
    nome = params['usuario']['nome']
    email = params['usuario']['email']
    senha = params['usuario']['senha']
    if nome.nil? || senha.nil? || email.nil?
      render :action => 'signup'
    else
      usuario = Usuario.new
      usuario.nome = nome
      usuario.email = email
      usuario.senha = senha
      usuario.save
      redirect_to :action => 'login'      
    end
  end
end
