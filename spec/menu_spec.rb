require 'menu'

describe Menu do
  let(:menu) {described_class.new}
  let(:incorrect_item) {double :incorrect_item}

  context "menu items" do
    it 'should be a hash' do
      expect(menu.menu).to be_instance_of Hash
    end
    it 'should have a list of foods' do
      expect(menu.menu).to include(:toast)
    end
  end

  describe "#add_to_basket" do
    before do
      allow(incorrect_item).to receive(:to_sym)
    end
    it 'should respond to add_to_basket' do
      expect(menu).to respond_to(:add_to_basket).with(1).argument
    end
    it 'should add an item to the basket' do
        menu.add_to_basket(:bacon_sandwich)
        expect(menu.basket).to include(:bacon_sandwich)
    end
    it 'should not allow items to be added that are not on the menu' do
      expect{menu.add_to_basket(incorrect_item)}.to raise_error("Item not on the menu")
    end
    it 'should calculate the total price for multiple items' do
      menu.add_to_basket(:bacon_sandwich, 2)
      expect(menu.basket[:bacon_sandwich]).to eq ["Quantity: 2, Total price: 8"]
    end
  end
  describe '#checkout' do
    before do
      menu.add_to_basket(:bacon_sandwich)
    end
    it 'should take a price as an argument' do
      expect(menu).to respond_to(:checkout).with(1).argument
    end
    it 'should return true if the price matches the grand total' do
      expect(menu.checkout(4)).to be true
    end
    it 'should return false if the price does not match the grand total' do
      expect{menu.checkout(3)}.to raise_error("Incorrect total. Please double-check.")
    end
  end

end
