#------------------------------------------------------------------------------
# Class: libvirt::service
#
#   This class is part of the libvirt module.
#   You should not be calling this class.
#   The delegated class is Class['libvirt'].
#
#   Marc Villacorta <marc.villacorta@gmail.com>
#   2013-02-26
#
#------------------------------------------------------------------------------
class libvirt::service {

    # Collect variables:
    $ensure   = getvar("${module_name}::ensure")
    $services = getvar("${module_name}::params::services")

    # Start or stop the service:
    service { $services:
        ensure  => $ensure,
        enable  => $ensure ? {
            'running' => true,
            'stopped' => false,
        }
    }
}
