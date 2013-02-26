#------------------------------------------------------------------------------
# Class: libvirt
#
#   This module manages the libvirt service.
#
#   Marc Villacorta <marc.villacorta@gmail.com>
#   2013-02-26
#
#   Tested platforms:
#       - CentOS 6
#
# Parameters:
#
# Actions:
#
#   Installs, configures and manages the libvirt service.
#
# Sample Usage:
#
#   include libvirt
#
#   or
#
#   class { 'libvirt': }
#
#   or
#
#   class { 'libvirt':
#       ensure  => running,
#       version => present,
#   }
#
#------------------------------------------------------------------------------
class libvirt (

    $ensure   = undef,
    $version  = undef,
    $mdns_adv = undef,

) {

    # Validate parameters:
    validate_re($ensure, '^running$|^stopped$')
    validate_re($version, '^present$|^latest$')

    # Register this module:
    if defined(Class['motd']) { motd::register { $module_name: } }

    # Set the requirements:
    anchor { "${module_name}::begin":   } ->
    class  { "${module_name}::params":  } ->
    class  { "${module_name}::install": } ->
    class  { "${module_name}::config":  } ~>
    class  { "${module_name}::service": } ->
    anchor { "${module_name}::end":     }
}
