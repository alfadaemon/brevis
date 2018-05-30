class BrevisController < ApplicationController
  before_action :set_brevi, only: [:show, :edit, :update, :destroy]

  # GET /brevis
  # GET /brevis.json
  def index
    @brevi = Brevi.new
    @brevis = Brevi.limit(100).order(clicks: :desc)
  end

  # GET /brevis/1
  # GET /brevis/1.json
  def show
    @brevi = Brevi.find_by_slug params[:slug]
    if @brevi
      @brevi.increment! :clicks
      redirect_to @brevi.original_url
    else
      redirect_to brevis_url, notice: 'There was an error redirecting.'
    end
  end

  # GET /brevis/new
  def new
    @brevi = Brevi.new
  end

  # POST /brevis
  # POST /brevis.json
  def create
    @brevi = Brevi.new(brevi_params)

    respond_to do |format|
      if @brevi.save
        format.html { redirect_to brevis_url, notice: "Your short link is <a href='#{root_url}#{@brevi.slug}'>#{root_url}/#{@brevi.slug}</a>"}
      else
        format.html { render :new }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_brevi
    @brevi = Brevi.find_by_slug(params[:slug])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def brevi_params
    params.require(:brevi).permit(:original_url, :slug, :clicks)
  end
end
