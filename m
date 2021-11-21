Content-Type: multipart/mixed; boundary="===============5607481342015777424=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: fs/jffs2/gc.c:846:3: warning: Argument to kfree() is the address of the local variable 'dev', which is not memory allocated by malloc() [clang-analyzer-unix.Malloc]
Date: Mon, 22 Nov 2021 06:41:06 +0800
Message-ID: <202111220653.tpO1KA19-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5607481342015777424==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Chris Down <chris@chrisdown.name>
CC: Petr Mladek <pmladek@suse.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   923dcc5eb0c111eccd51cc7ce1658537e3c38b25
commit: 337015573718b161891a3473d25f59273f2e626b printk: Userspace format i=
ndexing support
date:   4 months ago
:::::: branch date: 25 hours ago
:::::: commit date: 4 months ago
config: arm-randconfig-c002-20210928 (attached as .config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project dc6e8d=
fdfe7efecfda318d43a06fae18b40eb498)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D337015573718b161891a3473d25f59273f2e626b
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 337015573718b161891a3473d25f59273f2e626b
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
             ^
   drivers/misc/habanalabs/common/habanalabs_ioctl.c:753:20: note: '?' cond=
ition is true
           if (nr =3D=3D _IOC_NR(HL_IOCTL_INFO)) {
                             ^
   include/uapi/misc/habanalabs.h:1053:3: note: expanded from macro 'HL_IOC=
TL_INFO'
                   _IOWR('H', 0x01, struct hl_info_args)
                   ^
   include/uapi/asm-generic/ioctl.h:88:68: note: expanded from macro '_IOWR'
   #define _IOWR(type,nr,size)     _IOC(_IOC_READ|_IOC_WRITE,(type),(nr),(_=
IOC_TYPECHECK(size)))
                                                                          ^
   include/asm-generic/ioctl.h:13:3: note: expanded from macro '_IOC_TYPECH=
