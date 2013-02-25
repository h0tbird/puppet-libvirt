#------------------------------------------------------------------------------
# Class: libvirt::install
#
#   This class is part of the libvirt module.
#   You should not be calling this class.
#   The delegated class is Class['libvirt'].
#
#   Marc Villacorta <marc.villacorta@gmail.com>
#   2013-02-26
#
#------------------------------------------------------------------------------
class libvirt::install {

    # Collect variables:
    $version  = getvar("${module_name}::version")
    $packages = getvar("${module_name}::params::packages")

    # Install the package/s:
    package { $packages: ensure => $version }
}
