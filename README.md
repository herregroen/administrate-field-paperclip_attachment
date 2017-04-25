# Administrate::Field::PaperclipImage

Adds a Paperclip Attachment field to [Administrate] based on an [Paperclip] attachment.

Includes a Rails initializer to add has_destroyable_file to your model.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'administrate-field-paperclip_attachment', git: 'git@git.noxqsapp.nl:gems/administrate-field-paperclip_attachment.git'
```

And then execute:

    $ bundle

## Usage

In your Dashboard:
```ruby
  ATTRIBUTE_TYPES = {
    image: Field::PaperclipImage,
  }.freeze
```

Available options:
- accept_types (default: `['image/*']`)

    Used for the file input to determine which filter is active.
- show_missing (default: `true`)

    When there is no image. Either show the Paperclip missing image or nothing.
- page_styles (default: `{ index: :thumbnail, show: :medium, form: :medium }`)

    Used to determine which attachment style to use on which page.
    Checks if it actually exists and falls back to the original image.
- cropper (default: `false`)

    Used to determine if an image cropper tool should be made available or to use uploaded images as they are.
- aspect_ratio (default: `nil`)

    Used to determine if the image cropper tool should force a certain aspect ratio.

## Usage with image destroy

In your Dashboard:
```ruby
  ATTRIBUTE_TYPES = {
    image: Field::PaperclipAttachment,
    image_delete: Field::Boolean,
    file: Field::PaperclipAttachment.with_options(is_image: false),
    file_delete: Field::Boolean
  }.freeze

  FORM_ATTRIBUTES = [
    :image,
    :image_delete,
    :file,
    :file_delete
  ].freeze
```

In your model:
```ruby
has_destroyable_file :image
```

[Administrate]: https://github.com/thoughtbot/administrate
[Paperclip]: https://github.com/thoughtbot/paperclip
