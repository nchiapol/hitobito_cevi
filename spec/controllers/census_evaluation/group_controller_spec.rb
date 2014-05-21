require 'spec_helper'

describe CensusEvaluation::GroupController do

  let(:zh) { groups(:jungschar_zh10) }

  before { sign_in(people(:bulei)) }

  describe 'GET total' do

    before { get :index, id: zh.id }

    it 'assigns counts' do
      assigns(:group_counts).should be_nil
    end

    it 'assigns total' do
      total = assigns(:total)
      total.should be_kind_of(MemberCount)
      total.total.should == 17
    end

    it 'assigns sub groups' do
      assigns(:sub_groups).should be_blank
    end

    it 'assigns details' do
      details = assigns(:details).to_a
      details.should have(3).items
      details[0].born_in.should == 1988
      details[1].born_in.should == 1997
      details[2].born_in.should == 1999
    end
  end

end
