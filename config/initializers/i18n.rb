I18n::Backend::Simple.send(:include, I18n::Backend::Fallbacks)
I18n.default_locale = :et
I18n.available_locales = [:en, :et, :ru]
I18n.fallbacks[:en] = [:en, :et, :ru] 
I18n.fallbacks[:et] = [:et, :en, :ru]
I18n.fallbacks[:ru] = [:ru, :en, :et]
Globalize.fallbacks = {:en => [:en, :et, :ru], :et => [:et, :en, :ru], :ru => [:ru, :en, :et]}