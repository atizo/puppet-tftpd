#
# tftp module
#
# Copyright 2008, Puzzle ITC GmbH
# Marcel Härry haerry+puppet(at)puzzle.ch
# Simon Josi josi+puppet(at)puzzle.ch
# Copyright 2011, Atizo AG
# Simon Josi simon.josi+puppet(at)atizo.com
#
# This program is free software; you can redistribute 
# it and/or modify it under the terms of the GNU 
# General Public License version 3 as published by 
# the Free Software Foundation.
#

class tftpd {
  package{'tftp-server':
    ensure => present,
  }
  file{'/etc/xinetd.d/tftpd':
    source => [
        "puppet://$server/tftpd/tftp.xinetd.$operatingsystem",
        "puppet://$server/tftpd/tftp.xinetd",
    ],
    require => Package['tftp-server'],
    owner => root, group => 0, mode => 0644;
  }
}
