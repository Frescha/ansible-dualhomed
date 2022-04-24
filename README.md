# RPI Dual Homed

## Ansible Playbook

Build a dual homed homed using Ansible. The goal is to easily install a dual (or multi) homed host on the following machines:

- [ ] Ubuntu
- [ ] Rasbian

on processor architecture:

- [X] arm64 (aarch64)
- [ ] armhf

## How to Use

```bash
ansible-playbook site.yml -i inventory.ini --limit main
```

or

```bash
ansible-playbook -i inventory.ini main.yml
```

## Use Case SMBv1Brdige

### How to use

/etc/fstab define share
```bash
//172.16.0.2/share /reshare cifs uid=reuser,gid=reuser,credentials=/root/cred
```
### Test SMBv1 connection

```bash
smbclient //192.168.64.1/reshare -s ./smb.conf -m NT1 -U reuser 
```

## Use Case Edge Compute

### How to use


## Troubleshooting

### Firewall iptables

To list all IPv4 rules : sudo iptables -S
To list all IPv6 rules : sudo ip6tables -S
To list all tables rules : sudo iptables -L -v -n | more
To list all rules for INPUT tables : sudo iptables -L INPUT -v -n

### Reset Firewall iptables
