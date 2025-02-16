# Описание

Эта программа на языке Perl проверяет доступность удаленного компьютера в сети с использованием протоколов ICMP (ping) и TCP. Она позволяет пользователю вводить IP-адрес или доменное имя, а также опционально проверять доступность определенного TCP порта.

### Зависимости

Программа использует следующие модули:

- `Net::Ping` - для выполнения ICMP ping запросов.
- `IO::Socket::INET` - для проверки доступности TCP портов.

```bash
cpan Net::Ping IO::Socket::
```

### Пример использования

Enter an IP address or hostname:: 8.8.8.8<br>
Enter a port to check TCP availability (or press Enter to skip): 53<br>
ICMP: Host 8.8.8.8 is reachable via ping<br>
TCP: Connection to 8.8.8.8:53 is successful