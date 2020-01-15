require 'rails_helper'


describe Piece, type: :model do
    context '#is_obstructed' do
      before(:each) do 
        @queen = stub_model(Queen)
        @queen.x_position = 4
        @queen.y_position = 4
      end
      context "should return true if" do 
        it "pieces horizontal to destination" do
          byebug
        end 
      end
      context "should return false if" do

      end
  
    end
  end