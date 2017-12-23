LOCAL_PATH := $(call my-dir)

common_c_includes := $(LOCAL_PATH)/../fuse/include $(LOCAL_PATH)/include/ntfs-3g
common_cflags := -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64  -DHAVE_CONFIG_H -DFUSE_USE_VERSION=26

# libntfs-3g
libntfs_src_files :=libntfs-3g/acls.c libntfs-3g/attrib.c libntfs-3g/attrlist.c \
	libntfs-3g/bitmap.c libntfs-3g/bootsect.c libntfs-3g/cache.c libntfs-3g/collate.c \
	libntfs-3g/compat.c libntfs-3g/compress.c libntfs-3g/debug.c libntfs-3g/device.c \
	libntfs-3g/dir.c libntfs-3g/ea.c libntfs-3g/efs.c libntfs-3g/index.c \
	libntfs-3g/inode.c libntfs-3g/ioctl.c \
	libntfs-3g/lcnalloc.c libntfs-3g/logfile.c libntfs-3g/logging.c libntfs-3g/mft.c \
	libntfs-3g/misc.c libntfs-3g/mst.c libntfs-3g/object_id.c libntfs-3g/reparse.c \
	libntfs-3g/runlist.c libntfs-3g/security.c libntfs-3g/unistr.c\
	libntfs-3g/unix_io.c libntfs-3g/volume.c libntfs-3g/xattrs.c libntfs-3g/realpath.c \
	ntfsprogs/utils.c

include $(CLEAR_VARS)
LOCAL_C_INCLUDES := $(common_c_includes)
LOCAL_CFLAGS := $(common_cflags)
LOCAL_SRC_FILES := $(libntfs_src_files)
LOCAL_MODULE := libntfs-3g
LOCAL_MODULE_TAGS := eng
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_C_INCLUDES := $(common_c_includes)
LOCAL_CFLAGS := $(common_cflags)
LOCAL_SRC_FILES := $(libntfs_src_files)
LOCAL_MODULE := libntfs-3g_static
LOCAL_MODULE_TAGS := eng
include $(BUILD_STATIC_LIBRARY)


#ntfs-3g
ntfs-3g_src_files := src/ntfs-3g.c src/ntfs-3g_common.c

include $(CLEAR_VARS)
LOCAL_C_INCLUDES := $(common_c_includes) $(LOCAL_PATH)/src
LOCAL_CFLAGS := $(common_cflags)
LOCAL_SRC_FILES := $(ntfs-3g_src_files)
LOCAL_MODULE := mount.ntfs
LOCAL_MODULE_TAGS := eng
LOCAL_SHARED_LIBRARIES := libfuse libntfs-3g
include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)
LOCAL_C_INCLUDES := $(common_c_includes) $(LOCAL_PATH)/src
LOCAL_CFLAGS := $(common_cflags) -Dmain=mount_ntfs3g_main
LOCAL_SRC_FILES := $(ntfs-3g_src_files)
LOCAL_MODULE := libntfs3g_mount_static
LOCAL_MODULE_TAGS := eng
include $(BUILD_STATIC_LIBRARY)


# ntfsprogs - ntfsfix
ntfsfix_src_files := ntfsprogs/ntfsfix.c

include $(CLEAR_VARS)
LOCAL_SRC_FILES := $(ntfsfix_src_files)
LOCAL_C_INCLUDES := $(common_c_includes) $(LOCAL_PATH)/ntfsprogs
LOCAL_CFLAGS := $(common_cflags)
LOCAL_MODULE := fsck.ntfs
LOCAL_MODULE_TAGS := eng
LOCAL_SHARED_LIBRARIES := libext2_uuid libfuse libntfs-3g
include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := $(ntfsfix_src_files)
LOCAL_C_INCLUDES := $(common_c_includes) $(LOCAL_PATH)/ntfsprogs
LOCAL_CFLAGS := $(common_cflags) -Dmain=fsck_ntfs3g_main
LOCAL_MODULE := libntfs3g_fsck_static
LOCAL_MODULE_TAGS := eng
include $(BUILD_STATIC_LIBRARY)


# ntfsprogs - mkntfs
mkntfs_src_files := ntfsprogs/attrdef.c ntfsprogs/boot.c ntfsprogs/sd.c ntfsprogs/mkntfs.c

include $(CLEAR_VARS)
LOCAL_SRC_FILES := $(mkntfs_src_files)
LOCAL_C_INCLUDES := $(common_c_includes) $(LOCAL_PATH)/ntfsprogs \
			$(LOCAL_PATH) external/e2fsprogs/lib
LOCAL_CFLAGS := $(common_cflags)
LOCAL_MODULE := mkfs.ntfs
LOCAL_MODULE_TAGS := eng
LOCAL_SHARED_LIBRARIES := libfuse libntfs-3g
include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := $(mkntfs_src_files)
LOCAL_C_INCLUDES := $(common_c_includes) $(LOCAL_PATH)/ntfsprogs \
			$(LOCAL_PATH) external/e2fsprogs/lib
LOCAL_CFLAGS := $(common_cflags) -Dmain=mkfs_ntfs3g_main
LOCAL_MODULE := libntfs3g_mkfs_main
LOCAL_MODULE_TAGS := eng
include $(BUILD_STATIC_LIBRARY)
