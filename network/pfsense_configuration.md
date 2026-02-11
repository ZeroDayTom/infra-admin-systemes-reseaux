# pfSense Firewall Configuration

## 🎯 Objective
Configure pfSense as the central firewall and router for the enterprise lab infrastructure.

The firewall provides:
- Inter-VLAN routing
- Traffic filtering
- Network segmentation
- Gateway services

---

## 🖥️ pfSense Environment

- Platform: Virtual Machine (VirtualBox / VMware)
- Interfaces:
  - WAN (Internet access - NAT)
  - LAN (Internal management)
  - VLAN interfaces (Users, Servers, Administration, DMZ)

---

## 🌐 Interface Configuration

### WAN Interface
- Type: DHCP (or NAT from host)
- Purpose: Internet access for updates and testing

---

### LAN Interface
- IP Address: 192.168.1.1/24
- Purpose: Initial management access to pfSense

---

### VLAN Interfaces

VLANs are created on the LAN interface.

| VLAN Name | VLAN ID | Interface IP | Subnet |
|-----------|---------|--------------|--------|
| Users | 10 | 192.168.10.1 | 192.168.10.0/24 |
| Servers | 20 | 192.168.20.1 | 192.168.20.0/24 |
| Administration | 30 | 192.168.30.1 | 192.168.30.0/24 |
| DMZ | 40 | 192.168.40.1 | 192.168.40.0/24 |

Each VLAN interface acts as the default gateway for its subnet.

---

## 🔀 Routing Configuration

- Inter-VLAN routing is enabled automatically once interfaces are configured.
- pfSense acts as the Layer 3 gateway.
- Static routes are not required in this lab setup.

---

## 🔐 Firewall Rules

A "default deny" policy is applied.

### Users VLAN Rules
- Allow HTTP/HTTPS to Internet
- Allow access to internal servers (specific ports only)
- Block access to Administration VLAN

### Servers VLAN Rules
- Allow required services
- Allow DNS and domain communication with AD server

### Administration VLAN Rules
- Full access to all VLANs
- SSH/RDP access to servers

### DMZ Rules
- Allow public HTTP/HTTPS
- Block access to internal network by default

---

## 🛡️ NAT Configuration

Outbound NAT:
- Automatic NAT configuration
- Internal networks translated to WAN IP

Port Forwarding (if needed):
- WAN → DMZ Web Server (HTTP/HTTPS)

---

## 🧪 Testing and Validation

The following tests were performed:
- Ping between VLANs (according to firewall rules)
- Verify blocked traffic is denied
- Test Internet connectivity from Users VLAN
- Access internal web server

---

## 📊 Security Considerations

- Principle of least privilege applied
- Segmentation reduces lateral movement risks
- Firewall logs monitored for suspicious activity

---

## 📌 Notes

This configuration is adapted for a lab environment.
In a production environment, additional measures would be implemented:
- IDS/IPS
- VPN access
- High Availability
- Advanced logging and monitoring
