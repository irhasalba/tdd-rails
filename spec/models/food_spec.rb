require 'rails_helper'

RSpec.describe Food, type: :model do
  it "is valid with a name and a description" do
    food = Food.new(
      name: 'Nasi Uduk',
      description: 'Betawi style steamed rice cooked in coconut milk. Delicious!',
      price: 15000.0,
      category: 'indonesian'
    )
    
    expect(food).to be_valid  
  end

  it 'is invalid without a name' do
    food = Food.new(
      name: nil,
      description: 'Betawi style steamed rice cooked in coconut milk. Delicious!',
      price: 15000.0,
      category: 'indonesian'
    )

    food.valid?

    expect(food.errors[:name]).to include("can't be blank")   
  end

  it 'is invalid with a duplicate name' do

    food1 = Food.create(
      name: "Nasi Uduk",
      description: "Betawi style steamed rice cooked in coconut milk. Delicious!",
      price: 15000.0,
      category: 'indonesian'
    )
    
    food2 = Food.new(
      name: "Nasi Uduk",
      description: "Just with a different description.",
      price: 15000.0,
      category: 'indonesian'
    )


    food2.valid?

    expect(food2.errors[:name]).to include("has already been taken")
  end

  it 'is invalid price must only number' do
      food = Food.create(
        name: "Kerak Telor",
        description: "Betawi traditional spicy omelette made from glutinous rice cooked with egg and served with serundeng.",
        price: 'jsjaksj',
        category: 'indonesian'
      )

      food.valid?

      expect(food.errors[:price]).to include("is not a number")

    end

  it 'is invalid when price less than 0.01' do
    food = Food.create(
        name: "Kerak Telor",
        description: "Betawi traditional spicy omelette made from glutinous rice cooked with egg and served with serundeng.",
        price: 0.00,
        category: 'indonesian'
      )

      food.valid?

      expect(food.errors[:price]).to include("must be greater than 0.01")
  end

  it 'is category blank' do
    food = Food.create(
        name: "Kerak Telor",
        description: "Betawi traditional spicy omelette made from glutinous rice cooked with egg and served with serundeng.",
        price: 15000.0,
        category: nil
      )
      food.valid?

      expect(food.errors[:category]).to include("can't be blank")   
  end


end

RSpec.describe "self#by_letter" do
      it 'should return a sorted array of result that match' do
        food1 = Food.create(
        name: "Nasi Uduk",
        description: "Betawi style steamed rice cooked in coconut milk. Delicious!",
        price: 10000.01,
        category: 'indonesian'
      )

      food2 = Food.create(
        name: "Kerak Telor",
        description: "Betawi traditional spicy omelette made from glutinous rice cooked with egg and served with serundeng.",
        price: 8000.01,
        category: 'indonesian'
      )

      food3 = Food.create(
        name: "Nasi Semur Jengkol",
        description: "Based on dongfruit, this menu promises a unique and delicious taste with a small hint of bitterness.",
        price: 8000.01,
        category: 'indonesian'
      )


      expect(Food.by_letter('N')).to eq([food3,food1])

      end
    
  end


