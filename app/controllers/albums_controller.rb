class AlbumsController < ApplicationController
  before_action :set_album, only: %i[ show edit update destroy ]
  before_action :set_api

  # GET /albums or /albums.json
  def index
    @albums = Album.all
  end

  def show
  end

  # GET /albums/new
  def new
    @album = Album.new
    @tasks = @api_service.tasks.parsed_response.flatten
  end

  # GET /albums/1/edit
  def edit
    @tasks = @api_service.tasks.parsed_response.flatten
  end

  # POST /albums or /albums.json
  def create
    @album = Album.new(album_params)

    respond_to do |format|
      if @album.save
        format.html { redirect_to @album, notice: "Album was successfully created." }
        format.json { render :show, status: :created, location: @album }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /albums/1 or /albums/1.json
  def update
    respond_to do |format|
      if @album.update(album_params)
        format.html { redirect_to @album, notice: "Album was successfully updated." }
        format.json { render :show, status: :ok, location: @album }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /albums/1 or /albums/1.json
  def destroy
    if can? :destroy, @album
      @album.destroy
      respond_to do |format|
        format.html { redirect_to albums_url, notice: "Album was successfully destroyed." }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to albums_url, notice: "User don't have permission." }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_album
      @album = Album.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def album_params
      params.require(:album).permit(:name, :year, :artist)
    end

    def set_api
      @api_service = Api.new
    end
end
