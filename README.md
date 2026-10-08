<div align="center">

# 🐧⚙️ Linux Server Automation Toolkit

### 🚀 Bash-Based DevOps Automation & Linux Server Administration

<img src="https://img.shields.io/badge/Linux-Server%20Automation-FCC624?style=for-the-badge&logo=linux&logoColor=black" alt="Linux">
<img src="https://img.shields.io/badge/Bash-Scripting-4EAA25?style=for-the-badge&logo=gnubash&logoColor=white" alt="Bash">
<img src="https://img.shields.io/badge/DevOps-Automation-2496ED?style=for-the-badge&logo=docker&logoColor=white" alt="DevOps">
<img src="https://img.shields.io/badge/Cron-Scheduled%20Jobs-333333?style=for-the-badge&logo=linux&logoColor=white" alt="Cron">

<br><br>

<img src="https://img.shields.io/badge/System%20Monitoring-📊-blue?style=flat-square" alt="System Monitoring">
<img src="https://img.shields.io/badge/Backup-💾-green?style=flat-square" alt="Backup">
<img src="https://img.shields.io/badge/Service%20Management-⚙️-orange?style=flat-square" alt="Service Management">
<img src="https://img.shields.io/badge/Log%20Management-📝-purple?style=flat-square" alt="Log Management">
<img src="https://img.shields.io/badge/User%20Management-👤-red?style=flat-square" alt="User Management">

<br><br>

**A practical Bash automation toolkit for common Linux server administration and DevOps tasks.**

</div>

---

## 📌 Project Overview

The **Linux Server Automation Toolkit** is a collection of reusable **Bash scripts** designed to automate common Linux server administration and DevOps activities.

The toolkit provides a single menu-driven interface for:

- 🖥️ System information
- ❤️ Server health monitoring
- ⚙️ Service monitoring
- 💾 Backup automation
- 🧹 Log cleanup
- 👤 User management
- 💽 Disk monitoring
- 🧠 Memory monitoring
- 📊 Process monitoring
- ⏰ Cron automation
- 🛡️ Error handling and logging

---

## 🏗️ Architecture

```text
                    👨‍💻 DevOps Engineer
                            │
                            ▼
                 🐧 Linux Server
                            │
                            ▼
                 ⚙️ devops-tools.sh
                            │
        ┌───────────────────┼───────────────────┐
        │                   │                   │
        ▼                   ▼                   ▼
   🖥️ System Info      ❤️ Health Check     ⚙️ Services
        │                   │                   │
        └───────────────────┼───────────────────┘
                            │
              ┌─────────────┼─────────────┐
              │             │             │
              ▼             ▼             ▼
           💾 Backup     🧹 Logs       👤 Users
              │             │             │
              └─────────────┼─────────────┘
                            │
                            ▼
                       ⏰ Cron Jobs
                            │
                            ▼
                       📋 Logs
```

---

## 📂 Project Structure

```text
🐧 bash-devops-toolkit/
│
├── 🖥️ system-info.sh
├── ❤️ health-check.sh
├── ⚙️ service-check.sh
├── 💾 backup.sh
├── 🧹 log-cleanup.sh
├── 👤 user-management.sh
├── 🚀 devops-tools.sh
│
├── 💾 backups/
│
├── 📋 logs/
│   ├── health-check.log
│   ├── service-check.log
│   ├── backup.log
│   └── cleanup.log
│
└── 📖 README.md
```

---

## 🛠️ Technologies & Tools

<div align="center">

<img src="https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black" alt="Linux">
<img src="https://img.shields.io/badge/Bash-4EAA25?style=for-the-badge&logo=gnubash&logoColor=white" alt="Bash">
<img src="https://img.shields.io/badge/Cron-333333?style=for-the-badge&logo=linux&logoColor=white" alt="Cron">
<img src="https://img.shields.io/badge/Git-F05032?style=for-the-badge&logo=git&logoColor=white" alt="Git">

</div>

### 🔧 Linux Commands

```text
grep
awk
sed
cut
find
tar
gzip
df
free
ps
systemctl
chmod
crontab
```

---

## 🚀 Quick Start

### 1️⃣ Clone the Repository

```bash
git clone https://github.com/YOUR_USERNAME/bash-devops-toolkit.git
```

```bash
cd bash-devops-toolkit
```

### 2️⃣ Give Execute Permissions

```bash
chmod +x *.sh
```

### 3️⃣ Validate Scripts

```bash
for script in *.sh
do
    bash -n "$script"
done
```

### 4️⃣ Start the DevOps Tool

```bash
./devops-tools.sh
```

---

## 🎯 DevOps Automation Menu

```text
╔════════════════════════════════════════╗
║        🚀 DEVOPS AUTOMATION            ║
╠════════════════════════════════════════╣
║                                        ║
║  1. 🖥️ Server Information              ║
║  2. ❤️ Health Check                    ║
║  3. ⚙️ Service Status                  ║
║  4. 💾 Backup                          ║
║  5. 💽 Disk Usage                      ║
║  6. 🧠 Memory Usage                    ║
║  7. 📊 Process Information             ║
║  8. 🧹 Log Cleanup                     ║
║  9. 🚪 Exit                            ║
║                                        ║
╚════════════════════════════════════════╝
```

---

## 🖥️ 1. System Information

```bash
./system-info.sh
```

Displays:

