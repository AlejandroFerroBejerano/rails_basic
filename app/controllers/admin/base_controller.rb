class Admin::BaseController < ApplicationController
  before_filter :authenticate_admin!
  before_filter :set_locale

  layout 'admin'

  private

  def set_locale
    @locale = I18n.locale = :en
  end
end
