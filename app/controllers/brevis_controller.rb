class BrevisController < ApplicationController
  before_action :set_brevi, only: [:show, :edit, :update, :destroy]

  # GET /brevis
  # GET /brevis.json
  def index
    @brevis = Brevi.all
  end

  # GET /brevis/1
  # GET /brevis/1.json
  def show
    @brevi = Brevi.find_by_slug params[:slug]
    redirect_to @brevi.original_url
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
        format.html { redirect_to @brevi, notice: 'Brevi was successfully created.' }
        format.json { render :show, status: :created, location: @brevi }
      else
        format.html { render :new }
        format.json { render json: @brevi.errors, status: :unprocessable_entity }
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
    params.require(:brevi).permit(:protocol, :original_url, :slug, :clicks)
  end
end
