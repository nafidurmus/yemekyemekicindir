module ApplicationHelper
	require 'redcarpet'
	require 'redcarpet/render_strip'

	class CodeRayify < Redcarpet::Render::HTML
		def block_code(code, language)
		  CodeRay.scan(code,language).div
		end
	end

	def markdown(text)
	    options = {
	      filter_html:     true,
	      hard_wrap:       true,
	      link_attributes: { rel: 'nofollow', target: "_blank" },
	      space_after_headers: true,
	      fenced_code_blocks: true
	    }

	    extensions = {
	      autolink:           true,
	      superscript:        true,
	      disable_indented_code_blocks: true
	    }

	    renderer = Redcarpet::Render::HTML.new(options)
	    markdown = Redcarpet::Markdown.new(renderer, extensions)

	    markdown.render(text).html_safe
	  end

	def strip_markdown(text)
		markdown_to_plain_text = Redcarpet::Markdown.new(Redcarpet::Render::StripDown)
		markdown_to_plain_text.render(text).html_safe
	end
end
