class AlbumsController < ApplicationController
  def new
    @album = Album.new
  end

  def create
    @album = Album.create( params[:album] )
  end

  def show
    @album = Album.find( params[:id] )
    @photos = @album.photos
  end

  def filter
    album = Album.find( params[:id] )
    @photos = album.photos.limit( params[:count] )
  end
end