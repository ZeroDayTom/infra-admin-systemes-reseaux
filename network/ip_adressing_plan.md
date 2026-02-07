# IP Addressing Plan

## 🎯 Objective
Define a clear and structured IP addressing scheme for the enterprise network infrastructure.

---

## 🌐 Network Overview
The infrastructure is divided into several logical networks to improve security, performance, and administration.

| Network Name | VLAN ID | Subnet | Purpose |
|-------------|--------|--------|---------|
| Users        | 10     | 192.168.10.0/24 | Workstations |
| Servers      | 20     | 192.168.20.0/24 | Internal servers |
| Administration | 30  | 192.168.30.0/24 | IT management |
| DMZ          | 40     | 192.168.40.0/24 | Public services |

---

## 📊 IP Allocation Details

### 🔹 VLAN 10 – Users
- Network: `192.168.10.0/24`
- Gateway: `192.168.10.1`
- DHCP Range: `192.168.10.50 – 192.168.10.200`
- Reserved:
  - Printer: `192.168.10.10`
  - Wi-Fi AP: `192.168.10.11`

---

### 🔹 VLAN 20 – Servers
- Network: `192.168.20.0/24`
- Gateway: `192.168.20.1`
- Static IP addresses:
  - Windows Server (AD/DNS/DHCP): `192.168.20.10`
  - Linux Web Server: `192.168.20.20`
  - Backup Server: `192.168.20.30`

---

### 🔹 VLAN 30 – Administration
- Network: `192.168.30.0/24`
- Gateway: `192.168.30.1`
- Static IP addresses:
  - Admin Workstation: `192.168.30.10`

---

### 🔹 VLAN 40 – DMZ
- Network: `192.168.40.0/24`
- Gateway: `192.168.40.1`
- Static IP addresses:
  - Public Web Server: `192.168.40.10`

---

## 🔀 Routing
Inter-VLAN routing is handled by the firewall (pfSense).  
Each VLAN uses the firewall interface as its default gateway.

---

## 🛡️ Security Considerations
- Users VLAN cannot directly access the Administration VLAN
- Only necessary ports are allowed between VLANs
- DMZ is isolated from the internal network

---

## 📌 Notes
This IP addressing plan is designed for a lab environment and can be easily scaled or adapted for a real production infrastructure.
