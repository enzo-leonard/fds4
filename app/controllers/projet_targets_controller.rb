class ProjetTargetsController < ApplicationController
  before_action :set_projet_target, only: [:show, :edit, :update, :destroy]

  # GET /projet_targets
  # GET /projet_targets.json
  def index
    @projet_targets = ProjetTarget.all
  end

  # GET /projet_targets/1
  # GET /projet_targets/1.json
  def show
  end

  # GET /projet_targets/new
  def new
    @projet_target = ProjetTarget.new
  end

  # GET /projet_targets/1/edit
  def edit
  end

  # POST /projet_targets
  # POST /projet_targets.json
  def create
    @projet_target = ProjetTarget.new(projet_target_params)

    respond_to do |format|
      if @projet_target.save
        format.html { redirect_to @projet_target, notice: 'Projet target was successfully created.' }
        format.json { render :show, status: :created, location: @projet_target }
      else
        format.html { render :new }
        format.json { render json: @projet_target.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projet_targets/1
  # PATCH/PUT /projet_targets/1.json
  def update
    respond_to do |format|
      if @projet_target.update(projet_target_params)
        format.html { redirect_to @projet_target, notice: 'Projet target was successfully updated.' }
        format.json { render :show, status: :ok, location: @projet_target }
      else
        format.html { render :edit }
        format.json { render json: @projet_target.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projet_targets/1
  # DELETE /projet_targets/1.json
  def destroy
    @projet_target.destroy
    respond_to do |format|
      format.html { redirect_to projet_targets_url, notice: 'Projet target was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_projet_target
      @projet_target = ProjetTarget.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def projet_target_params
      params.require(:projet_target).permit(:projet_id, :target_id)
    end
end
