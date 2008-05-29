#
# tftp module
#
# Copyright 2008, Puzzle ITC GmbH
# Marcel Härry haerry+puppet(at)puzzle.ch
# Simon Josi josi+puppet(at)puzzle.ch
#
# This program is free software; you can redistribute 
# it and/or modify it under the terms of the GNU 
# General Public License version 3 as published by 
# the Free Software Foundation.
#

class tftp {

    package { 'tftp-server':
        ensure => 'present',
    }

    file { '/etc/xinetd.d/tftp':
        source => [ "puppet://$server/tftp/tftp.xinetd.$operatingsystem",
                    "puppet://$server/tftp/tftp.xinetd" ],
        require => Package['tftp-server'],
        owner => root, group => 0, mode => '0644';
    }

}
