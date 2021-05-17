class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search

  def set_search
    # 検索オブジェクト
    @search = PostItem.page(params[:page]).order(id: "DESC").per(6).ransack(params[:q])
    # 検索結果
    @post_items = @search.result
  end

  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admin_top_path          #pathは設定したい遷移先へのpathを指定してください
    when Customer
      root_path              #ここもpathはご自由に変更してください
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

end