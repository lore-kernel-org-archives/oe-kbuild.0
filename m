Content-Type: multipart/mixed; boundary="===============3881457693272864025=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: fs/jffs2/gc.c:846:3: warning: Argument to kfree() is the address of the local variable 'dev', which is not memory allocated by malloc() [clang-analyzer-unix.Malloc]
Date: Mon, 18 Jul 2022 09:44:41 +0800
Message-ID: <202207180916.PptAVyap-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3881457693272864025==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check first_new_problem:=
 fs/jffs2/gc.c:846:3: warning: Argument to kfree() is the address of the lo=
cal variable 'dev', which is not memory allocated by malloc() [clang-analyz=
er-unix.Malloc]"
:::::: =


CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Chris Down <chris@chrisdown.name>
CC: Petr Mladek <pmladek@suse.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   ff6992735ade75aae3e35d16b17da1008d753d28
commit: 337015573718b161891a3473d25f59273f2e626b printk: Userspace format i=
ndexing support
date:   12 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 12 months ago
config: s390-randconfig-c005-20220715 (https://download.01.org/0day-ci/arch=
ive/20220718/202207180916.PptAVyap-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 2da550=
140aa98cf6a3e96417c87f1e89e3a26047)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D337015573718b161891a3473d25f59273f2e626b
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 337015573718b161891a3473d25f59273f2e626b
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Ds390 clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   fs/jffs2/gc.c:310:2: note: 0 is < 1
           jffs2_dbg(1, "Going to garbage collect node@0x%08x\n",
           ^
   fs/jffs2/debug.h:69:6: note: expanded from macro 'jffs2_dbg'
           if (CONFIG_JFFS2_FS_DEBUG >=3D level)     \
               ^~~~~~~~~~~~~~~~~~~~~
   ./include/generated/autoconf.h:384:31: note: expanded from macro 'CONFIG=
_JFFS2_FS_DEBUG'
   #define CONFIG_JFFS2_FS_DEBUG 0
                                 ^
   fs/jffs2/gc.c:310:2: note: Taking false branch
           jffs2_dbg(1, "Going to garbage collect node at 0x%08x\n",
           ^
   fs/jffs2/debug.h:69:2: note: expanded from macro 'jffs2_dbg'
           if (CONFIG_JFFS2_FS_DEBUG >=3D level)     \
           ^
   fs/jffs2/gc.c:310:2: note: Loop condition is false.  Exiting loop
           jffs2_dbg(1, "Going to garbage collect node at 0x%08x\n",
           ^
   fs/jffs2/debug.h:67:37: note: expanded from macro 'jffs2_dbg'
   #define jffs2_dbg(level, fmt, ...)              \
                                                   ^
   fs/jffs2/gc.c:313:6: note: Assuming field 'next_in_ino' is non-null
           if (!raw->next_in_ino) {
               ^~~~~~~~~~~~~~~~~
   fs/jffs2/gc.c:313:2: note: Taking false branch
           if (!raw->next_in_ino) {
           ^
   fs/jffs2/gc.c:332:6: note: Assuming field 'class' is not equal to RAWNOD=
E_CLASS_XATTR_DATUM
           if (ic->class =3D=3D RAWNODE_CLASS_XATTR_DATUM
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/jffs2/gc.c:332:6: note: Left side of '||' is false
   fs/jffs2/gc.c:333:9: note: Assuming field 'class' is not equal to RAWNOD=
E_CLASS_XATTR_REF
               || ic->class =3D=3D RAWNODE_CLASS_XATTR_REF) {
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/jffs2/gc.c:332:2: note: Taking false branch
           if (ic->class =3D=3D RAWNODE_CLASS_XATTR_DATUM
           ^
   fs/jffs2/gc.c:352:2: note: 0 is < 1
           jffs2_dbg(1, "%s(): collecting from block @0x%08x. Node @0x%08x(=
%d), ino #%u\n",
           ^
   fs/jffs2/debug.h:69:6: note: expanded from macro 'jffs2_dbg'
           if (CONFIG_JFFS2_FS_DEBUG >=3D level)     \
               ^~~~~~~~~~~~~~~~~~~~~
   ./include/generated/autoconf.h:384:31: note: expanded from macro 'CONFIG=
_JFFS2_FS_DEBUG'
   #define CONFIG_JFFS2_FS_DEBUG 0
                                 ^
   fs/jffs2/gc.c:352:2: note: Taking false branch
           jffs2_dbg(1, "%s(): collecting from block @0x%08x. Node @0x%08x(=
%d), ino #%u\n",
           ^
   fs/jffs2/debug.h:69:2: note: expanded from macro 'jffs2_dbg'
           if (CONFIG_JFFS2_FS_DEBUG >=3D level)     \
           ^
   fs/jffs2/gc.c:352:2: note: Loop condition is false.  Exiting loop
           jffs2_dbg(1, "%s(): collecting from block @0x%08x. Node @0x%08x(=
%d), ino #%u\n",
           ^
   fs/jffs2/debug.h:67:37: note: expanded from macro 'jffs2_dbg'
   #define jffs2_dbg(level, fmt, ...)              \
                                                   ^
   fs/jffs2/gc.c:365:2: note: Control jumps to 'case 5:'  at line 397
           switch(ic->state) {
           ^
   fs/jffs2/gc.c:405:3: note: 0 is < 1
                   jffs2_dbg(1, "%s(): waiting for ino #%u in state %d\n",
                   ^
   fs/jffs2/debug.h:69:6: note: expanded from macro 'jffs2_dbg'
           if (CONFIG_JFFS2_FS_DEBUG >=3D level)     \
               ^~~~~~~~~~~~~~~~~~~~~
   ./include/generated/autoconf.h:384:31: note: expanded from macro 'CONFIG=
_JFFS2_FS_DEBUG'
   #define CONFIG_JFFS2_FS_DEBUG 0
                                 ^
   fs/jffs2/gc.c:405:3: note: Taking false branch
                   jffs2_dbg(1, "%s(): waiting for ino #%u in state %d\n",
                   ^
   fs/jffs2/debug.h:69:2: note: expanded from macro 'jffs2_dbg'
           if (CONFIG_JFFS2_FS_DEBUG >=3D level)     \
           ^
   fs/jffs2/gc.c:405:3: note: Loop condition is false.  Exiting loop
                   jffs2_dbg(1, "%s(): waiting for ino #%u in state %d\n",
                   ^
   fs/jffs2/debug.h:67:37: note: expanded from macro 'jffs2_dbg'
   #define jffs2_dbg(level, fmt, ...)              \
                                                   ^
   fs/jffs2/gc.c:407:3: note: Dereference of null pointer
                   sleep_on_spinunlock(&c->inocache_wq, &c->inocache_lock);
                   ^
   fs/jffs2/os-linux.h:43:29: note: expanded from macro 'sleep_on_spinunloc=
k'
                   DECLARE_WAITQUEUE(__wait, current);             \
                   ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:200:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   include/linux/wait.h:55:63: note: expanded from macro 'DECLARE_WAITQUEUE'
           struct wait_queue_entry name =3D __WAITQUEUE_INITIALIZER(name, t=
sk)
                                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   include/linux/wait.h:50:13: note: expanded from macro '__WAITQUEUE_INITI=
ALIZER'
           .private        =3D tsk,                                        =
          \
                             ^~~
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
   ./include/generated/autoconf.h:384:31: note: expanded from macro 'CONFIG=
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
   fs/jffs2/gc.c:824:25: note: Assuming '__UNIQUE_ID___x281' is <=3D '__UNI=
QUE_ID___y282'
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
   fs/jffs2/gc.c:824:25: note: '__UNIQUE_ID___x283' is < '__UNIQUE_ID___y28=
4'
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

^1da177e4c3f415 Linus Torvalds     2005-04-16  757  =

^1da177e4c3f415 Linus Torvalds     2005-04-16  758  static int jffs2_garbag=
e_collect_metadata(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb,
^1da177e4c3f415 Linus Torvalds     2005-04-16  759  					struct jffs2_inode=
_info *f, struct jffs2_full_dnode *fn)
^1da177e4c3f415 Linus Torvalds     2005-04-16  760  {
^1da177e4c3f415 Linus Torvalds     2005-04-16  761  	struct jffs2_full_dnod=
e *new_fn;
^1da177e4c3f415 Linus Torvalds     2005-04-16  762  	struct jffs2_raw_inode=
 ri;
8557fd51c22e4c2 Artem B. Bityuckiy 2005-04-09  763  	struct jffs2_node_frag=
 *last_frag;
aef9ab47841af45 David Woodhouse    2006-05-19  764  	union jffs2_device_nod=
e dev;
2e16cfca6e17ae3 David Woodhouse    2009-12-16  765  	char *mdata =3D NULL;
2e16cfca6e17ae3 David Woodhouse    2009-12-16  766  	int mdatalen =3D 0;
9fe4854cd1f6027 David Woodhouse    2006-05-23  767  	uint32_t alloclen, ile=
n;
^1da177e4c3f415 Linus Torvalds     2005-04-16  768  	int ret;
^1da177e4c3f415 Linus Torvalds     2005-04-16  769  =

^1da177e4c3f415 Linus Torvalds     2005-04-16  770  	if (S_ISBLK(JFFS2_F_I_=
MODE(f)) ||
^1da177e4c3f415 Linus Torvalds     2005-04-16  771  	    S_ISCHR(JFFS2_F_I_=
MODE(f)) ) {
^1da177e4c3f415 Linus Torvalds     2005-04-16  772  		/* For these, we don'=
t actually need to read the old node */
aef9ab47841af45 David Woodhouse    2006-05-19  773  		mdatalen =3D jffs2_en=
code_dev(&dev, JFFS2_F_I_RDEV(f));
^1da177e4c3f415 Linus Torvalds     2005-04-16  774  		mdata =3D (char *)&de=
v;
9c261b33a9c417c Joe Perches        2012-02-15  775  		jffs2_dbg(1, "%s(): W=
riting %d bytes of kdev_t\n",
9c261b33a9c417c Joe Perches        2012-02-15  776  			  __func__, mdatalen=
);
^1da177e4c3f415 Linus Torvalds     2005-04-16  777  	} else if (S_ISLNK(JFF=
S2_F_I_MODE(f))) {
^1da177e4c3f415 Linus Torvalds     2005-04-16  778  		mdatalen =3D fn->size;
^1da177e4c3f415 Linus Torvalds     2005-04-16  779  		mdata =3D kmalloc(fn-=
>size, GFP_KERNEL);
^1da177e4c3f415 Linus Torvalds     2005-04-16  780  		if (!mdata) {
da320f055a88182 Joe Perches        2012-02-15  781  			pr_warn("kmalloc of =
mdata failed in jffs2_garbage_collect_metadata()\n");
^1da177e4c3f415 Linus Torvalds     2005-04-16  782  			return -ENOMEM;
^1da177e4c3f415 Linus Torvalds     2005-04-16  783  		}
^1da177e4c3f415 Linus Torvalds     2005-04-16  784  		ret =3D jffs2_read_dn=
ode(c, f, fn, mdata, 0, mdatalen);
^1da177e4c3f415 Linus Torvalds     2005-04-16  785  		if (ret) {
da320f055a88182 Joe Perches        2012-02-15  786  			pr_warn("read of old=
 metadata failed in jffs2_garbage_collect_metadata(): %d\n",
da320f055a88182 Joe Perches        2012-02-15  787  				ret);
^1da177e4c3f415 Linus Torvalds     2005-04-16  788  			kfree(mdata);
^1da177e4c3f415 Linus Torvalds     2005-04-16  789  			return ret;
^1da177e4c3f415 Linus Torvalds     2005-04-16  790  		}
9c261b33a9c417c Joe Perches        2012-02-15  791  		jffs2_dbg(1, "%s(): W=
riting %d bites of symlink target\n",
9c261b33a9c417c Joe Perches        2012-02-15  792  			  __func__, mdatalen=
);
^1da177e4c3f415 Linus Torvalds     2005-04-16  793  =

^1da177e4c3f415 Linus Torvalds     2005-04-16  794  	}
^1da177e4c3f415 Linus Torvalds     2005-04-16  795  =

9fe4854cd1f6027 David Woodhouse    2006-05-23  796  	ret =3D jffs2_reserve_=
space_gc(c, sizeof(ri) + mdatalen, &alloclen,
e631ddba588783e Ferenc Havasi      2005-09-07  797  				JFFS2_SUMMARY_INODE=
_SIZE);
^1da177e4c3f415 Linus Torvalds     2005-04-16  798  	if (ret) {
da320f055a88182 Joe Perches        2012-02-15  799  		pr_warn("jffs2_reserv=
e_space_gc of %zd bytes for garbage_collect_metadata failed: %d\n",
^1da177e4c3f415 Linus Torvalds     2005-04-16  800  			sizeof(ri) + mdatale=
n, ret);
^1da177e4c3f415 Linus Torvalds     2005-04-16  801  		goto out;
^1da177e4c3f415 Linus Torvalds     2005-04-16  802  	}
^1da177e4c3f415 Linus Torvalds     2005-04-16  803  =

8557fd51c22e4c2 Artem B. Bityuckiy 2005-04-09  804  	last_frag =3D frag_las=
t(&f->fragtree);
8557fd51c22e4c2 Artem B. Bityuckiy 2005-04-09  805  	if (last_frag)
8557fd51c22e4c2 Artem B. Bityuckiy 2005-04-09  806  		/* Fetch the inode le=
ngth from the fragtree rather then
8557fd51c22e4c2 Artem B. Bityuckiy 2005-04-09  807  		 * from i_size since =
i_size may have not been updated yet */
8557fd51c22e4c2 Artem B. Bityuckiy 2005-04-09  808  		ilen =3D last_frag->o=
fs + last_frag->size;
8557fd51c22e4c2 Artem B. Bityuckiy 2005-04-09  809  	else
8557fd51c22e4c2 Artem B. Bityuckiy 2005-04-09  810  		ilen =3D JFFS2_F_I_SI=
ZE(f);
8557fd51c22e4c2 Artem B. Bityuckiy 2005-04-09  811  =

^1da177e4c3f415 Linus Torvalds     2005-04-16  812  	memset(&ri, 0, sizeof(=
ri));
^1da177e4c3f415 Linus Torvalds     2005-04-16  813  	ri.magic =3D cpu_to_je=
16(JFFS2_MAGIC_BITMASK);
^1da177e4c3f415 Linus Torvalds     2005-04-16  814  	ri.nodetype =3D cpu_to=
_je16(JFFS2_NODETYPE_INODE);
^1da177e4c3f415 Linus Torvalds     2005-04-16  815  	ri.totlen =3D cpu_to_j=
e32(sizeof(ri) + mdatalen);
^1da177e4c3f415 Linus Torvalds     2005-04-16  816  	ri.hdr_crc =3D cpu_to_=
je32(crc32(0, &ri, sizeof(struct jffs2_unknown_node)-4));
^1da177e4c3f415 Linus Torvalds     2005-04-16  817  =

^1da177e4c3f415 Linus Torvalds     2005-04-16  818  	ri.ino =3D cpu_to_je32=
(f->inocache->ino);
^1da177e4c3f415 Linus Torvalds     2005-04-16  819  	ri.version =3D cpu_to_=
je32(++f->highest_version);
^1da177e4c3f415 Linus Torvalds     2005-04-16  820  	ri.mode =3D cpu_to_jem=
ode(JFFS2_F_I_MODE(f));
^1da177e4c3f415 Linus Torvalds     2005-04-16  821  	ri.uid =3D cpu_to_je16=
(JFFS2_F_I_UID(f));
^1da177e4c3f415 Linus Torvalds     2005-04-16  822  	ri.gid =3D cpu_to_je16=
(JFFS2_F_I_GID(f));
8557fd51c22e4c2 Artem B. Bityuckiy 2005-04-09  823  	ri.isize =3D cpu_to_je=
32(ilen);
^1da177e4c3f415 Linus Torvalds     2005-04-16  824  	ri.atime =3D cpu_to_je=
32(JFFS2_F_I_ATIME(f));
^1da177e4c3f415 Linus Torvalds     2005-04-16  825  	ri.ctime =3D cpu_to_je=
32(JFFS2_F_I_CTIME(f));
^1da177e4c3f415 Linus Torvalds     2005-04-16  826  	ri.mtime =3D cpu_to_je=
32(JFFS2_F_I_MTIME(f));
^1da177e4c3f415 Linus Torvalds     2005-04-16  827  	ri.offset =3D cpu_to_j=
e32(0);
^1da177e4c3f415 Linus Torvalds     2005-04-16  828  	ri.csize =3D cpu_to_je=
32(mdatalen);
^1da177e4c3f415 Linus Torvalds     2005-04-16  829  	ri.dsize =3D cpu_to_je=
32(mdatalen);
^1da177e4c3f415 Linus Torvalds     2005-04-16  830  	ri.compr =3D JFFS2_COM=
PR_NONE;
^1da177e4c3f415 Linus Torvalds     2005-04-16  831  	ri.node_crc =3D cpu_to=
_je32(crc32(0, &ri, sizeof(ri)-8));
^1da177e4c3f415 Linus Torvalds     2005-04-16  832  	ri.data_crc =3D cpu_to=
_je32(crc32(0, mdata, mdatalen));
^1da177e4c3f415 Linus Torvalds     2005-04-16  833  =

9fe4854cd1f6027 David Woodhouse    2006-05-23  834  	new_fn =3D jffs2_write=
_dnode(c, f, &ri, mdata, mdatalen, ALLOC_GC);
^1da177e4c3f415 Linus Torvalds     2005-04-16  835  =

^1da177e4c3f415 Linus Torvalds     2005-04-16  836  	if (IS_ERR(new_fn)) {
da320f055a88182 Joe Perches        2012-02-15  837  		pr_warn("Error writin=
g new dnode: %ld\n", PTR_ERR(new_fn));
^1da177e4c3f415 Linus Torvalds     2005-04-16  838  		ret =3D PTR_ERR(new_f=
n);
^1da177e4c3f415 Linus Torvalds     2005-04-16  839  		goto out;
^1da177e4c3f415 Linus Torvalds     2005-04-16  840  	}
^1da177e4c3f415 Linus Torvalds     2005-04-16  841  	jffs2_mark_node_obsole=
te(c, fn->raw);
^1da177e4c3f415 Linus Torvalds     2005-04-16  842  	jffs2_free_full_dnode(=
fn);
^1da177e4c3f415 Linus Torvalds     2005-04-16  843  	f->metadata =3D new_fn;
^1da177e4c3f415 Linus Torvalds     2005-04-16  844   out:
^1da177e4c3f415 Linus Torvalds     2005-04-16  845  	if (S_ISLNK(JFFS2_F_I_=
MODE(f)))
^1da177e4c3f415 Linus Torvalds     2005-04-16 @846  		kfree(mdata);
^1da177e4c3f415 Linus Torvalds     2005-04-16  847  	return ret;
^1da177e4c3f415 Linus Torvalds     2005-04-16  848  }
^1da177e4c3f415 Linus Torvalds     2005-04-16  849  =


:::::: The code at line 846 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3881457693272864025==--

