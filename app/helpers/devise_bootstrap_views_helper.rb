# -*- encoding : utf-8 -*-

module DeviseBootstrapViewsHelper
  def bootstrap_devise_error_messages!
    return '' if resource.errors.empty?

    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    sentence = I18n.t('errors.messages.not_saved',
      count: resource.errors.count,
      resource: resource.class.model_name.human.downcase)

    html = <<-HTML
    <div class="alert alert-danger alert-block devise-bs">
      <button type="button" class="close" data-dismiss="alert">&times;</button>
      <h5>#{sentence}</h5>
      <ul>#{messages}</ul>
    </div>
    HTML

    html.html_safe
  end

  def devise_login_error_messages!
    flash_alerts = []
    error_key = 'errors.messages.not_saved'
    if !flash.empty?
      flash_alerts.push(flash[:error]) if flash[:error]
      flash_alerts.push(flash[:alert]) if flash[:alert]
      flash_alerts.push(flash[:notice]) if flash[:notice]
    end

    return "" if resource.errors.empty? && flash_alerts.empty?
    errors = resource.errors.empty? ? flash_alerts : resource.errors.full_messages

    messages = errors.map { |msg| content_tag(:li, msg) }.join
    sentence = I18n.t(error_key, :count    => errors.count,
                                 :resource => resource.class.model_name.human.downcase)

    html = <<-HTML
    <div class="alert alert-danger alert-block devise-bs">
      <button type="button" class="close" data-dismiss="alert">&times;</button>
      <h5>#{sentence}</h5>
      <ul>#{messages}</ul>
    </div>
    HTML

    html.html_safe
  end
end
