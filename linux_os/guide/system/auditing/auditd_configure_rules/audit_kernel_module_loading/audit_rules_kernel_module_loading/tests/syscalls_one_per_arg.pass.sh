#!/bin/bash
# profiles = xccdf_org.ssgproject.content_profile_C2S


# Use auditctl, on RHEL7, default is to use augenrules
sed -i "s%^ExecStartPost=.*%ExecStartPost=-/sbin/auditctl%" /usr/lib/systemd/system/auditd.service

rm -f /etc/audit/rules.d/*

# cut out irrelevant rules for this test
sed '1,13d' test_audit.rules > /etc/audit/audit.rules
