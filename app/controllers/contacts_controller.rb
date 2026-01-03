# Browser → Controller - Rota chama ContactsController#new
class ContactsController < ApplicationController
  # Antes disso, roda before_action :require_login → garante que o usuário está logado
  before_action :require_login
  # Executa o método set_contact antes das ações show, edit, update e destroy. Isso carrega o contato correto com base no params[:id].
  before_action :set_contact, only: %i[show edit update destroy]

  # GET /contacts - ações publicas
  def index
    # @contacts é usado na view index.html.erb
    @contacts = current_user.contacts
  end

  # GET /contacts/1
  def show
  end

  # GET /contacts/new
  def new
    # Cria um novo objeto Contact associado ao usuário atual
    @contact = current_user.contacts.build
  end

  # POST /contacts
  def create
    # Cria um novo contato com os parâmetros permitidos.
    @contact = current_user.contacts.build(contact_params)
    if @contact.save
      # Se salvar com sucesso → redireciona para a lista de contatos com mensagem de sucesso.
      redirect_to contacts_path, notice: "Contato criado com sucesso."
    else
      # Se falhar → renderiza novamente o formulário new com status HTTP 422.
      render :new, status: :unprocessable_entity
    end
  end

  # GET /contacts/1/edit ... Renderiza o formulário de edição de um contato.
  # O contato já foi carregado pelo set_contact.
  def edit
  end

  # PATCH/PUT /contacts/1
  def update
    # Atualiza o contato com os parâmetros permitidos.
    if @contact.update(contact_params)
      # Se salvar com sucesso → redireciona para a lista de contatos com mensagem de sucesso.
      redirect_to contacts_path, notice: "Contato atualizado com sucesso."
    else
      # Se falhar → renderiza novamente o formulário edit com status HTTP 422.
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /contacts/1
  def destroy
    # exclui o contato carregado e redireciona para a lista com mensagem de sucesso.
    @contact.destroy
    redirect_to contacts_path, notice: "Contato excluído com sucesso."
  end

  # Métodos privados
  private

  def set_contact
    # Busca o contato pelo id passado na URL, mas apenas dentro dos contatos do usuário atual.
    @contact = current_user.contacts.find(params[:id])
  end

  # Define quais parâmetros são permitidos para criação/edição de contatos (proteção contra mass assignment).
  def contact_params
    params.require(:contact).permit(:name, :phone, :email, :company, :position, :birthdate, :notes, :avatar)
  end

  def require_login
    # Verifica se o usuário está logado.
    unless logged_in?
      # Se não estiver, redireciona para a página de login (entrar_path) com uma mensagem de alerta.
      redirect_to entrar_path, alert: "Você precisa estar logado para acessar esta página."
    end
  end
end
