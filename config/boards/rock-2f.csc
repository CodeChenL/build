# Rockchip RK3528 quad core 1-4GB SoC WIFI/BT 0-32GB eMMC
BOARD_NAME="ROCK 2F"
BOARDFAMILY="rk35xx"
BOOTCONFIG="rock-2-rk3528_defconfig"
BOARD_MAINTAINER="CodeChenL"
KERNEL_TARGET="vendor"
FULL_DESKTOP="yes"
BOOT_LOGO="desktop"
BOOT_FDT_FILE="rockchip/rk3528-rock-2f.dtb"
BOOT_SCENARIO="spl-blobs"
IMAGE_PARTITION_TABLE="gpt"
enable_extension "radxa-aic8800"
AIC8800_TYPE="usb"

function post_family_tweaks__rock2f_naming_wireless_interface() {
	display_alert "$BOARD" "Renaming rock2f wifi" "info"

	mkdir -p $SDCARD/usr/lib/systemd/network/
	cat <<- EOF > "$SDCARD/usr/lib/systemd/network/50-radxa-aic8800.link"
		[Match]
		OriginalName=wlan*

		[Link]
		NamePolicy=kernel
	EOF

	return 0
}
