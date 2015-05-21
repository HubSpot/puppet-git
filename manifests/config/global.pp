# Public: Set a global git configuration value.
#
# namevar - The String name of the configuration option.
# value   - The String value of the configuration option.
#
# Examples
#
#   git::config::global { 'user.name':
#     value => 'Hugh Bot',
#   }
#
#   git::config::global { 'user.email':
#     value => 'test@example.com',
#   }
define git::config::global($value, $force = true) {
  exec { "set ${name} to ${value}":
    command => "git config --global --unset-all ${name}; git config --global --add ${name} ${value}",
    onlyif  => "sh -c '! (git config --global --get ${name}) || ${force}'",
  }
}
