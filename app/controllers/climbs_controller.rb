class ClimbsController < ApplicationController
  before_action :set_climb, only: %i[ show edit update destroy ]

  # GET /climbs or /climbs.json
  def index
    @climbs = Climb.all
  end

  # GET /climbs/1 or /climbs/1.json
  def show
  end

  # GET /climbs/new
  def new
    @climb = Climb.new
  end

  # GET /climbs/1/edit
  def edit
  end

  # POST /climbs or /climbs.json
  def create
    @climb = Climb.new(climb_params)

    respond_to do |format|
      if @climb.save
        format.html { redirect_to climb_url(@climb), notice: "Climb was successfully created." }
        format.json { render :show, status: :created, location: @climb }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @climb.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /climbs/1 or /climbs/1.json
  def update
    respond_to do |format|
      if @climb.update(climb_params)
        format.html { redirect_to climb_url(@climb), notice: "Climb was successfully updated." }
        format.json { render :show, status: :ok, location: @climb }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @climb.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /climbs/1 or /climbs/1.json
  def destroy
    @climb.destroy!

    respond_to do |format|
      format.html { redirect_to climbs_url, notice: "Climb was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_climb
      @climb = Climb.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def climb_params
      params.require(:climb).permit(:name, :grade_id, :location, :climb_type, :attempts, :comments)
    end
end
