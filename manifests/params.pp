#------------------------------------------------------------------------------
# Class: libvirt::params
#
#   This class is part of the libvirt module.
#   You should not be calling this class.
#   The delegated class is Class['libvirt'].
#
#   Marc Villacorta <marc.villacorta@gmail.com>
#   2013-02-26
#
#------------------------------------------------------------------------------
class libvirt::params {

    # Set location for files and templates:
    $files     = "puppet:///modules/${module_name}/${operatingsystem}"
    $templates = "${module_name}/${operatingsystem}"

    # Set OS specifics:
    case $osfamily {

        'RedHat': {
            $packages = ['libvirt']
            $configs  = ['/etc/libvirt/libvirtd.conf']
            $services = ['libvirtd']
        }

        default: { fail("${module_name}::params ${osfamily} family is not supported yet.") }
    }
}
