class AlbumsController < ApplicationController

  def create
    @album = Album.new(album_params)

    if @album.save
      flash[:success] = "Album added!"
      redirect_to band_url(@album.artist)
    else
      flash.now[:errors] = @album.errors.full_messages
      render :new
    end
  end

  def new
    @album = Album.new
    render :new
  end

  def show
    @album = Album.find(params[:id])
    render :show
  end

  def edit
    @album = Album.find(params[:id])
    render :edit
  end

  def update
    @album = Album.find(params[:id])

    if @album.update(album_params)
      redirect_to album_url(@album)
    else
      flash.now[:errors] = @album.errors.full_messages
      render :edit
    end
  end


  def destroy
    album = Album.find(params[:id])

    if album.destroy
      flash[:success] = "Album removed from Database."
      redirect_to albums_url
    else
      flash.now[:errors] = album.errors.full_messages
      render :edit
    end
  end

  private

  def album_params
    params.require(:album).permit(:band_id, :title, :year, :studio_recording)
  end
end
