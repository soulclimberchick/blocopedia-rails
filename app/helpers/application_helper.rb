module ApplicationHelper

	def form_group_tag(errors, &block)
     css_class = 'form-group'
     css_class << ' has-error' if errors.any?
     content_tag :div, capture(&block), class: css_class
   end

	 def markdown(text)
		 renderer = Redcarpet::Render::HTML.new(hard_wrap:true, filter_html:true)
		 options = {
			 autolink: true,
			 fenced_code_blocks: true,
			 no_intra_emphasis: true,
			 strikethrough: true
		 }

    renderer = Redcarpet::Render::HTML.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions = {})

    markdown.render(text).html_safe
	end
end
