# Firewall Rules and Network Security Policies

## 🎯 Objective
Define and document the firewall rules implemented in pfSense to control traffic between VLANs and ensure secure network segmentation.

The firewall enforces a "default deny" policy and only allows explicitly authorized traffic.

---

## 🧱 Network Segmentation Overview

| VLAN Name | Subnet | Purpose |
|------------|------------|------------|
| Users | 192.168.10.0/24 | End-user workstations |
| Servers | 192.168.20.0/24 | Internal servers |
| Administration | 192.168.30.0/24 | IT management |
| DMZ | 192.168.40.0/24 | Public-facing services |

pfSense acts as the Layer 3 gateway for all VLANs.

---

## 🔒 Default Security Policy

- Default action: **Block all traffic**
- Only required services and protocols are allowed
- Logging enabled for important rules

This approach follows the **principle of least privilege**.

---

## 🌐 Users VLAN Rules (VLAN 10)

Allowed:
- HTTP (80) and HTTPS (443) to Internet
- DNS (53) to Domain Controller
- Access to internal web server (192.168.20.20)

Blocked:
- Direct access to Administration VLAN
- Direct access to Domain Controller management ports

---

## 🖥️ Servers VLAN Rules (VLAN 20)

Allowed:
- Communication with Domain Controller
- Required service ports (HTTP, HTTPS)
- Administrative access from Administration VLAN

Blocked:
- Direct Internet exposure (except through NAT if required)

---

## 🛠️ Administration VLAN Rules (VLAN 30)

Allowed:
- Full access to all VLANs
- RDP (3389) to Windows Server
- SSH (custom port) to Linux Server
- Management access to pfSense

This VLAN is restricted to IT administrators only.

---

## 🌍 DMZ Rules (VLAN 40)

Allowed:
- HTTP / HTTPS from WAN (via NAT)
- Limited outbound DNS requests

Blocked:
- Direct access to internal Servers VLAN
- Access to Administration VLAN

---

## 🔁 NAT Configuration

Outbound NAT:
- Automatic NAT for internal networks to WAN

Port Forwarding:
- WAN → DMZ Web Server (HTTP/HTTPS)

Only required ports are exposed.

---

## 🧪 Testing and Validation

The following tests were performed:

- Verify Users VLAN cannot access Administration VLAN
- Confirm web server accessible from Users VLAN
- Validate SSH access restricted to Administration VLAN
- Ensure blocked traffic is denied and logged

---

## 📊 Security Measures Implemented

- Network segmentation using VLANs
- Default deny firewall policy
- Restricted administrative access
- DMZ isolation
- Logging of critical traffic
- Limited service exposure

---

## 🚀 Possible Improvements

- IDS/IPS integration
- Geo-blocking rules
- VPN access for remote administration
- Advanced monitoring and alerting
- High Availability firewall configuration

---

## 📌 Notes

These firewall rules are implemented in a lab environment to simulate enterprise-level network security.

In a production environment, continuous monitoring and regular security audits would be required.
