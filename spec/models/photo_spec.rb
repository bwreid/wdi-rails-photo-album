# == Schema Information
#
# Table name: photos
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  url        :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  album_id   :integer
#

require 'spec_helper'
require 'factory_girl'

describe Photo do
    let(:photo) { Photo.create( name: "East Village", url: 'ev.jpg') }

  describe '.create' do
    it 'should create a new photo and save to the database' do
      expect(photo).to be_an_instance_of Photo
      photo.name.should eq photo.name
      photo.url.should eq photo.url
    end
  end

  describe '#album' do
    it 'should have an album' do
      album = FactoryGirl.create(:album)
      photo.album = album
      photo.album.should_not be nil
    end
  end
end
