require 'rails_helper'

RSpec.describe Category, type: :model do
  subject(:category){
    category = Category.create(name:'Indian')
  }
  it "should valid input for category" do
    category.valid?
    expect(category).to be_valid
  end

  it 'should invalid input name blank' do
    category.name = nil
    category.valid?
    expect(category.errors[:name]).to include("can't be blank")
  end
  
end
