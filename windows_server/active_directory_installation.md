# Active Directory Installation and Configuration

## 🎯 Objective
Install and configure Active Directory Domain Services (AD DS) to manage users, computers, and resources within the enterprise lab environment.

---

## 🖥️ Environment

- Operating System: Windows Server 2019 / 2022
- Server Role: Domain Controller
- Server IP Address: 192.168.20.10
- Domain Name: company.local
- Network: Servers VLAN (192.168.20.0/24)

---

## 🌐 Network Configuration (Pre-requisites)

Before installing Active Directory:

- Configure a static IP address:
  - IP: 192.168.20.10
  - Subnet Mask: 255.255.255.0
  - Gateway: 192.168.20.1
  - Preferred DNS: 192.168.20.10 (after AD installation)

- Rename the server (example: DC01)
- Restart the server

---

## ⚙️ AD DS Role Installation

1. Open **Server Manager**
2. Click **Add Roles and Features**
3. Select:
   - Active Directory Domain Services
4. Add required features when prompted
5. Complete installation

---

## 🏗️ Promote to Domain Controller

After installation:

1. Click **Promote this server to a domain controller**
2. Select:
   - Add a new forest
3. Root domain name:
   - company.local
4. Set Directory Services Restore Mode (DSRM) password
5. Keep default options (DNS enabled)
6. Install and reboot

---

## 🌍 DNS Configuration

- DNS is automatically installed with AD
- Verify forward lookup zone: company.local
- Check that DNS service is running
- Ensure clients use the Domain Controller as DNS server

---

## 👥 Organizational Units (OU) Structure

Create a logical OU structure:

- Company
  - Users
  - Computers
  - Servers
  - Groups

This improves organization and GPO management.

---

## 👤 User and Group Creation

### Example Users:
- jdoe
- jsmith

### Example Groups:
- IT_Admins
- Employees

Users are placed in appropriate OUs and assigned to security groups.

---

## 🖥️ Join Client to Domain

On a Windows client machine:

1. Set DNS server to 192.168.20.10
2. Open System Properties
3. Change settings → Join domain
4. Enter: company.local
5. Provide domain admin credentials
6. Restart client

Verify successful domain login.

---

## 🔐 Basic Security Configuration

- Disable local administrator account (if required)
- Apply password policy via Group Policy:
  - Minimum length
  - Complexity enabled
- Restrict administrative privileges

---

## 🧪 Testing and Validation

- Verify DNS resolution:
  - nslookup company.local
- Test domain login
- Check replication (if multiple DCs)
- Validate user permissions

---

## 📊 Skills Demonstrated

- Windows Server administration
- Active Directory deployment
- DNS configuration
- Domain management
- User and group management
- Basic security implementation

---

## 📌 Notes

This Active Directory deployment is designed for a lab environment.  
In a production environment, additional configurations would be required:

- Redundant Domain Controllers
- Backup strategy
- Advanced Group Policy management
- Monitoring and auditing
