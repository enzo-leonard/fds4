class ProjetFormsController < ApplicationController
  before_action :set_projet_form, only: [:show, :edit, :update, :destroy]

  # GET /projet_forms
  # GET /projet_forms.json
  def index
    @projet_forms = ProjetForm.all
  end

  # GET /projet_forms/1
  # GET /projet_forms/1.json
  def show
  end

  # GET /projet_forms/new
  def new
    @projet_form = ProjetForm.new
  end

  # GET /projet_forms/1/edit
  def edit
  end

  # POST /projet_forms
  # POST /projet_forms.json
  def create
    @projet_form = ProjetForm.new(projet_form_params)

    respond_to do |format|
      if @projet_form.save
        format.html { redirect_to @projet_form, notice: 'Projet form was successfully created.' }
        format.json { render :show, status: :created, location: @projet_form }
      else
        format.html { render :new }
        format.json { render json: @projet_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projet_forms/1
  # PATCH/PUT /projet_forms/1.json
  def update
    respond_to do |format|
      if @projet_form.update(projet_form_params)
        format.html { redirect_to @projet_form, notice: 'Projet form was successfully updated.' }
        format.json { render :show, status: :ok, location: @projet_form }
      else
        format.html { render :edit }
        format.json { render json: @projet_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projet_forms/1
  # DELETE /projet_forms/1.json
  def destroy
    @projet_form.destroy
    respond_to do |format|
      format.html { redirect_to projet_forms_url, notice: 'Projet form was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_projet_form
      @projet_form = ProjetForm.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def projet_form_params
      params.require(:projet_form).permit(:projet_id, :form_id)
    end
end
