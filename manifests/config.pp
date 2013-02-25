#------------------------------------------------------------------------------
# Class: libvirt::config
#
#   This class is part of the libvirt module.
#   You should not be calling this class.
#   The delegated class is Class['libvirt'].
#
#   Marc Villacorta <marc.villacorta@gmail.com>
#   2013-02-26
#
#------------------------------------------------------------------------------
class libvirt::config {

    # Collect variables:
    $templates = getvar("${module_name}::params::templates")
    $configs   = getvar("${module_name}::params::configs")

    # Install the configuration files:
    file { $configs[0]:
        ensure  => present,
        content => template("${templates}/libvirtd.conf.erb"),
        owner   => 'root',
        group   => 'root',
        mode    => '0644';
    }
}
