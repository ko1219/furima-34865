require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    it '必須項目が全て記入されていれば登録できる' do
      expect(@user).to be_valid
    end
    it 'passwordとpassword_confirmationが英数字混同の6文字以上であれば登録できる'do
      @user.password = 'kk0000'
      @user.password_confirmation = 'kk0000'
      expect(@user).to be_valid
    end
    it 'first_name,last_nameが全角のひらがな・カタカナ・漢字なら登録できる'do
      @user.first_name = "太郎"
      @user.last_name = "やまだ"
      expect(@user).to be_valid
    end
    it 'first_name_kana,last_name_kanaがカタカナ全角なら登録できる'do
      @user.first_name_kana = "タロウ"
      @user.last_name_kana = "ヤマダ"
      expect(@user).to be_valid
    end

    it 'nicknameが空では登録できない' do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it '重複したemailが存在する場合登録できないこと' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'passwordが空では登録できない' do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordが5文字以下であれば登録できないこと' do
      @user.password = '12345'
      @user.password_confirmation = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'passwordには英字と数字の両方を含めなければ登録できない' do
      @user.password = "aaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
    end
    it 'passwordとpassword_confirmationが不一致では登録できないこと' do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'first_nameが空では登録できない' do
      @user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it 'first_nameは全角のひらがな・カタカナ・漢字以外では登録できない' do
      @user.first_name = "ぁぁぁぁaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name には全角文字を使用してください")
    end
    it 'last_nameが空では登録できない' do
      @user.last_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it 'last_nameには全角のひらがな・カタカナ・漢字以外では登録できない' do
      @user.last_name = "ぁぁkkllla"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name には全角文字を使用してください")
    end
    it 'first_name_kanaが空では登録できない' do
      @user.first_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it 'first_name_kanaにはカタカナ全角以外では登録できない' do
      @user.first_name_kana = "あいうえお"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana には全角文字を使用してください")
    end
    it 'last_name_kanaにはカタカナ全角以外では登録できない' do
      @user.last_name_kana = "山田"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana には全角文字を使用してください")
    end
    it 'last_name_kanaが空では登録できない' do
      @user.last_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end
    it 'birthdayが空では登録できない' do
      @user.birthday = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
  describe 'ユーザーログイン' do
    it 'password,emailが記入されていればログインできる' do
      expect(@user).to be_valid
    end
    it 'passwordが空だとログインできない'do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Invalid Email or password.
        ")
    end
    it 'emailが空だとログインできない'do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Invalid Email or password.
        ")
    end
  end
end
