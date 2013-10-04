# Define: openvpn::conftemplate
#
# Wrapper around openvpn::conf which uses a template included in the module,
# useful for simple shared key VPN links.
#
define openvpn::conftemplate (
  $dir = '/etc/openvpn',
  # Template options
  $dev,
  $remote,
  $float = false,
  $ipaddress_local = $ipaddress,
  $ipaddress_remote,
  $routes = [],
  $secret,
  $keepalive = false,
  $keepalive_ping_interval = 10,
  $keepalive_ping_timeout = 120,
  $port = '1194'
) {

  openvpn::conf { $title:
    dir     => $dir,
    content => template('openvpn/default.conf.erb'),
    # The secret file referenced, which already requires the parent dir
    require => File["${dir}/${secret}"],
  }

}

