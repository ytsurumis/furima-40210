require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'emailが重複していると登録できない' do
      user1 = FactoryBot.build(:user)
      user2 = FactoryBot.build(:user)
      user2.email = user1.email
      user2.valid?
      expect(user2.errors.full_messages).to include("Family name 全角文字を使用してください", "First name 全角文字を使用してください", "Family name reading 全角文字を使用してください", "First name reading 全角文字を使用してください")
    end

    it 'emailに@が含まれないと登録できない' do
      user = FactoryBot.build(:user,email:"testmail.com")
      user.valid?
      expect(user.errors.full_messages).to include("Email is invalid")
    end

    it 'パスワードが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'パスワード確認が空では登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'パスワードは5文字以下では登録できない' do
      @user.password = '00000'
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)", "Family name 全角文字を使用してください", "First name 全角文字を使用してください", "Family name reading 全角文字を使用してください", "First name reading 全角文字を使用してください")
    end

    it 'パスワードとパスワード（確認）が一致しないと登録できない' do
      user = FactoryBot.build(:user,password: "password123",password_confirmation: "password456")
      user.valid?
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'family_nameが空では登録できない' do
      @user.family_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank", 'Family name 全角文字を使用してください')
    end

    it 'family_nameは全角文字を使用してください' do
      user = FactoryBot.build(:user, family_name: "aaa")
      user.valid?
      expect(user.errors.full_messages).to include("Family name 全角文字を使用してください", "First name 全角文字を使用してください", "Family name reading 全角文字を使用してください", "First name reading 全角文字を使用してください")
    end

    it 'first_nameが空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank", 'First name 全角文字を使用してください')
    end

    it 'first_nameは全角文字を使用してください' do
      user = FactoryBot.build(:user, first_name: "bbb")
      user.valid?
      expect(user.errors.full_messages).to include("Family name 全角文字を使用してください", "First name 全角文字を使用してください", "Family name reading 全角文字を使用してください", "First name reading 全角文字を使用してください")
    end

    it 'family_name_readingが空では登録できない' do
      @user.family_name_reading = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name reading can't be blank", 'Family name reading 全角文字を使用してください')
    end

    it 'family_name_readingは全角文字を使用してください' do
      user = FactoryBot.build(:user, family_name_reading: "ccc")
      user.valid?
      expect(user.errors.full_messages).to include("Family name 全角文字を使用してください", "First name 全角文字を使用してください", "Family name reading 全角文字を使用してください", "First name reading 全角文字を使用してください")
    end

    it 'first_name_readingが空では登録できない' do
      @user.first_name_reading = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name reading can't be blank", 'First name reading 全角文字を使用してください')
    end

    it 'first_name_readingは全角文字を使用してください' do
      user = FactoryBot.build(:user, first_name_reading: "ddd")
      user.valid?
      expect(user.errors.full_messages).to include("Family name 全角文字を使用してください", "First name 全角文字を使用してください", "Family name reading 全角文字を使用してください", "First name reading 全角文字を使用してください")
    end

    it 'birthdayが空では登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
