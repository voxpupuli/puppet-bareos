# frozen_string_literal: true

configure_beaker do |host|
  install_module_from_forge_on(host, 'puppetlabs/postgresql', '> 8 < 9')
end
