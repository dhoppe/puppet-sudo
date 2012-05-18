class sudo::params {
  case $::lsbdistcodename {
    'lenny': {
      $source = [
        "puppet:///modules/sudo/${::lsbdistcodename}/${::hostname}/etc/sudoers",
        "puppet:///modules/sudo/${::lsbdistcodename}/common/etc/sudoers"
      ]
    }
    'squeeze', 'maverick', 'natty': {
      $source = "puppet:///modules/sudo/${::lsbdistcodename}/etc/sudoers"
    }
    default: {
      fail("Module ${module_name} does not support ${::lsbdistcodename}")
    }
  }
}