# VLAN and Routing Configuration

## 🎯 Objective
Define the VLAN segmentation and routing strategy used in the enterprise network infrastructure.

---

## 🧱 VLAN Design
The network is segmented into multiple VLANs in order to improve security, traffic management, and administration.

| VLAN Name | VLAN ID | Subnet | Description |
|----------|--------|--------|-------------|
| Users | 10 | 192.168.10.0/24 | Workstations |
| Servers | 20 | 192.168.20.0/24 | Internal servers |
| Administration | 30 | 192.168.30.0/24 | IT management |
| DMZ | 40 | 192.168.40.0/24 | Public services |

---

## 🔀 VLAN Implementation
- VLANs are configured on the firewall (pfSense)
- Each VLAN has a dedicated interface
- The firewall acts as the default gateway for all VLANs

---

## 🌐 Inter-VLAN Routing
Inter-VLAN routing is enabled on the firewall to allow controlled communication between networks.

### Allowed Traffic
- Users → Servers (required services only)
- Administration → All VLANs
- DMZ → Internal network (restricted)

### Restricted Traffic
- Users → Administration (blocked)
- DMZ → Internal servers (blocked by default)

---

## 🛡️ Routing and Security Policies
- All VLAN traffic is filtered by firewall rules
- Default deny policy is applied
- Only necessary ports and protocols are allowed

---

## 🧪 Testing and Validation
The following tests were performed:
- Verify connectivity within each VLAN
- Verify inter-VLAN routing according to firewall rules
- Confirm blocked traffic is effectively denied

---

## 📌 Notes
This VLAN and routing design follows enterprise best practices and is adapted for a lab environment.
