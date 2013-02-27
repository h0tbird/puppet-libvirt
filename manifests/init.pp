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

    $ensure                     = undef,
    $version                    = undef,
    $listen_tls                 = undef,
    $listen_tcp                 = undef,
    $tls_port                   = undef,
    $tcp_port                   = undef,
    $listen_addr                = undef,
    $mdns_adv                   = undef,
    $mdns_name                  = undef,
    $unix_sock_group            = undef,
    $unix_sock_ro_perms         = undef,
    $unix_sock_rw_perms         = undef,
    $unix_sock_dir              = undef,
    $auth_unix_ro               = undef,
    $auth_unix_rw               = undef,
    $auth_tcp                   = undef,
    $auth_tls                   = undef,
    $key_file                   = undef,
    $cert_file                  = undef,
    $ca_file                    = undef,
    $crl_file                   = undef,
    $tls_no_sanity_certificate  = undef,
    $tls_no_verify_certificate  = undef,
    $tls_allowed_dn_list        = undef,
    $sasl_allowed_username_list = undef,
    $max_clients                = undef,
    $min_workers                = undef,
    $max_workers                = undef,
    $prio_workers               = undef,
    $max_requests               = undef,
    $max_client_requests        = undef,
    $log_level                  = undef,
    $log_filters                = undef,
    $log_outputs                = undef,
    $log_buffer_size            = undef,
    $audit_level                = undef,
    $audit_logging              = undef,
    $host_uuid                  = undef,
    $keepalive_interval         = undef,
    $keepalive_count            = undef,
    $keepalive_required         = undef,

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
