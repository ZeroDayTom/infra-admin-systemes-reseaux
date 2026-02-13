# Linux Web Server Setup

## 🎯 Objective
Deploy and configure a Linux-based web server within the enterprise lab infrastructure.

The web server provides internal web services and demonstrates Linux system administration skills.

---

## 🖥️ Environment

- Operating System: Ubuntu Server 22.04 (or Debian 12)
- Server IP Address: 192.168.20.20
- VLAN: Servers (192.168.20.0/24)
- Gateway: 192.168.20.1
- DNS: 192.168.20.10 (Domain Controller)

---

## 🌐 Network Configuration

Before installing the web server:

- Configure a static IP address:
  - IP: 192.168.20.20
  - Subnet Mask: 255.255.255.0
  - Gateway: 192.168.20.1
  - DNS Server: 192.168.20.10