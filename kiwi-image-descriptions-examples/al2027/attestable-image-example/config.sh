# Enable the set-hostname-imds service. This will set the hostname
# based on IMDS in place of cloud-init

echo "enable set-hostname-imds.service" >> /usr/lib/systemd/system-preset/80-amzn-overrides.preset

systemctl preset set-hostname-imds

# The overlayroot upper layer is created in the initrd before the SELinux
# policy is loaded, so it is labeled tmpfs_t. Restore its labels early in boot.
cat > /etc/systemd/system/overlay-upper-relabel.service << 'UNIT'
[Unit]
Description=Restore SELinux labels of the overlayroot upper layer
DefaultDependencies=no
ConditionSecurity=selinux
After=local-fs.target
Before=sysinit.target systemd-networkd.service

[Service]
Type=oneshot
ExecStartPre=/usr/bin/test -d /run/overlay/overlayfs/rw
ExecStart=/bin/sh -c 'find /run/overlay/overlayfs/rw -xdev -printf "/%%P\\0" | xargs -0 restorecon -i -F'
RemainAfterExit=yes

[Install]
WantedBy=sysinit.target
UNIT
systemctl enable overlay-upper-relabel.service
