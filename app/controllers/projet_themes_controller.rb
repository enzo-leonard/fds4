class ProjetThemesController < ApplicationController
  before_action :set_projet_theme, only: [:show, :edit, :update, :destroy]

  # GET /projet_themes
  # GET /projet_themes.json
  def index
    @projet_themes = ProjetTheme.all
  end

  # GET /projet_themes/1
  # GET /projet_themes/1.json
  def show
  end

  # GET /projet_themes/new
  def new
    @projet_theme = ProjetTheme.new
  end

  # GET /projet_themes/1/edit
  def edit
  end

  # POST /projet_themes
  # POST /projet_themes.json
  def create
    @projet_theme = ProjetTheme.new(projet_theme_params)

    respond_to do |format|
      if @projet_theme.save
        format.html { redirect_to @projet_theme, notice: 'Projet theme was successfully created.' }
        format.json { render :show, status: :created, location: @projet_theme }
      else
        format.html { render :new }
        format.json { render json: @projet_theme.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projet_themes/1
  # PATCH/PUT /projet_themes/1.json
  def update
    respond_to do |format|
      if @projet_theme.update(projet_theme_params)
        format.html { redirect_to @projet_theme, notice: 'Projet theme was successfully updated.' }
        format.json { render :show, status: :ok, location: @projet_theme }
      else
        format.html { render :edit }
        format.json { render json: @projet_theme.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projet_themes/1
  # DELETE /projet_themes/1.json
  def destroy
    @projet_theme.destroy
    respond_to do |format|
      format.html { redirect_to projet_themes_url, notice: 'Projet theme was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_projet_theme
      @projet_theme = ProjetTheme.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def projet_theme_params
      params.require(:projet_theme).permit(:projet_id, :theme_id)
    end
end
