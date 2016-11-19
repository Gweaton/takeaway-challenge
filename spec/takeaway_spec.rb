require 'takeaway'
require 'menu'
  describe Takeaway do
    subject(:takeaway) { described_class.new }
    let(:menu) {double :menu}

    before do
      allow(menu).to receive(:list).and_return(scrambled_eggs: 5)
    end

    it 'should initialize with an empty order hash' do
      expect(takeaway.basket).to be_empty
    end

    it 'should access the menu from the Menu class' do
      expect(takeaway.menu.list).to include(scrambled_eggs: 5)
    end

    describe "#see_menu" do
      it 'should show the customer the menu' do
        expect(takeaway.see_menu).to include(scrambled_eggs: 5)
      end
  end
    describe "#show_basket" do
      before do
        allow(menu).to receive(:basket).and_return({})
      end
      it 'should show the current basket' do
      expect(takeaway.show_basket).to eq menu.basket
      end
    end
    describe "#order" do
      it 'should add an order to the menu basket' do
        takeaway.order("bacon_sandwich")
        expect(takeaway.basket).to include "bacon_sandwich"
      end
    end
    describe "#show_price" do
      it 'should show the grand_total' do
        takeaway.order("bacon_sandwich")
        expect(takeaway.show_price).to eq "£4"
      end
    end

end
