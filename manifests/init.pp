#######################################
# tftp module
# Puzzle ITC - haerry+puppet(at)puzzle.ch
# GPLv3
#######################################

class tftp {

    package { 'tftp-server':
        ensure => 'present',
    }

    file { '/etc/xinetd.d/tftp':
        source => [ "server/tftp/tftp.xinetd.$operatingsystem",
                    "puppet://$server/tftp/tftp.xinetd" ],
        require => Package['tftp-server']
        owner => root, group => 0, mode => '0644';
    }

}
