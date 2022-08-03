class SparesController < ApplicationController
  before_action :set_spare, only: %i[ show edit update destroy ]


  # GET /spares or /spares.json
  def index
    @spares = Spare.all
    @body_spares = ['door','back door','hood']
  end

  # GET /spares/1 or /spares/1.json
  def show
  end

  # GET /spares/new
  def new
    @spare = Spare.new
  end

  # GET /spares/1/edit
  def edit
  end

  # POST /spares or /spares.json
  def create
    @spare = Spare.new(spare_params)
    @spare.picture.attach(spare_params[:picture])
    respond_to do |format|
      if @spare.save
        format.html { redirect_to spare_url(@spare), notice: "Spare was successfully created." }
        format.json { render :show, status: :created, location: @spare }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @spare.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /spares/1 or /spares/1.json
  def update
    respond_to do |format|
      if @spare.update(spare_params)
        format.html { redirect_to spare_url(@spare), notice: "Spare was successfully updated." }
        format.json { render :show, status: :ok, location: @spare }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @spare.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /spares/1 or /spares/1.json
  def destroy
    @spare.destroy

    respond_to do |format|
      format.html { redirect_to spares_url, notice: "Spare was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_spare
      @spare = Spare.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def spare_params
      params.require(:spare).permit(:name, :price, :picture)
    end
end
