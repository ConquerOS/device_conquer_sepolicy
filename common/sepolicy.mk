#
# This policy configuration will be used by all products that
# inherit from Lineage
#

ifeq ($(TARGET_COPY_OUT_VENDOR), vendor)
ifeq ($(BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE),)
TARGET_USES_PREBUILT_VENDOR_SEPOLICY ?= true
endif
endif

SYSTEM_EXT_PUBLIC_SEPOLICY_DIRS += \
    device/conquer/sepolicy/common/public

SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += \
    device/conquer/sepolicy/common/private

ifeq ($(TARGET_USES_PREBUILT_VENDOR_SEPOLICY), true)
SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += \
    device/conquer/sepolicy/common/dynamic \
    device/conquer/sepolicy/common/system
ifneq ($(TARGET_HAL_POWER_RW_INPUT_DEVICE), true)
SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += \
    device/conquer/sepolicy/common/dynamic_extra
endif
else
BOARD_VENDOR_SEPOLICY_DIRS += \
    device/conquer/sepolicy/common/dynamic \
    device/conquer/sepolicy/common/dynamic_extra \
    device/conquer/sepolicy/common/vendor
endif
