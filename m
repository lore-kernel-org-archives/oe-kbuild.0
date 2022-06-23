Content-Type: multipart/mixed; boundary="===============0479407804612327741=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ammarfaizi2-block:google/android/kernel/common/android13-5.10 7542/9999] include/uapi/linux/fuse.h:971:20: sparse: sparse: dubious one-bit signed bitfield
Date: Fri, 24 Jun 2022 00:44:55 +0800
Message-ID: <202206240018.cvWtjeqD-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0479407804612327741==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: include/u=
api/linux/fuse.h:971:20: sparse: sparse: dubious one-bit signed bitfield"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: Ammar Faizi <ammarfaizi2@gnuweeb.org>

tree:   https://github.com/ammarfaizi2/linux-block google/android/kernel/co=
mmon/android13-5.10
head:   aadf7ad9db2f7d93ecfb34d0e4f328519460c94e
commit: 88b7179fcdb59ade839972bb6042e2b986e7cd57 [7542/9999] ANDROID: fuse:=
 Move functions in preparation for fuse-bpf
:::::: branch date: 3 months ago
:::::: commit date: 6 months ago
config: i386-randconfig-s001 (https://download.01.org/0day-ci/archive/20220=
624/202206240018.cvWtjeqD-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-31-g4880bd19-dirty
        # https://github.com/ammarfaizi2/linux-block/commit/88b7179fcdb59ad=
e839972bb6042e2b986e7cd57
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/lin=
ux-block
        git fetch --no-tags ammarfaizi2-block google/android/kernel/common/=
android13-5.10
        git checkout 88b7179fcdb59ade839972bb6042e2b986e7cd57
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=3D1 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3D=
build_dir ARCH=3Di386 SHELL=3D/bin/bash fs/fuse/

If you fix the issue, kindly add following tag where applicable
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

88b7179fcdb59ad Daniel Rosenberg 2021-12-02  964  =

88b7179fcdb59ad Daniel Rosenberg 2021-12-02  965  struct fuse_args {
88b7179fcdb59ad Daniel Rosenberg 2021-12-02  966  	uint64_t nodeid;
88b7179fcdb59ad Daniel Rosenberg 2021-12-02  967  	uint32_t opcode;
88b7179fcdb59ad Daniel Rosenberg 2021-12-02  968  	uint32_t error_in;
88b7179fcdb59ad Daniel Rosenberg 2021-12-02  969  	unsigned short in_numarg=
s;
88b7179fcdb59ad Daniel Rosenberg 2021-12-02  970  	unsigned short out_numar=
gs;
88b7179fcdb59ad Daniel Rosenberg 2021-12-02 @971  	int force:1;
88b7179fcdb59ad Daniel Rosenberg 2021-12-02  972  	int noreply:1;
88b7179fcdb59ad Daniel Rosenberg 2021-12-02  973  	int nocreds:1;
88b7179fcdb59ad Daniel Rosenberg 2021-12-02  974  	int in_pages:1;
88b7179fcdb59ad Daniel Rosenberg 2021-12-02  975  	int out_pages:1;
88b7179fcdb59ad Daniel Rosenberg 2021-12-02  976  	int out_argvar:1;
88b7179fcdb59ad Daniel Rosenberg 2021-12-02  977  	int page_zeroing:1;
88b7179fcdb59ad Daniel Rosenberg 2021-12-02  978  	int page_replace:1;
88b7179fcdb59ad Daniel Rosenberg 2021-12-02  979  	int may_block:1;
88b7179fcdb59ad Daniel Rosenberg 2021-12-02  980  	struct fuse_in_arg in_ar=
gs[3];
88b7179fcdb59ad Daniel Rosenberg 2021-12-02  981  	struct fuse_arg out_args=
[2];
88b7179fcdb59ad Daniel Rosenberg 2021-12-02  982  	void (*end)(struct fuse_=
mount *fm, struct fuse_args *args, int error);
88b7179fcdb59ad Daniel Rosenberg 2021-12-02  983  =

88b7179fcdb59ad Daniel Rosenberg 2021-12-02  984  	/* Path used for complet=
ing d_canonical_path */
88b7179fcdb59ad Daniel Rosenberg 2021-12-02  985  	struct path *canonical_p=
ath;
88b7179fcdb59ad Daniel Rosenberg 2021-12-02  986  };
88b7179fcdb59ad Daniel Rosenberg 2021-12-02  987  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0479407804612327741==--

