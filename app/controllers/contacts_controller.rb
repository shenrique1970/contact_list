class ContactsController < ApplicationController
  before_action :require_login
  before_action :set_contact, only: %i[show edit update destroy]

  # GET /contacts
  def index
    @contacts = current_user.contacts
  end

  # GET /contacts/1
  def show
  end

  # GET /contacts/new
  def new
    @contact = current_user.contacts.build
  end

  # POST /contacts
  def create
    @contact = current_user.contacts.build(contact_params)
    if @contact.save
      redirect_to contacts_path, notice: "Contato criado com sucesso."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET /contacts/1/edit
  def edit
  end

  # PATCH/PUT /contacts/1
  def update
    if @contact.update(contact_params)
      redirect_to contacts_path, notice: "Contato atualizado com sucesso."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /contacts/1
  def destroy
    @contact.destroy
    redirect_to contacts_path, notice: "Contato excluído com sucesso."
  end

  private

  def set_contact
    @contact = current_user.contacts.find(params[:id])
  end

  def contact_params
    params.require(:contact).permit(:name, :phone, :email, :company, :position, :birthdate, :notes, :avatar)
  end

  def require_login
    unless logged_in?
      redirect_to entrar_path, alert: "Você precisa estar logado para acessar esta página."
    end
  end
end
