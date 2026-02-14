# DNS and DHCP Configuration on Windows Server

## 🎯 Objective
Configure DNS and DHCP services on the Windows Server to provide name resolution and automatic IP address assignment within the enterprise lab infrastructure.

These services are essential for proper network communication and Active Directory functionality.

---

## 🖥️ Environment

- Operating System: Windows Server 2019 / 2022
- Server Role: Domain Controller, DNS Server, DHCP Server
- Server Hostname: DC01
- Server IP Address: 192.168.20.10
- Domain: company.local
- Network: Servers VLAN (192.168.20.0/24)

---

## 🌐 DNS Configuration

### Role Installation

DNS is automatically installed when Active Directory Domain Services is deployed.

To verify installation:

1. Open **Server Manager**
2. Click **Tools**
3. Select **DNS**

---

### Verify Forward Lookup Zone

Ensure the following zone exists:

- company.local

Check that records are present:

- SOA record
- NS record
- A record for DC01

Example:

| Name | Type | IP Address |
|------|------|------------|
| DC01 | A | 192.168.20.10 |

---

### Test DNS Resolution