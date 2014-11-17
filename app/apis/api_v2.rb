class ApiV2 < Grape::API

  format :json

  before do
    I18n.locale = params[:locale] || "zh-CN" #if I18n.locale_available?(params[:locale])
  end

  helpers ProductsHelper


  version :v2

  mount V2::ProductsApi

  add_swagger_documentation api_version: "v2", markdown: true

end
