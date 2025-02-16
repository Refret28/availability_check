#!/usr/bin/perl

use strict;
use warnings;
use Net::Ping;
use IO::Socket::INET;

# Функция для проверки доступности ping (ICMP)
sub check_ping {
    my ($host) = @_;

    my $pinger = Net::Ping->new('icmp');
    $pinger->hires(); 

    if ($pinger->ping($host)) {
        print "ICMP: Host $host is reachable via ping\n";
    } else {
        print "ICMP: Host $host is NOT reachable via ping\n";
    }

    $pinger->close();
}

# Функция для проверки доступности TCP порта
sub check_tcp_port {
    my ($host, $port) = @_;

    my $socket = IO::Socket::INET->new(
        PeerAddr => $host,
        PeerPort => $port,
        Proto    => "tcp",
        Timeout  => 5
    );

    if ($socket) {
        print "TCP: Connection to $host:$port is successful\n";
        $socket->close();
    } else {
        print "TCP: Host $host:$port is not reachable\n";
    }
}

print "Enter an IP address or hostname: ";
chomp(my $host = <STDIN>);

print "Enter a port to check TCP availability (or press Enter to skip): ";
chomp(my $port = <STDIN>);

# Проверка доступности ICMP
check_ping($host);

# Если порт указан, проверяем доступность TCP
if ($port) {
    check_tcp_port($host, $port);
}
