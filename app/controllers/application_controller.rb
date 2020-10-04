class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  end
end
# deviseのストロングパラメータはapplicationコントローラーに記述
# devise_parameter_sanitizerメソッド
# フォームから送られてきたパラメータを取得するための記述
# ユーザー情報に関するパラメーターを制限するストロングパラメーターは、deviseのGem内に記述されているため、編集することはできません。

# configure:〈システムなど〉を(周辺機器で)構成する, 配列する; 環境設定する.
# sanitize: 1 (不快のもとを取り除き)〈話の内容など〉を和らげる, 心地よくする.
# 2 〈物〉を衛生的にする.
# permit: 〜を許可する

# 第一引数はdeviseですでに設定されているsign_in, sign_up, account_updateが使用でき、それぞれサインイン時や新規登録、アカウント情報更新の処理に対応しています。

#形で覚える