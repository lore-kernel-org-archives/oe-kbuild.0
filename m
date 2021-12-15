Content-Type: multipart/mixed; boundary="===============7476767511335898635=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [android-common:android13-5.10 1/4] include/uapi/linux/fuse.h:971:20: sparse: sparse: dubious one-bit signed bitfield
Date: Wed, 15 Dec 2021 23:05:27 +0800
Message-ID: <202112152317.rW1DYqS2-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7476767511335898635==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: cros-kernel-buildreports(a)googlegroups.com

tree:   https://android.googlesource.com/kernel/common android13-5.10
head:   ee8015a3a26c98bdf76f31985d5f716fd19e9849
commit: 88b7179fcdb59ade839972bb6042e2b986e7cd57 [1/4] ANDROID: fuse: Move =
functions in preparation for fuse-bpf
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: i386-randconfig-s002-20211214 (https://download.01.org/0day-ci/arch=
ive/20211215/202112152317.rW1DYqS2-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        git remote add android-common https://android.googlesource.com/kern=
el/common
        git fetch --no-tags android-common android13-5.10
        git checkout 88b7179fcdb59ade839972bb6042e2b986e7cd57
        # save the config file to linux build tree
        mkdir build_dir
        make W=3D1 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3D=
build_dir ARCH=3Di386 SHELL=3D/bin/bash fs/fuse/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
   fs/fuse/acl.c: note: in included file (through fs/fuse/fuse_i.h):
>> include/uapi/linux/fuse.h:971:20: sparse: sparse: dubious one-bit signed=
 bitfield
   include/uapi/linux/fuse.h:972:22: sparse: sparse: dubious one-bit signed=
 bitfield
   include/uapi/linux/fuse.h:973:22: sparse: sparse: dubious one-bit signed=
 bitfield
   include/uapi/linux/fuse.h:974:23: sparse: sparse: dubious one-bit signed=
 bitfield
   include/uapi/linux/fuse.h:975:24: sparse: sparse: dubious one-bit signed=
 bitfield
   include/uapi/linux/fuse.h:976:25: sparse: sparse: dubious one-bit signed=
 bitfield
   include/uapi/linux/fuse.h:977:27: sparse: sparse: dubious one-bit signed=
 bitfield
   include/uapi/linux/fuse.h:978:27: sparse: sparse: dubious one-bit signed=
 bitfield
   include/uapi/linux/fuse.h:979:24: sparse: sparse: dubious one-bit signed=
 bitfield
--
   fs/fuse/xattr.c: note: in included file (through fs/fuse/fuse_i.h):
>> include/uapi/linux/fuse.h:971:20: sparse: sparse: dubious one-bit signed=
 bitfield
   include/uapi/linux/fuse.h:972:22: sparse: sparse: dubious one-bit signed=
 bitfield
   include/uapi/linux/fuse.h:973:22: sparse: sparse: dubious one-bit signed=
 bitfield
   include/uapi/linux/fuse.h:974:23: sparse: sparse: dubious one-bit signed=
 bitfield
   include/uapi/linux/fuse.h:975:24: sparse: sparse: dubious one-bit signed=
 bitfield
   include/uapi/linux/fuse.h:976:25: sparse: sparse: dubious one-bit signed=
 bitfield
   include/uapi/linux/fuse.h:977:27: sparse: sparse: dubious one-bit signed=
 bitfield
   include/uapi/linux/fuse.h:978:27: sparse: sparse: dubious one-bit signed=
 bitfield
   include/uapi/linux/fuse.h:979:24: sparse: sparse: dubious one-bit signed=
 bitfield
--
   fs/fuse/control.c: note: in included file (through fs/fuse/fuse_i.h):
>> include/uapi/linux/fuse.h:971:20: sparse: sparse: dubious one-bit signed=
 bitfield
   include/uapi/linux/fuse.h:972:22: sparse: sparse: dubious one-bit signed=
 bitfield
   include/uapi/linux/fuse.h:973:22: sparse: sparse: dubious one-bit signed=
 bitfield
   include/uapi/linux/fuse.h:974:23: sparse: sparse: dubious one-bit signed=
 bitfield
   include/uapi/linux/fuse.h:975:24: sparse: sparse: dubious one-bit signed=
 bitfield
   include/uapi/linux/fuse.h:976:25: sparse: sparse: dubious one-bit signed=
 bitfield
   include/uapi/linux/fuse.h:977:27: sparse: sparse: dubious one-bit signed=
 bitfield
   include/uapi/linux/fuse.h:978:27: sparse: sparse: dubious one-bit signed=
 bitfield
   include/uapi/linux/fuse.h:979:24: sparse: sparse: dubious one-bit signed=
 bitfield
--
   fs/fuse/passthrough.c: note: in included file (through fs/fuse/fuse_i.h):
>> include/uapi/linux/fuse.h:971:20: sparse: sparse: dubious one-bit signed=
 bitfield
   include/uapi/linux/fuse.h:972:22: sparse: sparse: dubious one-bit signed=
 bitfield
   include/uapi/linux/fuse.h:973:22: sparse: sparse: dubious one-bit signed=
 bitfield
   include/uapi/linux/fuse.h:974:23: sparse: sparse: dubious one-bit signed=
 bitfield
   include/uapi/linux/fuse.h:975:24: sparse: sparse: dubious one-bit signed=
 bitfield
   include/uapi/linux/fuse.h:976:25: sparse: sparse: dubious one-bit signed=
 bitfield
   include/uapi/linux/fuse.h:977:27: sparse: sparse: dubious one-bit signed=
 bitfield
   include/uapi/linux/fuse.h:978:27: sparse: sparse: dubious one-bit signed=
 bitfield
   include/uapi/linux/fuse.h:979:24: sparse: sparse: dubious one-bit signed=
 bitfield
--
   fs/fuse/cuse.c: note: in included file:
>> include/uapi/linux/fuse.h:971:20: sparse: sparse: dubious one-bit signed=
 bitfield
   include/uapi/linux/fuse.h:972:22: sparse: sparse: dubious one-bit signed=
 bitfield
   include/uapi/linux/fuse.h:973:22: sparse: sparse: dubious one-bit signed=
 bitfield
   include/uapi/linux/fuse.h:974:23: sparse: sparse: dubious one-bit signed=
 bitfield
   include/uapi/linux/fuse.h:975:24: sparse: sparse: dubious one-bit signed=
 bitfield
   include/uapi/linux/fuse.h:976:25: sparse: sparse: dubious one-bit signed=
 bitfield
   include/uapi/linux/fuse.h:977:27: sparse: sparse: dubious one-bit signed=
 bitfield
   include/uapi/linux/fuse.h:978:27: sparse: sparse: dubious one-bit signed=
 bitfield
   include/uapi/linux/fuse.h:979:24: sparse: sparse: dubious one-bit signed=
 bitfield
--
   fs/fuse/readdir.c: note: in included file (through fs/fuse/fuse_i.h):
>> include/uapi/linux/fuse.h:971:20: sparse: sparse: dubious one-bit signed=
 bitfield
   include/uapi/linux/fuse.h:972:22: sparse: sparse: dubious one-bit signed=
 bitfield
   include/uapi/linux/fuse.h:973:22: sparse: sparse: dubious one-bit signed=
 bitfield
   include/uapi/linux/fuse.h:974:23: sparse: sparse: dubious one-bit signed=
 bitfield
   include/uapi/linux/fuse.h:975:24: sparse: sparse: dubious one-bit signed=
 bitfield
   include/uapi/linux/fuse.h:976:25: sparse: sparse: dubious one-bit signed=
 bitfield
   include/uapi/linux/fuse.h:977:27: sparse: sparse: dubious one-bit signed=
 bitfield
   include/uapi/linux/fuse.h:978:27: sparse: sparse: dubious one-bit signed=
 bitfield
   include/uapi/linux/fuse.h:979:24: sparse: sparse: dubious one-bit signed=
 bitfield
--
   fs/fuse/virtio_fs.c: note: in included file (through fs/fuse/fuse_i.h):
>> include/uapi/linux/fuse.h:971:20: sparse: sparse: dubious one-bit signed=
 bitfield
   include/uapi/linux/fuse.h:972:22: sparse: sparse: dubious one-bit signed=
 bitfield
   include/uapi/linux/fuse.h:973:22: sparse: sparse: dubious one-bit signed=
 bitfield
   include/uapi/linux/fuse.h:974:23: sparse: sparse: dubious one-bit signed=
 bitfield
   include/uapi/linux/fuse.h:975:24: sparse: sparse: dubious one-bit signed=
 bitfield
   include/uapi/linux/fuse.h:976:25: sparse: sparse: dubious one-bit signed=
 bitfield
   include/uapi/linux/fuse.h:977:27: sparse: sparse: dubious one-bit signed=
 bitfield
   include/uapi/linux/fuse.h:978:27: sparse: sparse: dubious one-bit signed=
 bitfield
   include/uapi/linux/fuse.h:979:24: sparse: sparse: dubious one-bit signed=
 bitfield
--
   fs/fuse/inode.c: note: in included file (through fs/fuse/fuse_i.h):
>> include/uapi/linux/fuse.h:971:20: sparse: sparse: dubious one-bit signed=
 bitfield
   include/uapi/linux/fuse.h:972:22: sparse: sparse: dubious one-bit signed=
 bitfield
   include/uapi/linux/fuse.h:973:22: sparse: sparse: dubious one-bit signed=
 bitfield
   include/uapi/linux/fuse.h:974:23: sparse: sparse: dubious one-bit signed=
 bitfield
   include/uapi/linux/fuse.h:975:24: sparse: sparse: dubious one-bit signed=
 bitfield
   include/uapi/linux/fuse.h:976:25: sparse: sparse: dubious one-bit signed=
 bitfield
   include/uapi/linux/fuse.h:977:27: sparse: sparse: dubious one-bit signed=
 bitfield
   include/uapi/linux/fuse.h:978:27: sparse: sparse: dubious one-bit signed=
 bitfield
   include/uapi/linux/fuse.h:979:24: sparse: sparse: dubious one-bit signed=
 bitfield
--
   fs/fuse/dir.c: note: in included file (through fs/fuse/fuse_i.h):
>> include/uapi/linux/fuse.h:971:20: sparse: sparse: dubious one-bit signed=
 bitfield
   include/uapi/linux/fuse.h:972:22: sparse: sparse: dubious one-bit signed=
 bitfield
   include/uapi/linux/fuse.h:973:22: sparse: sparse: dubious one-bit signed=
 bitfield
   include/uapi/linux/fuse.h:974:23: sparse: sparse: dubious one-bit signed=
 bitfield
   include/uapi/linux/fuse.h:975:24: sparse: sparse: dubious one-bit signed=
 bitfield
   include/uapi/linux/fuse.h:976:25: sparse: sparse: dubious one-bit signed=
 bitfield
   include/uapi/linux/fuse.h:977:27: sparse: sparse: dubious one-bit signed=
 bitfield
   include/uapi/linux/fuse.h:978:27: sparse: sparse: dubious one-bit signed=
 bitfield
   include/uapi/linux/fuse.h:979:24: sparse: sparse: dubious one-bit signed=
 bitfield
--
   fs/fuse/dev.c: note: in included file (through fs/fuse/fuse_i.h):
>> include/uapi/linux/fuse.h:971:20: sparse: sparse: dubious one-bit signed=
 bitfield
   include/uapi/linux/fuse.h:972:22: sparse: sparse: dubious one-bit signed=
 bitfield
   include/uapi/linux/fuse.h:973:22: sparse: sparse: dubious one-bit signed=
 bitfield
   include/uapi/linux/fuse.h:974:23: sparse: sparse: dubious one-bit signed=
 bitfield
   include/uapi/linux/fuse.h:975:24: sparse: sparse: dubious one-bit signed=
 bitfield
   include/uapi/linux/fuse.h:976:25: sparse: sparse: dubious one-bit signed=
 bitfield
   include/uapi/linux/fuse.h:977:27: sparse: sparse: dubious one-bit signed=
 bitfield
   include/uapi/linux/fuse.h:978:27: sparse: sparse: dubious one-bit signed=
 bitfield
   include/uapi/linux/fuse.h:979:24: sparse: sparse: dubious one-bit signed=
 bitfield
--
   fs/fuse/file.c: note: in included file (through fs/fuse/fuse_i.h):
>> include/uapi/linux/fuse.h:971:20: sparse: sparse: dubious one-bit signed=
 bitfield
   include/uapi/linux/fuse.h:972:22: sparse: sparse: dubious one-bit signed=
 bitfield
   include/uapi/linux/fuse.h:973:22: sparse: sparse: dubious one-bit signed=
 bitfield
   include/uapi/linux/fuse.h:974:23: sparse: sparse: dubious one-bit signed=
 bitfield
   include/uapi/linux/fuse.h:975:24: sparse: sparse: dubious one-bit signed=
 bitfield
   include/uapi/linux/fuse.h:976:25: sparse: sparse: dubious one-bit signed=
 bitfield
   include/uapi/linux/fuse.h:977:27: sparse: sparse: dubious one-bit signed=
 bitfield
   include/uapi/linux/fuse.h:978:27: sparse: sparse: dubious one-bit signed=
 bitfield
   include/uapi/linux/fuse.h:979:24: sparse: sparse: dubious one-bit signed=
 bitfield

vim +971 include/uapi/linux/fuse.h

88b7179fcdb59a Daniel Rosenberg 2021-12-02  964  =

88b7179fcdb59a Daniel Rosenberg 2021-12-02  965  struct fuse_args {
88b7179fcdb59a Daniel Rosenberg 2021-12-02  966  	uint64_t nodeid;
88b7179fcdb59a Daniel Rosenberg 2021-12-02  967  	uint32_t opcode;
88b7179fcdb59a Daniel Rosenberg 2021-12-02  968  	uint32_t error_in;
88b7179fcdb59a Daniel Rosenberg 2021-12-02  969  	unsigned short in_numargs;
88b7179fcdb59a Daniel Rosenberg 2021-12-02  970  	unsigned short out_numarg=
s;
88b7179fcdb59a Daniel Rosenberg 2021-12-02 @971  	int force:1;
88b7179fcdb59a Daniel Rosenberg 2021-12-02  972  	int noreply:1;
88b7179fcdb59a Daniel Rosenberg 2021-12-02  973  	int nocreds:1;
88b7179fcdb59a Daniel Rosenberg 2021-12-02  974  	int in_pages:1;
88b7179fcdb59a Daniel Rosenberg 2021-12-02  975  	int out_pages:1;
88b7179fcdb59a Daniel Rosenberg 2021-12-02  976  	int out_argvar:1;
88b7179fcdb59a Daniel Rosenberg 2021-12-02  977  	int page_zeroing:1;
88b7179fcdb59a Daniel Rosenberg 2021-12-02  978  	int page_replace:1;
88b7179fcdb59a Daniel Rosenberg 2021-12-02  979  	int may_block:1;
88b7179fcdb59a Daniel Rosenberg 2021-12-02  980  	struct fuse_in_arg in_arg=
s[3];
88b7179fcdb59a Daniel Rosenberg 2021-12-02  981  	struct fuse_arg out_args[=
2];
88b7179fcdb59a Daniel Rosenberg 2021-12-02  982  	void (*end)(struct fuse_m=
ount *fm, struct fuse_args *args, int error);
88b7179fcdb59a Daniel Rosenberg 2021-12-02  983  =

88b7179fcdb59a Daniel Rosenberg 2021-12-02  984  	/* Path used for completi=
ng d_canonical_path */
88b7179fcdb59a Daniel Rosenberg 2021-12-02  985  	struct path *canonical_pa=
th;
88b7179fcdb59a Daniel Rosenberg 2021-12-02  986  };
88b7179fcdb59a Daniel Rosenberg 2021-12-02  987  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7476767511335898635==--

