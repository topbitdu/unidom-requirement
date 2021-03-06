module Unidom
  module Requirement

    class Engine < ::Rails::Engine

      include Unidom::Common::EngineExtension

      isolate_namespace Unidom::Requirement

      enable_initializer enum_enabled: false, migration_enabled: true

    end

  end
end
