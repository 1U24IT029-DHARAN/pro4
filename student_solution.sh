#!/bin/bash

# SELinux Access Denial Practical
# Student Name:
# Register Number:

echo "===== SELinux Status ====="
getenforce
sestatus

echo "===== Creating Web Directory ====="
mkdir -p /myweb

echo "===== Creating HTML File ====="
echo "<html><body>Welcome</body></html>" > /myweb/index.html

echo "===== Setting Linux Permissions ====="
chmod 755 /myweb
chmod 644 /myweb/index.html

echo "===== Checking Initial Context ====="
ls -Z /myweb/index.html

echo "===== Assigning Wrong SELinux Context ====="
chcon -t default_t /myweb/index.html

echo "===== Checking Wrong Context ====="
ls -Z /myweb/index.html

echo "===== Checking AVC Denials ====="
ausearch -m AVC

echo "===== Correcting SELinux Context ====="
chcon -t httpd_sys_content_t /myweb/index.html

echo "===== Checking Correct Context ====="
ls -Z /myweb/index.html

echo "===== Practical Completed ====="
