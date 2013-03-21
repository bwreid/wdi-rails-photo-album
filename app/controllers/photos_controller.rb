class PhotosController < ApplicationController
  def new
    @album = Album.find(params[:album_id])
    @photo = Photo.new
  end

  def create
    album = Album.find( params[:album_id] )
    album.photos << Photo.create( params[:photo] )
    @photos = album.photos
  end
end