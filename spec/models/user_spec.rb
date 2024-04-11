require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録できない' do
      user = FactoryBot.build(:user)
      user.nickname = ''
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録できない' do
      user = FactoryBot.build(:user)
      user.email = ''
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end

    it 'パスワードが空では登録できない' do
      user = FactoryBot.build(:user)
      user.password = ''
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end

    it 'パスワード確認が空では登録できない' do
      user = FactoryBot.build(:user)
      user.password_confirmation = ''
      user.valid?
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'family_nameが空では登録できない' do
      user = FactoryBot.build(:user)
      user.family_name = ''
      user.valid?
      expect(user.errors.full_messages).to include("Family name can't be blank", 'Family name 全角文字を使用してください')
    end

    it 'first_nameが空では登録できない' do
      user = FactoryBot.build(:user)
      user.first_name = ''
      user.valid?
      expect(user.errors.full_messages).to include("First name can't be blank", 'First name 全角文字を使用してください')
    end

    it 'family_name_readingが空では登録できない' do
      user = FactoryBot.build(:user)
      user.family_name_reading = ''
      user.valid?
      expect(user.errors.full_messages).to include("Family name reading can't be blank", 'Family name reading 全角文字を使用してください')
    end

    it 'first_name_readingが空では登録できない' do
      user = FactoryBot.build(:user)
      user.first_name_reading = ''
      user.valid?
      expect(user.errors.full_messages).to include("First name reading can't be blank", 'First name reading 全角文字を使用してください')
    end

    it 'birthdayが空では登録できない' do
      user = FactoryBot.build(:user)
      user.birthday = ''
      user.valid?
      expect(user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
