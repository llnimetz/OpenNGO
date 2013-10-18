require 'spec_helper'

feature "translation" do
  scenario "User switches from english to spanish and back in homepage" do
    visit root_path
    click_link 'Ar'
    expect(current_path).should eql('/es')
    click_link 'Us'
    expect(current_path).should eql('/en')
  end

end
