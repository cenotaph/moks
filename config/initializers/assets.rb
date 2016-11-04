Rails.application.config.assets.version = '1.0'
Rails.application.config.assets.precompile += %w( ckeditor/* )
Rails.application.config.assets.precompile += Ckeditor.assets
Rails.application.config.assets.paths << Rails.root.join('app', 'assets', 'fonts')
Rails.application.config.assets.precompile += %w(soundmanager2.swf soundmanager2_flash9.swf)
Rails.application.config.assets.precompile += %w( .svg .eot .woff .ttf )
Rails.application.config.assets.precompile += %w(  jquery.collapsible-menus.min.js)

Rails.application.config.assets.precompile += %w{ admin.css }