require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    context '新規登録がうまくいく時' do
      it '名前、メールアドレス、パスワード、社員番号が入力されていると登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかない時' do
      it 'メールアドレスが空だと登録できない' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'メールアドレスが一意性であること' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'メールアドレスは、@を含む必要があること' do
        @user.email = 'aaaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'パスワードが必須であること' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'パスワードは、6文字以上での入力が必須であること' do
        @user.password = 'aa00'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'パスワードは、半角英字のみでは登録できないこと' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it 'パスワードは、半角数字のみでは登録できないこと' do
        @user.password = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it 'パスワードは、全角では登録できないこと' do
        @user.password = '０００ａｂｃ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it 'パスワードは、確認用を含めて2回入力すること' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'パスワードとパスワード（確認用）、値の一致が必須であること' do
        @user.password_confirmation = @user.password + 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'ユーザー名ないと登録できない' do
        @user.name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end

      it '社員番号が必須であること' do
        @user.employee_number = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Employee number can't be blank", "Employee number is invalid")
      end

      it '社員番号が4文字より多いと登録できないこと' do
        @user.employee_number = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include("Employee number is invalid")
      end

      it '社員番号が4文字より小さいと登録できないこと' do
        @user.employee_number = '123'
        @user.valid?
        expect(@user.errors.full_messages).to include("Employee number is invalid")
      end

      it '社員番号が一意性であること' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.employee_number = @user.employee_number
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Employee number has already been taken")
      end


    end
  end
end
