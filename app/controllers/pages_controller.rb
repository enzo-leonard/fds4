class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @projets = Projet.where(nil)
    @projets = @projets.where("title like ?", "#{params[:title]}%") if params[:title].present?
    @projets = @projets.where("title like ?", "#{params[:theme]}%") if params[:theme].present?
    @projets_stars = Projet.where(stars: true)
  end
end
