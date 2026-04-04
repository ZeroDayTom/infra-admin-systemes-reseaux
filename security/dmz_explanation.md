# DMZ Explanation

## 📌 Definition

A DMZ (Demilitarized Zone) is a network segment designed to host services that must be accessible from the Internet while remaining isolated from the internal network (LAN).

It acts as a buffer zone between the public network and the internal infrastructure.

---

## 🎯 Objectives

- Expose public services (e.g. web server)
- Protect the internal network from external threats
- Limit the impact of a potential compromise

---

## 🧩 Implementation in this project

- **VLAN ID**: 40  
- **Network**: 192.168.40.0/24  
- **Hosted service**: Web Server  

The DMZ is connected to the pfSense firewall, which controls all traffic between:
- Internet
- DMZ
- Internal network (LAN)

---

## 🔥 Network Flows

### 🌐 Internet → DMZ
- **Allowed**
- Protocol: HTTPS (443)
- Mechanism: NAT / Port Forwarding

➡️ Allows external users to access the web server

---

### 🟨 USERS → DMZ
- **Allowed**
- Protocols: HTTP (80), HTTPS (443)

➡️ Internal users can access the web service

---

### 🟦 ADMIN → DMZ
- **Allowed**
- Protocols: SSH (22), RDP (3389)

➡️ Allows administrators to manage the server

---

### ❌ DMZ → LAN (SERVERS)
- **Blocked**

➡️ Prevents a compromised DMZ server from accessing internal resources

---

## 🔐 Security Principle

The DMZ follows the **principle of least privilege**:

> Only necessary traffic is allowed. All other communications are denied by default.

---

## ⚠️ Security Benefits

- Isolates exposed services from internal systems
- Reduces attack surface
- Limits lateral movement in case of compromise

---

## 🧠 Conclusion

The DMZ is a critical component of a secure network architecture.  
It allows public access to services while maintaining strong protection of the internal infrastructure.