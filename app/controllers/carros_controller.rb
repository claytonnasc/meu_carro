class CarrosController < ApplicationController
  before_action :set_carro, only: [:show, :edit, :update, :destroy]

  def index
    # instancia todos os carros
    @carros = Carro.all
 
    respond_to do |format|  
      # passando para o formato HTML
      format.html # index.html.erb
      # passando para o formato json
      format.json { render json: @carros }
      end
  end

  def show
     @carros = Carro.where(id: params[:id]).first
  end

  def new
    # instancia um novo carro
    @carros = Carro.new
  end

  def edit
    @carros = Carro.find(params[:id])
  end
  
  # metodo para criacao de carro
  def create
    # instanciando carro, passando o parametro carro_params
    @carro = Carro.new(carro_params)
    
    respond_to do |format|
      # se o parametro passado for dife
      if @carro.save
        # Redireciona para @carro, em formato html, com a mensagem (Carro cadastrado com sucesso!)
        format.html { redirect_to @carro, notice: 'Cadastrado com sucesso' }
        # Renderiza para @carro, em formato json
        format.json { render :show, status: :created, location: @carro }
      else
        # Faz um nova renderizacao em formato HTML
        format.html { render :new }
        # Renderiza para @carro ˜chamando˜ erro
        format.json { render json: @carro.errors, status: :unprocessable_entity }
      end
    end
  end

  # metodo para atualizar
  def update  
    respond_to do |format|
      # Se o parametro passado for diferente 
      if @carro.update(carro_params)
        # Redireciona para @carro, em formato html, com a mensagem (carro atualizado com sucesso)
        format.html { redirect_to @carro, notice: 'Atualizado com sucesso.' }
        # Renderiza para @carro, em formato json
        format.json { render :show, status: :ok, location: @carro }
      else
        # Faz uma nova renderizacao em formato HTML
        format.html { render :edit }
        # Renderiza para @carro ˜chamando˜ erro
        format.json { render json: @carro.errors, status: :unprocessable_entity }
      end
    end
  end

  # Metodo para remover 
  def destroy
    #passando o metodo destroy
    @carro.destroy
    respond_to do |format|
      # Redireciona para @carro, em formato html, com a mensagem (carro removido com suceso)
      format.html { redirect_to carros_url, notice: 'Deletado com sucesso.' }
      # formato json
      format.json { head :no_content }
    end
  end

  private
    def set_carro
      @carro = Carro.find(params[:id])
    end
    
    # metodo carro parametro
    def carro_params
      # passando os parametros do carro, que sao: nome, cor, descricao, ano
      params.require(:carro).permit(:nome, :cor, :descricao, :ano, :cover)
    end
end
