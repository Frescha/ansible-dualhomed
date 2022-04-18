# A rough list of all ideas and todos

That's a rough list of all ideas and todos

## Ideas

- [ ] Use case SMBv1 bridge
- [ ] Use case FTP bridge
- [ ] Use case port forwarder
- [ ] Use case Edge Computing with Docker

## Todo Playbooks

### Role Bootstrap

- [ ] Bootstrap system (very basic stuff)
  - [X] change Hostname
  - [ ] Configure Repository
  - [ ] System hardening
    - [ ] alternativ user
    - [ ] change password from default user
  - [ ] timezone settings (chrony)
  - [X] configure ntp (chrony)

### Role Network

- [ ] configure network
  - [X] disable netplan
  - [ ] configure DNS resolve (/etc/systemd/resolved.conf)
  - [X] configure network interface eth0 (northbond)
    - [X] fix ip range 
  - [X] configure network interface eth1 (southbond)
    - [X] fix ip range

### Role Firewall

- [ ] configure internal firewall
  - [ ] configure basic ruleset
    - [ ] echo-request/echo-replay
    - [ ] loopback interface
    - [ ] Drop IPv6 traffic
- [ ] flush default ruleset by start