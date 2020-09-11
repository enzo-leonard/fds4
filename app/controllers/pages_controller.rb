class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @projets = Projet.joins(:projet_theme).joins(:projet_target).joins(:projet_form).where(nil).group('projets.id')
    @projets = @projets.where("projets.title ilike ? OR projets.keywords ilike ?", "%#{params[:title]}%", "%#{params[:title]}%") if params[:title].present?
    @projets = @projets.where("projets.difficulty = ?", "#{params[:difficulty]}") if params[:difficulty].present?
    @projets = @projets.where("projets.duration = ?", "#{params[:duration]}") if params[:duration].present?
    @projets = @projets.where("projets.territory = ?", "#{params[:territory]}") if params[:territory].present?
    @projets = @projets.where("projet_themes.theme_id = ?", "#{params[:theme]}") if params[:theme].present?
    @projets = @projets.where("projet_targets.target_id = ?", "#{params[:target]}") if params[:target].present?
    @projets = @projets.where("projet_forms.form_id = ?", "#{params[:form]}") if params[:form].present?

    @title_search = "Tous les projets"
    @title_search = "Résultats de recherche (#{@projets.size.size})" if (params[:title].present? || params[:theme].present? || params[:target].present?)
  
    @projets_stars = Projet.where(stars: true)
  end
end
