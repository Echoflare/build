#!/bin/bash
# Armbian Generic Calamares Installer Extension

function post_repo_customize_image__install_calamares() {
	display_alert "Adding calamares package to the image."
	do_with_retries 3 chroot_sdcard_apt_get_update
	do_with_retries 3 chroot_sdcard_apt_get_install calamares
	display_alert "Configuring Calamares for any Desktop Environment..."
	run_host_command_logged "cp -vr \"${SRC}/extensions/calamares-installer/config/\"* \"$SDCARD/\""
	chroot_sdcard "chmod +x /usr/libexec/armbian-finalize.sh"
	display_alert "Calamares configuration complete."
}
