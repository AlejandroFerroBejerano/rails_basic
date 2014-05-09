module ApplicationHelper
  # -- Layout
  def draw_page_title
    t('site.name')
  end

  def draw_page_title_for namespace
    [namespace.downcase.capitalize, draw_page_title].join(': ')
  end

  # -- Routes
  def nav_item_class(path, exact = false)
    draw_active_inactive nav_item_active?(path, exact)
  end

  def nav_item_active?(path, exact = false)
    current_page?(path) || (exact ? current_path?(path) : current_controller?(path))
  end

  def current_controller?(path)
    recognize_path(path)[:controller].include?(params[:controller])
  end

  def current_controller_by_name?(controller)
    controller == params[:controller]
  end

  def current_action_by_name?(action)
    action == params[:action]
  end

  def current_action?(path)
    recognize_path(path)[:action].include?(params[:action])
  end

  def current_controller_and_action?(path)
    current_controller_by_name?(path[:controller]) &&
      current_action_by_name?(path[:action])
  end

  def current_path?(path)
    recognize_path(path) == params
  end

  def root_path?
    url_for(current_path) == root_path
  end

  def current_controller
    current_path[:controller].humanize if current_path.present?
  end

  def current_action
    current_path[:action].humanize if current_path.present?
  end

  def current_path
    recognize_path(request.fullpath) if request.present?
  end

  def default_namespace?
    !(current_namespace.in? application_namespaces)
  end

  # -- Dates
  def relative_time_in_words datetime
    t('shared.messages.time_ago',
      :value => distance_of_time_in_words_to_now(datetime))
  end

  # -- Validation
  def draw_errors(model)
    if model.errors.any?
      messages = ''

      model.errors.full_messages.each do |msg|
        messages << "<li>#{msg}</li>"
      end

      output = <<-EOS
      <div class=\"alert alert-error\">
        <ul>
      #{messages}
        </ul>
      </div>
      EOS

      output.html_safe
    end
  end

  # -- User control
  def draw_yesno(bool, format = :text)
    case format
    when :text then
      yes, no = t('shared.yes'), t('shared.no')
    when :icon then
      yes, no = draw_button_icon('ok'), draw_button_icon('remove')
    end

    bool ? yes : no
  end

  def draw_active_inactive(bool, format = nil)
    bool ? 'active' : 'inactive'
  end

  def to_arrow(direction)
    case direction
    when 'left'    then '&larr;'.html_safe
    when 'right'   then '&rarr;'.html_safe
    when 'top'     then '&uarr;'.html_safe
    when 'up'      then '&uarr;'.html_safe
    when 'bottom'  then '&darr;'.html_safe
    when 'down'    then '&darr;'.html_safe
    when 'both'    then '&harr;'.html_safe
    else ''
    end
  end

  def draw_arrow(value, direction = 'right')
    [value, to_arrow(direction)].join(' ').html_safe
  end

  def draw_label(value, type = 'info')
    draw_indicator('label', value, type)
  end

  def draw_badge(value, type = 'info')
    draw_indicator('badge', value, type)
  end

  def draw_indicator(style, value = " ".html_safe, type = 'info')
    "<span class=\"#{style} #{style}-#{type}\">#{value}</span>".html_safe
  end

  def draw_button_icon(style, value = nil, color = 'black', align = 'left')
    style = style.to_s.sub('icon-', '')

    markup = case align
             when 'left' then "<i class=\"icon-#{style} icon-#{color}\"></i> #{value}"
             when 'right' then "#{value} <i class=\"icon-#{style} icon-#{color}\"></i>"
             else nil
             end

    markup.html_safe
  end

  def draw_progress(value, options = {})
    base_options = {
      :striped => false,
      :active  => false,
      :danger  => false,
      :warning => false
    }

    options.reverse_merge! base_options

    bar = content_tag(:div, '', { :class => 'bar', :style => "width: #{value.to_i}%;" })
    bar_class = ['progress', 'draw_progress']

    bar_class << 'progress-success' if value == 100
    bar_class << 'progress-striped' if options[:striped]
    bar_class << 'progress-danger'  if options[:danger]
    bar_class << 'progress-warning' if options[:warning]
    bar_class << 'active'           if options[:active]

    content_tag(:div, bar, { :class => bar_class })
  end

  def draw_stars(value, options = {})
    base_options = {
      :max => 5
    }

    options.reverse_merge! base_options

    markup = []

    markup = markup.concat(value.to_i.times.map { draw_button_icon('icon-star') })
    markup = markup.concat((options[:max].to_i - value.to_i).times.map { draw_button_icon('icon-star-empty') })

    content_tag :div, markup.join.html_safe, :class => 'draw_stars'
  end

  def draw_close_button(clearfix = true)
    button = content_tag :button, '×', :class => 'close', 'type' => 'button', 'data-dismiss' => 'alert'
    clearfix = content_tag :div, '', :class => 'clearfix'

    clearfix ? button + clearfix : button
  end

  def draw_back_button
    draw_button_list({ 'arrow-left' => :back }, { :class => 'btn btn-link btn-large' })
  end

  def draw_button_list(options={}, html_options={})
    markup = []
    default_options = { :class => 'btn' }

    options.each_pair do |icon, path|
      icon = draw_button_icon(icon)

      link = link_to(icon, path, default_options.merge(html_options))

      markup << link
    end

    markup.join.html_safe
  end

  def draw_breadcrumbs
    items = []
    divider = content_tag(:span, '/', { :class => 'divider' })

    if defined? @breadcrumbs
      items << @breadcrumbs.map { |item| content_tag(:li, link_to(item.name, item.target)) }

      content_tag(:ul, items.join(divider), { :class => 'breadcrumb' }, false).html_safe
    end
  end

  def draw_nested_index(tree)
    markup = []

    tree.map do |element, sub_element|
      markup << content_tag(:div, render(element), :class => 'nested_item', :id => element.entry_name)
      markup << content_tag(:div, draw_nested_index(sub_element), :class => 'nested_block') if sub_element.present?
    end

    content_tag :div, markup.join.html_safe, :class => 'nested_index'
  end

  def draw_nested_list(tree, current = nil)
    markup = []

    tree.map do |element, sub_element|
      markup << render(element, :hide_actions => true, :current => current)
      markup << content_tag(:ul, draw_nested_list(sub_element), :class => 'nested_block') if sub_element.present?
    end

    content_tag :li, markup.join.html_safe, :class => 'nested_list'
  end

  def draw_list(items, current = nil)
    markup = []

    items.map do |item|
      element_class  = 'active' if (current && current.to_param == item.to_param)
      element_render = render(item, :hide_actions => true)

      markup << content_tag(:li, element_render.html_safe, :class => element_class)
    end

    markup.join.html_safe
  end

  def draw_dropdown_menu(tree, options = {})
    has_sub_element = false
    markup = []

    tree.map do |element, sub_element|
      item_markup = []

      item_markup << render(options[:render], options[:locals].merge({ :resource => element }))

      if sub_element.present?
        has_sub_element = true

        item_markup << content_tag(:ul, draw_dropdown_menu(sub_element, options), :class => 'dropdown-menu')
      end

      markup << content_tag(:li, item_markup.join.html_safe, :class => ('dropdown-submenu' if has_sub_element))
    end

    markup.join.html_safe
  end

  def draw_notice
    content_tag :p, notice, :class => 'alert alert-warning', :id => 'notice' if notice.present?
  end

  def draw_alert
    content_tag :p, alert, :class => 'alert alert-error', :id => 'alert' if alert.present?
  end

  def nbsp
    "&nbsp;".html_safe
  end

  # -- Text
  def transliterate(string)
    ActiveSupport::Inflector.transliterate(string)
  end

  def unparameterize(string)
    string.gsub('-', ' ').humanize
  end

  def normalize_date(date)
    date.utc.strftime("%Y-%m-%dT%H:%M:%S+00:00")
  end

  def sprite_tag(name, alt='')
    image_tag('s.gif', :class => name, alt: alt)
  end

  private

  def recognize_path(path)
    Rails.application.routes.recognize_path(path)
  end

  def application_namespaces
    ['admin']
  end

  def current_namespace
    return namespace if defined?(namespace)

    namespace = current_path[:controller].split('/').first if current_path.present?

    return namespace if namespace.in?(application_namespaces)
  end
end
