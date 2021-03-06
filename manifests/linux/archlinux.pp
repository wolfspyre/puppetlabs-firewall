#
#This class manages iptables on archlinux
class firewall::linux::archlinux (
  $ensure = 'running',
  $enable = true
) {
  service { 'iptables':
    ensure    => $ensure,
    enable    => $enable,
    hasstatus => true,
  }

  service { 'ip6tables':
    ensure    => $ensure,
    enable    => $enable,
    hasstatus => true,
  }

  file { '/etc/iptables/iptables.rules':
    ensure => present,
    before => Service['iptables'],
  }

  file { '/etc/iptables/ip6tables.rules':
    ensure => present,
    before => Service['ip6tables'],
  }
}