- 🏷️ Hostname
- 🐧 Operating System
- 🔢 Kernel Version
- 🧠 CPU Information
- 💾 Memory Usage
- 💽 Disk Usage
- ⏱️ Server Uptime
- 🕐 Current Date/Time
- 🌐 IP Address

---

## ❤️ 2. Server Health Check

```bash
./health-check.sh
```

Health thresholds:

| Usage | Status |
|---|---|
| `< 70%` | 🟢 NORMAL |
| `70–90%` | 🟡 WARNING |
| `> 90%` | 🔴 CRITICAL |

The script returns an appropriate exit status when a critical condition is detected.

---

## ⚙️ 3. Service Monitoring

```bash
./service-check.sh
```

Monitors services such as:

```text
nginx
ssh
docker
```

Example:

```text
nginx  : RUNNING
ssh    : RUNNING
docker : STOPPED
```

The script can optionally restart a stopped service.

---

## 💾 4. Backup Automation

```bash
./backup.sh ~/bash-backup-test
```

Creates timestamped compressed backups:

```text
backup_2026-10-08_18-40-00.tar.gz
```

Backups are stored under:

```text
backups/
```

---

## 🧹 5. Log Cleanup

```bash
./log-cleanup.sh ~/bash-log-test 7
```

Finds `.log` files older than the specified number of days.

Example:

```bash
find ~/bash-log-test -type f -name "*.log" -mtime +7
```

The script asks for confirmation before deleting files.

> ⚠️ Always test log cleanup in a lab directory before using it on production logs.

---

## 👤 6. User Management

Run:

```bash
sudo ./user-management.sh
```

Menu:

```text
1. Create User
2. Delete User
3. Check User
4. List Users
5. Exit
```

The script validates root privileges before performing administrative operations.

---

## ⏰ 7. Cron Automation

Health checks can run automatically every 5 minutes.

Edit Cron:

```bash
crontab -e
```

Add:

```cron
*/5 * * * * /root/bash-devops-toolkit/health-check.sh >> /root/bash-devops-toolkit/logs/health-check-cron.log 2>&1
```

Verify:

```bash
crontab -l
```

View output:

```bash
tail -50 logs/health-check-cron.log
```

---

## 🛡️ Error Handling

The toolkit includes:

```text
✅ Argument validation
✅ File validation
✅ Directory validation
✅ Command availability checks
✅ Permission checks
✅ Exit status handling
✅ Failure detection
✅ Logging
✅ Confirmation before destructive operations
```

Syntax validation:

```bash
bash -n script.sh
```

---

## 🧪 Testing

All scripts should be tested individually before using the main menu.

```bash
./system-info.sh
```

```bash
./service-check.sh
```


```bash

./backup.sh ~/bash-backup-test
```


```bash

./log-cleanup.sh ~/bash-log-test 7

```


```bash
```bash
./devops-tools.sh
```


sudo ./user-management.sh

---
```


## 📸 Sample Output


### 🖥️ System Information


```text

========================================
       SERVER INFORMATION

========================================
Hostname    : ip-172-31-43-95

OS          : Ubuntu
Kernel      : 6.x.x

CPU Cores   : 2
Memory      : 1.5Gi/3.8Gi

Disk        : 8G/20G (40% used)
Uptime      : up 2 hours

Date/Time   : 2026-10-08 18:00:00
IP Address  : 172.31.x.x
========================================
```

### ❤️ Health Check

```text
CPU Usage    : 12% - NORMAL
Memory Usage : 38% - NORMAL
Disk Usage   : 40% - NORMAL

Overall Status : HEALTHY
```

### ⚙️ Service Check

```text
nginx : RUNNING
ssh   : RUNNING
docker: RUNNING
```

---

## 📝 Issues & Resolutions

### Bash Syntax Error

**Issue:**

```text
syntax error near unexpected token `fi'
```

**Resolution:**

The script syntax was corrected and validated using:

```bash
bash -n devops-tools.sh
```

### Service Availability

Some servers may not have Docker or Nginx installed.

The service monitoring script checks whether the service exists before attempting to monitor it.

### Permission Issues

Administrative operations require elevated privileges:

```bash
sudo ./user-management.sh
```

---

## 🎓 Learning Outcomes

After completing this project, the following Bash and Linux concepts were practiced:

```text
🐚 Bash Scripting
📦 Variables
⌨️ User Input
🔀 Conditions
🔁 Loops
🧩 Functions
📋 Arrays
🔢 Exit Status
📁 File Operations
🔎 grep
📊 awk
✂️ cut
🔄 sed
🔍 find
⚙️ systemctl
💾 tar/gzip
⏰ Cron
📝 Logging
🛡️ Error Handling
👤 Linux User Management
```

---

## 🚀 Future Improvements

Possible enhancements:

- 📧 Email notifications
- 📱 Slack/Teams alerts
- ☁️ AWS S3 backup integration
- 🐳 Docker container monitoring
- 📊 Prometheus integration
- 📈 Grafana dashboards
- 🔐 Security checks
- 📦 Automatic package updates
- 🔄 Automated application deployment
- 🩺 Advanced server health monitoring

---

<div align="center">

### 👨‍💻 Created by

# **Venu Gopala Reddy Eppala**

### ☁️ Cloud & DevOps Engineer

<br>

🐧 Linux • 🐚 Bash • ☁️ AWS • 🐳 Docker • ☸️ Kubernetes • ⚙️ DevOps

</div>
