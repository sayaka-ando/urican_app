require 'rails_helper'

RSpec.describe Plan, type: :model do
  before do
    @plan = FactoryBot.build(:plan)
  end

  describe 'プラン投稿' do
    context 'プラン投稿がうまく行く時' do
      it 'プラン名、顧客名、金額、顧客ステータス、提案ステータスが全て入力されてる時' do
        expect(@plan).to be_valid
      end

      it 'メモがなくても投稿できる' do
        @plan.memo = nil
        expect(@plan).to be_valid
      end

      it 'ナレッジがなくても投稿できる' do
        @plan.knowledge = nil
        expect(@plan).to be_valid
      end

    end

    context 'プラン投稿がうまく行かない時' do
      it 'プラン名がないと投稿できない' do
        @plan.title = nil
        @plan.valid?
        expect(@plan.errors.full_messages).to include("Title can't be blank")
      end

      it '顧客名がないと投稿できない' do
        @plan.client = nil
        @plan.valid?
        expect(@plan.errors.full_messages).to include("Client can't be blank")
      end

      it '金額がないと投稿できない' do
        @plan.price = nil
        @plan.valid?
        expect(@plan.errors.full_messages).to include("Price can't be blank", "Price is invalid")
      end

      it '金額が半角数字でないと投稿できない' do
        @plan.price = '３００００'
        @plan.valid?
        expect(@plan.errors.full_messages).to include("Price is not a number")
      end

      it '顧客ステータスがないと投稿できない' do
        @plan.client_status_id = nil
        @plan.valid?
        expect(@plan.errors.full_messages).to include("Client status can't be blank", "Client status is not a number")
      end

      it '顧客ステータスが1の時は投稿できない' do
        @plan.client_status_id = 1
        @plan.valid?
        expect(@plan.errors.full_messages).to include("Client status must be other than 1")
      end

      it '提案ステータスがないと投稿できない' do
        @plan.sales_status_id = nil
        @plan.valid?
        expect(@plan.errors.full_messages).to include("Sales status can't be blank", "Sales status is not a number")
      end

      it '提案ステータスが1の時は投稿できない' do
        @plan.sales_status_id = 1
        @plan.valid?
        expect(@plan.errors.full_messages).to include("Sales status must be other than 1")
      end

    end
  end
end
