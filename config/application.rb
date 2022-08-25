require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module NaganoCake
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")


    # デフォルトのロケールを日本(ja)に設定
    config.i18n.default_locale = :ja
    # enumの英語表記を日本語化
    config.i18n.load_path += Dir[Rails.root.join('config/locales/*.yml').to_s]

    # タイムゾーンを日本時間に設定
    config.time_zone = 'Asia/Tokyo'

    # バリデーションエラー時のレイアウト崩れ防止
    config.action_view.field_error_proc = Proc.new { |html_tag, instance| html_tag }
  end
end
