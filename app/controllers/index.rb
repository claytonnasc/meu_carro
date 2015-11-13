# GET /carros
# GET /carros.json
def index
  @carros = Contato.all
 
  respond_to do |format|
    format.html
    format.json { render json: @carros }
  end
end