ECK'
           ((sizeof(t) =3D=3D sizeof(t[1]) && \
            ^
   drivers/misc/habanalabs/common/habanalabs_ioctl.c:753:6: note: Assuming =
the condition is true
           if (nr =3D=3D _IOC_NR(HL_IOCTL_INFO)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/habanalabs/common/habanalabs_ioctl.c:753:2: note: Taking tr=
ue branch
           if (nr =3D=3D _IOC_NR(HL_IOCTL_INFO)) {
           ^
   drivers/misc/habanalabs/common/habanalabs_ioctl.c:761:9: note: Calling '=
_hl_ioctl'
           return _hl_ioctl(filep, cmd, arg, ioctl, hdev->dev_ctrl);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/habanalabs/common/habanalabs_ioctl.c:653:2: note: 'kdata' i=
nitialized to a null pointer value
           char *kdata =3D NULL;
           ^~~~~~~~~~~
   drivers/misc/habanalabs/common/habanalabs_ioctl.c:659:6: note: Assuming =
field 'hard_reset_pending' is 0
           if (hdev->hard_reset_pending) {
               ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/habanalabs/common/habanalabs_ioctl.c:659:2: note: Taking fa=
lse branch
           if (hdev->hard_reset_pending) {
           ^
   drivers/misc/habanalabs/common/habanalabs_ioctl.c:668:15: note: Assuming=
 'func' is non-null
           if (unlikely(!func)) {
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   drivers/misc/habanalabs/common/habanalabs_ioctl.c:668:2: note: Taking fa=
lse branch
           if (unlikely(!func)) {
           ^
   drivers/misc/habanalabs/common/habanalabs_ioctl.c:676:6: note: Assuming =
'hl_size' is <=3D 'asize'
           if (hl_size > asize)
               ^~~~~~~~~~~~~~~
   drivers/misc/habanalabs/common/habanalabs_ioctl.c:676:2: note: Taking fa=
lse branch
           if (hl_size > asize)
           ^
   drivers/misc/habanalabs/common/habanalabs_ioctl.c:681:6: note: Assuming =
the condition is false
           if (cmd & (IOC_IN | IOC_OUT)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/habanalabs/common/habanalabs_ioctl.c:681:2: note: Taking fa=
lse branch
           if (cmd & (IOC_IN | IOC_OUT)) {
           ^
   drivers/misc/habanalabs/common/habanalabs_ioctl.c:693:6: note: Assuming =
the condition is true
           if (cmd & IOC_IN) {
               ^~~~~~~~~~~~
   drivers/misc/habanalabs/common/habanalabs_ioctl.c:693:2: note: Taking tr=
ue branch
           if (cmd & IOC_IN) {
           ^
   drivers/misc/habanalabs/common/habanalabs_ioctl.c:694:22: note: Passing =
null pointer value via 1st parameter 'to'
                   if (copy_from_user(kdata, (void __user *)arg, usize)) {
                                      ^~~~~
   drivers/misc/habanalabs/common/habanalabs_ioctl.c:694:7: note: Calling '=
copy_from_user'
                   if (copy_from_user(kdata, (void __user *)arg, usize)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:191:2: note: Taking true branch
           if (likely(check_copy_size(to, n, false)))
           ^
   include/linux/uaccess.h:192:23: note: Passing null pointer value via 1st=
 parameter 'to'
                   n =3D _copy_from_user(to, from, n);
                                       ^~
   include/linux/uaccess.h:192:7: note: Calling '_copy_from_user'
                   n =3D _copy_from_user(to, from, n);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:157:6: note: Left side of '&&' is true
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
               ^
   include/linux/uaccess.h:157:33: note: Assuming the condition is false
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
                                          ^
   include/linux/compiler.h:77:20: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:157:2: note: Taking false branch
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
           ^
   include/linux/uaccess.h:161:6: note: Assuming 'res' is not equal to 0
           if (unlikely(res))
               ^
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   include/linux/uaccess.h:161:2: note: Taking true branch
           if (unlikely(res))
           ^
   include/linux/uaccess.h:162:3: note: Null pointer passed as 1st argument=
 to memory set function
                   memset(to + (n - res), 0, res);
                   ^      ~~~~~~~~~~~~~~
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
>> fs/jffs2/gc.c:846:3: warning: Argument to kfree() is the address of the =
local variable 'dev', which is not memory allocated by malloc() [clang-anal=
yzer-unix.Malloc]
                   kfree(mdata);
                   ^     ~~~~~
   fs/jffs2/gc.c:770:6: note: Assuming the condition is true
           if (S_ISBLK(JFFS2_F_I_MODE(f)) ||
               ^
   include/uapi/linux/stat.h:25:21: note: expanded from macro 'S_ISBLK'
   #define S_ISBLK(m)      (((m) & S_IFMT) =3D=3D S_IFBLK)
                            ^~~~~~~~~~~~~~~~~~~~~~~~~
   fs/jffs2/gc.c:770:33: note: Left side of '||' is true
           if (S_ISBLK(JFFS2_F_I_MODE(f)) ||
                                          ^
   fs/jffs2/gc.c:775:3: note: 0 is < 1
                   jffs2_dbg(1, "%s(): Writing %d bytes of kdev_t\n",
                   ^
   fs/jffs2/debug.h:69:6: note: expanded from macro 'jffs2_dbg'
           if (CONFIG_JFFS2_FS_DEBUG >=3D level)     \
               ^~~~~~~~~~~~~~~~~~~~~
   ./include/generated/autoconf.h:692:31: note: expanded from macro 'CONFIG=
_JFFS2_FS_DEBUG'
   #define CONFIG_JFFS2_FS_DEBUG 0
                                 ^
   fs/jffs2/gc.c:775:3: note: Taking false branch
                   jffs2_dbg(1, "%s(): Writing %d bytes of kdev_t\n",
                   ^
   fs/jffs2/debug.h:69:2: note: expanded from macro 'jffs2_dbg'
           if (CONFIG_JFFS2_FS_DEBUG >=3D level)     \
           ^
   fs/jffs2/gc.c:775:3: note: Loop condition is false.  Exiting loop
                   jffs2_dbg(1, "%s(): Writing %d bytes of kdev_t\n",
                   ^
   fs/jffs2/debug.h:67:37: note: expanded from macro 'jffs2_dbg'
   #define jffs2_dbg(level, fmt, ...)              \
                                                   ^
   fs/jffs2/gc.c:798:6: note: Assuming 'ret' is 0
           if (ret) {
               ^~~
   fs/jffs2/gc.c:798:2: note: Taking false branch
           if (ret) {
           ^
   fs/jffs2/gc.c:805:6: note: 'last_frag' is null
           if (last_frag)
               ^~~~~~~~~
   fs/jffs2/gc.c:805:2: note: Taking false branch
           if (last_frag)
           ^
   fs/jffs2/gc.c:824:25: note: Assuming '__UNIQUE_ID___x273' is <=3D '__UNI=
QUE_ID___y274'
           ri.atime =3D cpu_to_je32(JFFS2_F_I_ATIME(f));
                                  ^
   fs/jffs2/os-linux.h:40:28: note: expanded from macro 'JFFS2_F_I_ATIME'
   #define JFFS2_F_I_ATIME(f) I_SEC(OFNI_EDONI_2SFFJ(f)->i_atime)
                              ^
   fs/jffs2/os-linux.h:37:19: note: expanded from macro 'I_SEC'
   #define I_SEC(tv) JFFS2_CLAMP_TIME((tv).tv_sec)
                     ^
   fs/jffs2/os-linux.h:34:40: note: expanded from macro 'JFFS2_CLAMP_TIME'
   #define JFFS2_CLAMP_TIME(t) ((uint32_t)clamp_t(time64_t, (t), 0, U32_MAX=
))
                                          ^
   note: (skipping 6 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/minmax.h:38:14: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                              ^
   include/linux/minmax.h:31:25: note: expanded from macro '__cmp_once'
                   typeof(x) unique_x =3D (x);               \
                                         ^
   fs/jffs2/nodelist.h:37:36: note: expanded from macro 'cpu_to_je32'
   #define cpu_to_je32(x) ((jint32_t){x})
                                      ^
   fs/jffs2/gc.c:824:25: note: '?' condition is false
           ri.atime =3D cpu_to_je32(JFFS2_F_I_ATIME(f));
                                  ^
   fs/jffs2/os-linux.h:40:28: note: expanded from macro 'JFFS2_F_I_ATIME'
   #define JFFS2_F_I_ATIME(f) I_SEC(OFNI_EDONI_2SFFJ(f)->i_atime)
                              ^
   fs/jffs2/os-linux.h:37:19: note: expanded from macro 'I_SEC'
   #define I_SEC(tv) JFFS2_CLAMP_TIME((tv).tv_sec)
                     ^
   fs/jffs2/os-linux.h:34:40: note: expanded from macro 'JFFS2_CLAMP_TIME'
   #define JFFS2_CLAMP_TIME(t) ((uint32_t)clamp_t(time64_t, (t), 0, U32_MAX=
))
                                          ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^
   fs/jffs2/gc.c:824:25: note: '__UNIQUE_ID___x275' is < '__UNIQUE_ID___y27=
6'
           ri.atime =3D cpu_to_je32(JFFS2_F_I_ATIME(f));
                                  ^
   fs/jffs2/os-linux.h:40:28: note: expanded from macro 'JFFS2_F_I_ATIME'
   #define JFFS2_F_I_ATIME(f) I_SEC(OFNI_EDONI_2SFFJ(f)->i_atime)
                              ^
   fs/jffs2/os-linux.h:37:19: note: expanded from macro 'I_SEC'
   #define I_SEC(tv) JFFS2_CLAMP_TIME((tv).tv_sec)
                     ^
   fs/jffs2/os-linux.h:34:40: note: expanded from macro 'JFFS2_CLAMP_TIME'
   #define JFFS2_CLAMP_TIME(t) ((uint32_t)clamp_t(time64_t, (t), 0, U32_MAX=
))
                                          ^

vim +/dev +846 fs/jffs2/gc.c

^1da177e4c3f41 Linus Torvalds     2005-04-16  757  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  758  static int jffs2_garbage=
_collect_metadata(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb,
^1da177e4c3f41 Linus Torvalds     2005-04-16  759  					struct jffs2_inode_=
info *f, struct jffs2_full_dnode *fn)
^1da177e4c3f41 Linus Torvalds     2005-04-16  760  {
^1da177e4c3f41 Linus Torvalds     2005-04-16  761  	struct jffs2_full_dnode=
 *new_fn;
^1da177e4c3f41 Linus Torvalds     2005-04-16  762  	struct jffs2_raw_inode =
ri;
8557fd51c22e4c Artem B. Bityuckiy 2005-04-09  763  	struct jffs2_node_frag =
*last_frag;
aef9ab47841af4 David Woodhouse    2006-05-19  764  	union jffs2_device_node=
 dev;
2e16cfca6e17ae David Woodhouse    2009-12-16  765  	char *mdata =3D NULL;
2e16cfca6e17ae David Woodhouse    2009-12-16  766  	int mdatalen =3D 0;
9fe4854cd1f602 David Woodhouse    2006-05-23  767  	uint32_t alloclen, ilen;
^1da177e4c3f41 Linus Torvalds     2005-04-16  768  	int ret;
^1da177e4c3f41 Linus Torvalds     2005-04-16  769  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  770  	if (S_ISBLK(JFFS2_F_I_M=
ODE(f)) ||
^1da177e4c3f41 Linus Torvalds     2005-04-16  771  	    S_ISCHR(JFFS2_F_I_M=
ODE(f)) ) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  772  		/* For these, we don't=
 actually need to read the old node */
aef9ab47841af4 David Woodhouse    2006-05-19  773  		mdatalen =3D jffs2_enc=
ode_dev(&dev, JFFS2_F_I_RDEV(f));
^1da177e4c3f41 Linus Torvalds     2005-04-16  774  		mdata =3D (char *)&dev;
9c261b33a9c417 Joe Perches        2012-02-15  775  		jffs2_dbg(1, "%s(): Wr=
iting %d bytes of kdev_t\n",
9c261b33a9c417 Joe Perches        2012-02-15  776  			  __func__, mdatalen);
^1da177e4c3f41 Linus Torvalds     2005-04-16  777  	} else if (S_ISLNK(JFFS=
2_F_I_MODE(f))) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  778  		mdatalen =3D fn->size;
^1da177e4c3f41 Linus Torvalds     2005-04-16  779  		mdata =3D kmalloc(fn->=
size, GFP_KERNEL);
^1da177e4c3f41 Linus Torvalds     2005-04-16  780  		if (!mdata) {
da320f055a8818 Joe Perches        2012-02-15  781  			pr_warn("kmalloc of m=
data failed in jffs2_garbage_collect_metadata()\n");
^1da177e4c3f41 Linus Torvalds     2005-04-16  782  			return -ENOMEM;
^1da177e4c3f41 Linus Torvalds     2005-04-16  783  		}
^1da177e4c3f41 Linus Torvalds     2005-04-16  784  		ret =3D jffs2_read_dno=
de(c, f, fn, mdata, 0, mdatalen);
^1da177e4c3f41 Linus Torvalds     2005-04-16  785  		if (ret) {
da320f055a8818 Joe Perches        2012-02-15  786  			pr_warn("read of old =
metadata failed in jffs2_garbage_collect_metadata(): %d\n",
da320f055a8818 Joe Perches        2012-02-15  787  				ret);
^1da177e4c3f41 Linus Torvalds     2005-04-16  788  			kfree(mdata);
^1da177e4c3f41 Linus Torvalds     2005-04-16  789  			return ret;
^1da177e4c3f41 Linus Torvalds     2005-04-16  790  		}
9c261b33a9c417 Joe Perches        2012-02-15  791  		jffs2_dbg(1, "%s(): Wr=
iting %d bites of symlink target\n",
9c261b33a9c417 Joe Perches        2012-02-15  792  			  __func__, mdatalen);
^1da177e4c3f41 Linus Torvalds     2005-04-16  793  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  794  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  795  =

9fe4854cd1f602 David Woodhouse    2006-05-23  796  	ret =3D jffs2_reserve_s=
pace_gc(c, sizeof(ri) + mdatalen, &alloclen,
e631ddba588783 Ferenc Havasi      2005-09-07  797  				JFFS2_SUMMARY_INODE_=
SIZE);
^1da177e4c3f41 Linus Torvalds     2005-04-16  798  	if (ret) {
da320f055a8818 Joe Perches        2012-02-15  799  		pr_warn("jffs2_reserve=
_space_gc of %zd bytes for garbage_collect_metadata failed: %d\n",
^1da177e4c3f41 Linus Torvalds     2005-04-16  800  			sizeof(ri) + mdatalen=
, ret);
^1da177e4c3f41 Linus Torvalds     2005-04-16  801  		goto out;
^1da177e4c3f41 Linus Torvalds     2005-04-16  802  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  803  =

8557fd51c22e4c Artem B. Bityuckiy 2005-04-09  804  	last_frag =3D frag_last=
(&f->fragtree);
8557fd51c22e4c Artem B. Bityuckiy 2005-04-09  805  	if (last_frag)
8557fd51c22e4c Artem B. Bityuckiy 2005-04-09  806  		/* Fetch the inode len=
gth from the fragtree rather then
8557fd51c22e4c Artem B. Bityuckiy 2005-04-09  807  		 * from i_size since i=
_size may have not been updated yet */
8557fd51c22e4c Artem B. Bityuckiy 2005-04-09  808  		ilen =3D last_frag->of=
s + last_frag->size;
8557fd51c22e4c Artem B. Bityuckiy 2005-04-09  809  	else
8557fd51c22e4c Artem B. Bityuckiy 2005-04-09  810  		ilen =3D JFFS2_F_I_SIZ=
E(f);
8557fd51c22e4c Artem B. Bityuckiy 2005-04-09  811  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  812  	memset(&ri, 0, sizeof(r=
i));
^1da177e4c3f41 Linus Torvalds     2005-04-16  813  	ri.magic =3D cpu_to_je1=
6(JFFS2_MAGIC_BITMASK);
^1da177e4c3f41 Linus Torvalds     2005-04-16  814  	ri.nodetype =3D cpu_to_=
je16(JFFS2_NODETYPE_INODE);
^1da177e4c3f41 Linus Torvalds     2005-04-16  815  	ri.totlen =3D cpu_to_je=
32(sizeof(ri) + mdatalen);
^1da177e4c3f41 Linus Torvalds     2005-04-16  816  	ri.hdr_crc =3D cpu_to_j=
e32(crc32(0, &ri, sizeof(struct jffs2_unknown_node)-4));
^1da177e4c3f41 Linus Torvalds     2005-04-16  817  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  818  	ri.ino =3D cpu_to_je32(=
f->inocache->ino);
^1da177e4c3f41 Linus Torvalds     2005-04-16  819  	ri.version =3D cpu_to_j=
e32(++f->highest_version);
^1da177e4c3f41 Linus Torvalds     2005-04-16  820  	ri.mode =3D cpu_to_jemo=
de(JFFS2_F_I_MODE(f));
^1da177e4c3f41 Linus Torvalds     2005-04-16  821  	ri.uid =3D cpu_to_je16(=
JFFS2_F_I_UID(f));
^1da177e4c3f41 Linus Torvalds     2005-04-16  822  	ri.gid =3D cpu_to_je16(=
JFFS2_F_I_GID(f));
8557fd51c22e4c Artem B. Bityuckiy 2005-04-09  823  	ri.isize =3D cpu_to_je3=
2(ilen);
^1da177e4c3f41 Linus Torvalds     2005-04-16  824  	ri.atime =3D cpu_to_je3=
2(JFFS2_F_I_ATIME(f));
^1da177e4c3f41 Linus Torvalds     2005-04-16  825  	ri.ctime =3D cpu_to_je3=
2(JFFS2_F_I_CTIME(f));
^1da177e4c3f41 Linus Torvalds     2005-04-16  826  	ri.mtime =3D cpu_to_je3=
2(JFFS2_F_I_MTIME(f));
^1da177e4c3f41 Linus Torvalds     2005-04-16  827  	ri.offset =3D cpu_to_je=
32(0);
^1da177e4c3f41 Linus Torvalds     2005-04-16  828  	ri.csize =3D cpu_to_je3=
2(mdatalen);
^1da177e4c3f41 Linus Torvalds     2005-04-16  829  	ri.dsize =3D cpu_to_je3=
2(mdatalen);
^1da177e4c3f41 Linus Torvalds     2005-04-16  830  	ri.compr =3D JFFS2_COMP=
R_NONE;
^1da177e4c3f41 Linus Torvalds     2005-04-16  831  	ri.node_crc =3D cpu_to_=
je32(crc32(0, &ri, sizeof(ri)-8));
^1da177e4c3f41 Linus Torvalds     2005-04-16  832  	ri.data_crc =3D cpu_to_=
je32(crc32(0, mdata, mdatalen));
^1da177e4c3f41 Linus Torvalds     2005-04-16  833  =

9fe4854cd1f602 David Woodhouse    2006-05-23  834  	new_fn =3D jffs2_write_=
dnode(c, f, &ri, mdata, mdatalen, ALLOC_GC);
^1da177e4c3f41 Linus Torvalds     2005-04-16  835  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  836  	if (IS_ERR(new_fn)) {
da320f055a8818 Joe Perches        2012-02-15  837  		pr_warn("Error writing=
 new dnode: %ld\n", PTR_ERR(new_fn));
^1da177e4c3f41 Linus Torvalds     2005-04-16  838  		ret =3D PTR_ERR(new_fn=
);
^1da177e4c3f41 Linus Torvalds     2005-04-16  839  		goto out;
^1da177e4c3f41 Linus Torvalds     2005-04-16  840  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  841  	jffs2_mark_node_obsolet=
e(c, fn->raw);
^1da177e4c3f41 Linus Torvalds     2005-04-16  842  	jffs2_free_full_dnode(f=
n);
^1da177e4c3f41 Linus Torvalds     2005-04-16  843  	f->metadata =3D new_fn;
^1da177e4c3f41 Linus Torvalds     2005-04-16  844   out:
^1da177e4c3f41 Linus Torvalds     2005-04-16  845  	if (S_ISLNK(JFFS2_F_I_M=
ODE(f)))
^1da177e4c3f41 Linus Torvalds     2005-04-16 @846  		kfree(mdata);
^1da177e4c3f41 Linus Torvalds     2005-04-16  847  	return ret;
^1da177e4c3f41 Linus Torvalds     2005-04-16  848  }
^1da177e4c3f41 Linus Torvalds     2005-04-16  849  =


:::::: The code at line 846 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============5607481342015777424==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============5607481342015777424==--

