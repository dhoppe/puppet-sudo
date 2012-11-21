class sudo::params {
  case $::lsbdistcodename {
    'squeeze', 'maverick', 'natty': {
      $admins  = hiera('admin')
      $content = template("sudo/${::lsbdistcodename}/etc/sudoers.erb")
      $source  = undef
    }
    default: {
      fail("Module ${module_name} does not support ${::lsbdistcodename}")
    }
  }
}
