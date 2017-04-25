require "administrate/field/base"
require "paperclip"
require "rails"

module Administrate
  module Field
    class PaperclipAttachment < Administrate::Field::Base
      VERSION = "0.0.4"

      class Engine < ::Rails::Engine
        initializer "paperclip_attachment.assets" do |app|
          app.config.assets.precompile += %w( administrate-field-paperclip_attachment/application.js administrate-field-paperclip_attachment/application.scss )
          Administrate::Engine.add_javascript "administrate-field-paperclip_attachment/application"
          Administrate::Engine.add_stylesheet "administrate-field-paperclip_attachment/application"
        end
      end

      def accept_types
        @_accept_types ||= options.fetch :accept_types, ['image/*']
      end

      def show_missing
        @_show_missing ||= options.fetch :show_missing, true
      end

      def page_styles
        @_page_styles ||= options.fetch :page_styles, { index: :thumbnail, show: :medium, form: :medium }
      end

      def is_image
        @_is_image ||= options.fetch :is_image, true
      end

      def cropper
        @_cropper ||= options.fetch :cropper, false
      end

      def aspect_ratio
        @_aspect_ratio ||= options.fetch :aspect_ratio, nil
      end

      def url style=nil
        return data.url(style.to_sym)  if style and data.styles.key?(style.to_sym)
        data.url
      end

      def url_for page=:index
        url page_styles[page]
      end

      def to_s
        data
      end

      def show?
        show_missing or data.present?
      end
    end
  end
end
