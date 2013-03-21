require 'spec_helper'
require 'factory_girl'

describe 'Albums Controller' do

  describe 'GET /' do
    it 'should have a link to create a new album' do
      visit root_path
      page.should have_xpath("//a[@href = '#{new_album_path}']")
    end
  end

  describe 'GET /albums/new', :js => true do
    it 'should show a form that allows you to submit a new album' do
      visit root_path
      find(:xpath, "//a[@href = '#{new_album_path}']").click
      page.should have_xpath("//form[@method = 'post']")
    end

    it 'should show a cancel button that will close the form' do
      visit root_path
      find(:xpath, "//a[@href = '#{new_album_path}']").click
      click_link('Cancel')
      page.should_not have_xpath("//form[@method = 'post']")
    end
  end

  describe 'POST /albums/new', :js => true do
    it 'should create a new album and save to the database' do
      visit root_path
      find(:xpath, "//a[@href = '#{new_album_path}']").click
      fill_in 'album_name', with: 'New Album'
      find(:xpath, "//form[@method = 'post']/input[@type='submit']").click
      page.should have_text('New Album')
    end

    it 'should show on the page in alphabetical order', :js => true do
      FactoryGirl.create(:album, name: 'Zebras')
      visit root_path
      find(:xpath, "//a[@href = '#{new_album_path}']").click
      fill_in 'album_name', with: 'New Album'
      find(:xpath, "//form[@method = 'post']/input[@type='submit']").click

      sleep 1
      page.should have_css('p:first-child', :text => 'New Album')
      visit root_path
      page.should have_css('p:first-child', :text => 'New Album')
    end

    it 'should show the correct number of photos next to the album name' do
      album = FactoryGirl.create(:album, name: 'Zebras')
      album.photos << FactoryGirl.create(:photo)
      visit root_path
      find(:xpath, "//p[@class='album']").should have_text '1'
    end
  end

  describe 'GET /albums/1' do
    before(:each) do
      FactoryGirl.create(:album, name: 'Zebras')
      visit root_path
      click_link('Zebras')
    end

    it 'should go to the albums show page' do
      current_path.should eq '/albums/1'
      page.should have_css( 'h3', text: 'Zebras Album')
    end

    it 'should have a button to create a new photo' do
      page.should have_xpath("//a[@href = '#{new_photo_path}']")
    end

    it 'should show a form after the new photo button is clicked', :js => true do
      find(:xpath, "//a[@href = '#{new_photo_path}']").click
      page.should have_xpath("//form[@method='post']/input[@type='submit']")
    end

    it 'should show a form with a cancel button that works', :js => true do
      find(:xpath, "//a[@href = '#{new_photo_path}']").click
      click_link('Cancel')
      page.should_not have_xpath("//form[@method = 'post']")
    end

  end
end