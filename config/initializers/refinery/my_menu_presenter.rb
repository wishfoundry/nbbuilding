Refinery::Pages::MenuPresenter.class_eval do

	def to_html_for_foundation
		if roots.present?
			content_tag(list_tag, :class => 'left') do
				roots.each_with_index.inject(ActiveSupport::SafeBuffer.new) do |buffer, (item, index)|
					buffer << render_menu_item(item, index)
				end
			end
		end
	end

	def menu_item_css(menu_item, index)
		css = []

		css << selected_css if selected_item_or_descendant_item_selected?(menu_item)
		css << first_css if index == 0
		css << last_css if index == menu_item.shown_siblings.length
		css << ' has-dropdown' if  menu_item_children(menu_item).length > 0

		css.reject(&:blank?).presence
	end
end
