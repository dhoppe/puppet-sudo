class sudo::params {
  case $::lsbdistcodename {
    'lenny': {
      $admins  = hiera('admin')
      $content = undef
      $source  = [
        "puppet:///modules/sudo/${::lsbdistcodename}/${::hostname}/etc/sudoers",
        "puppet:///modules/sudo/${::lsbdistcodename}/common/etc/sudoers"
      ]
    }
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