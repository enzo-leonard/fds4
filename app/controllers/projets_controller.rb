class ProjetsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_projet, only: [:show, :edit, :update, :destroy]

  # GET /projets
  # GET /projets.json
  def index
    @projets = Projet.all
  end

  # GET /projets/1
  # GET /projets/1.json
  def show
  end

  # GET /projets/new
  def new
    @projet = Projet.new
    redirect_to request.referrer
  end

  # GET /projets/1/edit
  def edit
    redirect_to request.referrer
  end

  # POST /projets
  # POST /projets.json
  def create
    @projet = Projet.new(projet_params)

    if params[:target]
      ProjetTarget.where({projet: @projet}).destroy_all
      ProjetTarget.create!({projet: @projet, target: Target.find(params[:target]) }) if ProjetTarget.where(projet: @projet, target: Target.find(params[:target]) ).count == 0
    end


    if params[:more_form]
      params[:more_form].split(';').each do |id|
        form = Form.find(id)
      
        ProjetForm.create!({projet: @projet, form: form }) if ProjetForm.where(projet: @projet, form:form).count == 0
      end
    end

    if params[:less_form]
      params[:less_form].split(';').each do |id|
        ProjetForm.where(projet: @projet, form: Form.find(id))[0].destroy! if ProjetForm.where(projet: @projet, form: Form.find(id))[0]
      end
    end

    if params[:more_theme]
      params[:more_theme].split(';').each do |id|
        theme = Theme.find(id)
      
        ProjetTheme.create!({projet: @projet, theme: theme }) if ProjetTheme.where(projet: @projet, theme:theme).count == 0
      end
    end

    if params[:less_theme]
      params[:less_theme].split(';').each do |id|
        ProjetTheme.where(projet: @projet, theme: Theme.find(id))[0].destroy! if ProjetTheme.where(projet: @projet, theme: Theme.find(id))[0]
      end
    end

    redirect_to request.referrer

    
    
  end

  # PATCH/PUT /projets/1
  # PATCH/PUT /projets/1.json
  def update
    
 
       @projet.update!(projet_params)

        if params[:more_form]
          params[:more_form].split(';').each do |id|
            form = Form.find(id)
          
            ProjetForm.create!({projet: @projet, form: form }) if ProjetForm.where(projet: @projet, form:form).count == 0
          end
        end

        if params[:less_form]
          params[:less_form].split(';').each do |id|
            ProjetForm.where(projet: @projet, form: Form.find(id))[0].destroy! if ProjetForm.where(projet: @projet, form: Form.find(id))[0]
          end
        end

        if params[:target]
          ProjetTarget.where({projet: @projet}).destroy_all
          ProjetTarget.create!({projet: @projet, target: Target.find(params[:target]) }) if ProjetTarget.where(projet: @projet, target: Target.find(params[:target]) ).count == 0
        end

        if params[:more_theme]
          params[:more_theme].split(';').each do |id|
            theme = Theme.find(id)
          
            ProjetTheme.create!({projet: @projet, theme: theme }) if ProjetTheme.where(projet: @projet, theme:theme).count == 0
          end
        end

        if params[:less_theme]
          params[:less_theme].split(';').each do |id|
            ProjetTheme.where(projet: @projet, theme: Theme.find(id))[0].destroy! if ProjetTheme.where(projet: @projet, theme: Theme.find(id))[0]
          end
        end
       # format.html { redirect_to @projet, notice: 'Projet was successfully updated.' }
        #format.json { render :show, status: :ok, location: @projet }
        
        redirect_to request.referrer
      
       

    
  end

  # DELETE /projets/1
  # DELETE /projets/1.json
  def destroy
    @projet.destroy
    respond_to do |format|
      format.html { redirect_to request.referrer, notice: 'Projet supprimé' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_projet
      @projet = Projet.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def projet_params
      params.require(:projet).permit(:name_structure, :title, :url, :keywords, :difficulty, :date, :live, :synopsis, :image, :territory, :duration, :stars, :stars_text, :double, :question, :good_answer, :prop_1, :prop_2, :answer, :double, :photo)
    end
end
