# == Schema Information
#
# Table name: albums
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'
require 'factory_girl'

describe Album do
  let(:album) { Album.create( name: 'New York' )}

  describe '.create' do
    it 'creates a new album and save to the database' do
      expect(album).to be_an_instance_of Album
      album.name.should eq Album.first.name
    end
  end

  describe '#photos' do
    it 'should have some photos' do
      photo = FactoryGirl.create(:photo)
      album.photos << photo
      album.photos.count.should eq 1
    end
  end

end
