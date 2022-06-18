Content-Type: multipart/mixed; boundary="===============8213379316643261814=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: fs/hfs/bnode.c:162:9: warning: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
Date: Sat, 18 Jun 2022 18:09:06 +0800
Message-ID: <202206181808.hLdNt0zc-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8213379316643261814==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: fs/hfs/bn=
ode.c:162:9: warning: Assigned value is garbage or undefined [clang-analyze=
r-core.uninitialized.Assign]"
:::::: =


CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
CC: Viacheslav Dubeyko <slava@dubeyko.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   4b35035bcf80ddb47c0112c4fbd84a63a2836a18
commit: 54a5ead6f5e2b47131a7385d0c0af18e7b89cb02 hfs: fix high memory mappi=
ng in hfs_bnode_read
date:   11 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 11 months ago
config: s390-randconfig-c005-20220616 (https://download.01.org/0day-ci/arch=
ive/20220618/202206181808.hLdNt0zc-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project f0e608=
de27b3d568000046eebf3712ab542979d6)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D54a5ead6f5e2b47131a7385d0c0af18e7b89cb02
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 54a5ead6f5e2b47131a7385d0c0af18e7b89cb02
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Ds390 clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   fs/hfs/bnode.c:346:6: note: Assuming 'node' is non-null
           if (!node)
               ^~~~~
   fs/hfs/bnode.c:346:2: note: Taking false branch
           if (!node)
           ^
   fs/hfs/bnode.c:348:6: note: Assuming the condition is false
           if (test_bit(HFS_BNODE_ERROR, &node->flags))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/hfs/bnode.c:348:2: note: Taking false branch
           if (test_bit(HFS_BNODE_ERROR, &node->flags))
           ^
   fs/hfs/bnode.c:350:6: note: Assuming the condition is false
           if (!test_bit(HFS_BNODE_NEW, &node->flags))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/hfs/bnode.c:350:2: note: Taking false branch
           if (!test_bit(HFS_BNODE_NEW, &node->flags))
           ^
   fs/hfs/bnode.c:361:2: note: Control jumps to 'case 255:'  at line 367
           switch (node->type) {
           ^
   fs/hfs/bnode.c:368:7: note: Assuming field 'height' is equal to 1
                   if (node->height !=3D 1)
                       ^~~~~~~~~~~~~~~~~
   fs/hfs/bnode.c:368:3: note: Taking false branch
                   if (node->height !=3D 1)
                   ^
   fs/hfs/bnode.c:370:3: note:  Execution continues on line 379
                   break;
                   ^
   fs/hfs/bnode.c:380:8: note: Calling 'hfs_bnode_read_u16'
           off =3D hfs_bnode_read_u16(node, rec_off);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/hfs/bnode.c:47:2: note: 'data' declared without an initial value
           __be16 data;
           ^~~~~~~~~~~
   fs/hfs/bnode.c:49:2: note: Calling 'hfs_bnode_read'
           hfs_bnode_read(node, &data, off, 2);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/hfs/bnode.c:30:2: note: Loop condition is true.  Entering loop body
           for (bytes_read =3D 0; bytes_read < len; bytes_read +=3D bytes_t=
o_read) {
           ^
   fs/hfs/bnode.c:31:7: note: Assuming 'pagenum' is >=3D field 'pages_per_b=
node'
                   if (pagenum >=3D node->tree->pages_per_bnode)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/hfs/bnode.c:31:3: note: Taking true branch
                   if (pagenum >=3D node->tree->pages_per_bnode)
                   ^
   fs/hfs/bnode.c:32:4: note:  Execution continues on line 31
                           break;
                           ^
   fs/hfs/bnode.c:43:1: note: Returning without writing to '*buf'
   }
   ^
   fs/hfs/bnode.c:49:2: note: Returning from 'hfs_bnode_read'
           hfs_bnode_read(node, &data, off, 2);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/hfs/bnode.c:50:2: note: Undefined or garbage value returned to caller
           return be16_to_cpu(data);
           ^
   fs/hfs/bnode.c:58:2: warning: Undefined or garbage value returned to cal=
ler [clang-analyzer-core.uninitialized.UndefReturn]
           return data;
           ^
   fs/hfs/bnode.c:67:6: note: Assuming field 'type' is equal to HFS_NODE_LE=
AF
           if (node->type =3D=3D HFS_NODE_LEAF ||
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/hfs/bnode.c:67:34: note: Left side of '||' is true
           if (node->type =3D=3D HFS_NODE_LEAF ||
                                           ^
   fs/hfs/bnode.c:69:13: note: Calling 'hfs_bnode_read_u8'
                   key_len =3D hfs_bnode_read_u8(node, off) + 1;
                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/hfs/bnode.c:55:2: note: 'data' declared without an initial value
           u8 data;
           ^~~~~~~
   fs/hfs/bnode.c:57:2: note: Calling 'hfs_bnode_read'
           hfs_bnode_read(node, &data, off, 1);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/hfs/bnode.c:30:2: note: Loop condition is true.  Entering loop body
           for (bytes_read =3D 0; bytes_read < len; bytes_read +=3D bytes_t=
o_read) {
           ^
   fs/hfs/bnode.c:31:7: note: Assuming 'pagenum' is >=3D field 'pages_per_b=
node'
                   if (pagenum >=3D node->tree->pages_per_bnode)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/hfs/bnode.c:31:3: note: Taking true branch
                   if (pagenum >=3D node->tree->pages_per_bnode)
                   ^
   fs/hfs/bnode.c:32:4: note:  Execution continues on line 31
                           break;
                           ^
   fs/hfs/bnode.c:43:1: note: Returning without writing to '*buf'
   }
   ^
   fs/hfs/bnode.c:57:2: note: Returning from 'hfs_bnode_read'
           hfs_bnode_read(node, &data, off, 1);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/hfs/bnode.c:58:2: note: Undefined or garbage value returned to caller
           return data;
           ^      ~~~~
>> fs/hfs/bnode.c:162:9: warning: Assigned value is garbage or undefined [c=
lang-analyzer-core.uninitialized.Assign]
           for (i =3D be16_to_cpu(desc.num_recs); i >=3D 0; off -=3D 2, i--=
) {
                  ^
   fs/hfs/bnode.c:155:2: note: Taking false branch
           hfs_dbg(BNODE_MOD, "bnode: %d\n", node->this);
           ^
   fs/hfs/hfs_fs.h:45:2: note: expanded from macro 'hfs_dbg'
           if (DBG_##flg & DBG_MASK)                               \
           ^
   fs/hfs/bnode.c:155:2: note: Loop condition is false.  Exiting loop
           hfs_dbg(BNODE_MOD, "bnode: %d\n", node->this);
           ^
   fs/hfs/hfs_fs.h:43:36: note: expanded from macro 'hfs_dbg'
   #define hfs_dbg(flg, fmt, ...)                                  \
                                                                   ^
   fs/hfs/bnode.c:156:2: note: Calling 'hfs_bnode_read'
           hfs_bnode_read(node, &desc, 0, sizeof(desc));
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/hfs/bnode.c:30:2: note: Loop condition is true.  Entering loop body
           for (bytes_read =3D 0; bytes_read < len; bytes_read +=3D bytes_t=
o_read) {
           ^
   fs/hfs/bnode.c:31:7: note: Assuming 'pagenum' is >=3D field 'pages_per_b=
node'
                   if (pagenum >=3D node->tree->pages_per_bnode)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/hfs/bnode.c:31:3: note: Taking true branch
                   if (pagenum >=3D node->tree->pages_per_bnode)
                   ^
   fs/hfs/bnode.c:32:4: note:  Execution continues on line 31
                           break;
                           ^
   fs/hfs/bnode.c:43:1: note: Returning without writing to 'buf->num_recs'
   }
   ^
   fs/hfs/bnode.c:156:2: note: Returning from 'hfs_bnode_read'
           hfs_bnode_read(node, &desc, 0, sizeof(desc));
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/hfs/bnode.c:157:2: note: Taking false branch
           hfs_dbg(BNODE_MOD, "%d, %d, %d, %d, %d\n",
           ^
   fs/hfs/hfs_fs.h:45:2: note: expanded from macro 'hfs_dbg'
           if (DBG_##flg & DBG_MASK)                               \
           ^
   fs/hfs/bnode.c:157:2: note: Loop condition is false.  Exiting loop
           hfs_dbg(BNODE_MOD, "%d, %d, %d, %d, %d\n",
           ^
   fs/hfs/hfs_fs.h:43:36: note: expanded from macro 'hfs_dbg'
   #define hfs_dbg(flg, fmt, ...)                                  \
                                                                   ^
   fs/hfs/bnode.c:162:9: note: Assigned value is garbage or undefined
           for (i =3D be16_to_cpu(desc.num_recs); i >=3D 0; off -=3D 2, i--=
) {
                  ^
   fs/hfs/bnode.c:179:4: warning: Value stored to 'tmp' is never read [clan=
g-analyzer-deadcode.DeadStores]
                           tmp =3D hfs_bnode_read_u8(node, key_off);
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/hfs/bnode.c:179:4: note: Value stored to 'tmp' is never read
                           tmp =3D hfs_bnode_read_u8(node, key_off);
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:229:2: warning: Dereference of null pointer [cla=
ng-analyzer-core.NullDereference]
           current->pagefault_disabled++;
           ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:200:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   fs/hfs/bnode.c:155:2: note: Taking false branch
           hfs_dbg(BNODE_MOD, "bnode: %d\n", node->this);
           ^
   fs/hfs/hfs_fs.h:45:2: note: expanded from macro 'hfs_dbg'
           if (DBG_##flg & DBG_MASK)                               \
           ^
   fs/hfs/bnode.c:155:2: note: Loop condition is false.  Exiting loop
           hfs_dbg(BNODE_MOD, "bnode: %d\n", node->this);
           ^
   fs/hfs/hfs_fs.h:43:36: note: expanded from macro 'hfs_dbg'
   #define hfs_dbg(flg, fmt, ...)                                  \
                                                                   ^
   fs/hfs/bnode.c:156:2: note: Calling 'hfs_bnode_read'
           hfs_bnode_read(node, &desc, 0, sizeof(desc));
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/hfs/bnode.c:30:2: note: Loop condition is true.  Entering loop body
           for (bytes_read =3D 0; bytes_read < len; bytes_read +=3D bytes_t=
o_read) {
           ^
   fs/hfs/bnode.c:31:7: note: Assuming 'pagenum' is < field 'pages_per_bnod=
e'
                   if (pagenum >=3D node->tree->pages_per_bnode)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/hfs/bnode.c:31:3: note: Taking false branch
                   if (pagenum >=3D node->tree->pages_per_bnode)
                   ^
   fs/hfs/bnode.c:34:19: note: Assuming '__UNIQUE_ID___x336' is >=3D '__UNI=
QUE_ID___y337'
                   bytes_to_read =3D min_t(int, len - bytes_read, PAGE_SIZE=
 - off);
                                   ^
   include/linux/minmax.h:104:27: note: expanded from macro 'min_t'
   #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })

vim +162 fs/hfs/bnode.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  148  =

^1da177e4c3f41 Linus Torvalds 2005-04-16  149  void hfs_bnode_dump(struct h=
fs_bnode *node)
^1da177e4c3f41 Linus Torvalds 2005-04-16  150  {
^1da177e4c3f41 Linus Torvalds 2005-04-16  151  	struct hfs_bnode_desc desc;
^1da177e4c3f41 Linus Torvalds 2005-04-16  152  	__be32 cnid;
^1da177e4c3f41 Linus Torvalds 2005-04-16  153  	int i, off, key_off;
^1da177e4c3f41 Linus Torvalds 2005-04-16  154  =

c2b3e1f76e5c90 Joe Perches    2013-04-30  155  	hfs_dbg(BNODE_MOD, "bnode: =
%d\n", node->this);
^1da177e4c3f41 Linus Torvalds 2005-04-16  156  	hfs_bnode_read(node, &desc,=
 0, sizeof(desc));
c2b3e1f76e5c90 Joe Perches    2013-04-30  157  	hfs_dbg(BNODE_MOD, "%d, %d,=
 %d, %d, %d\n",
^1da177e4c3f41 Linus Torvalds 2005-04-16  158  		be32_to_cpu(desc.next), be=
32_to_cpu(desc.prev),
^1da177e4c3f41 Linus Torvalds 2005-04-16  159  		desc.type, desc.height, be=
16_to_cpu(desc.num_recs));
^1da177e4c3f41 Linus Torvalds 2005-04-16  160  =

^1da177e4c3f41 Linus Torvalds 2005-04-16  161  	off =3D node->tree->node_si=
ze - 2;
^1da177e4c3f41 Linus Torvalds 2005-04-16 @162  	for (i =3D be16_to_cpu(desc=
.num_recs); i >=3D 0; off -=3D 2, i--) {
^1da177e4c3f41 Linus Torvalds 2005-04-16  163  		key_off =3D hfs_bnode_read=
_u16(node, off);
c2b3e1f76e5c90 Joe Perches    2013-04-30  164  		hfs_dbg_cont(BNODE_MOD, " =
%d", key_off);
^1da177e4c3f41 Linus Torvalds 2005-04-16  165  		if (i && node->type =3D=3D=
 HFS_NODE_INDEX) {
^1da177e4c3f41 Linus Torvalds 2005-04-16  166  			int tmp;
^1da177e4c3f41 Linus Torvalds 2005-04-16  167  =

^1da177e4c3f41 Linus Torvalds 2005-04-16  168  			if (node->tree->attribute=
s & HFS_TREE_VARIDXKEYS)
^1da177e4c3f41 Linus Torvalds 2005-04-16  169  				tmp =3D (hfs_bnode_read_=
u8(node, key_off) | 1) + 1;
^1da177e4c3f41 Linus Torvalds 2005-04-16  170  			else
^1da177e4c3f41 Linus Torvalds 2005-04-16  171  				tmp =3D node->tree->max_=
key_len + 1;
c2b3e1f76e5c90 Joe Perches    2013-04-30  172  			hfs_dbg_cont(BNODE_MOD, "=
 (%d,%d",
c2b3e1f76e5c90 Joe Perches    2013-04-30  173  				     tmp, hfs_bnode_read=
_u8(node, key_off));
^1da177e4c3f41 Linus Torvalds 2005-04-16  174  			hfs_bnode_read(node, &cni=
d, key_off + tmp, 4);
c2b3e1f76e5c90 Joe Perches    2013-04-30  175  			hfs_dbg_cont(BNODE_MOD, "=
,%d)", be32_to_cpu(cnid));
^1da177e4c3f41 Linus Torvalds 2005-04-16  176  		} else if (i && node->type=
 =3D=3D HFS_NODE_LEAF) {
^1da177e4c3f41 Linus Torvalds 2005-04-16  177  			int tmp;
^1da177e4c3f41 Linus Torvalds 2005-04-16  178  =

^1da177e4c3f41 Linus Torvalds 2005-04-16  179  			tmp =3D hfs_bnode_read_u8=
(node, key_off);
c2b3e1f76e5c90 Joe Perches    2013-04-30  180  			hfs_dbg_cont(BNODE_MOD, "=
 (%d)", tmp);
^1da177e4c3f41 Linus Torvalds 2005-04-16  181  		}
^1da177e4c3f41 Linus Torvalds 2005-04-16  182  	}
c2b3e1f76e5c90 Joe Perches    2013-04-30  183  	hfs_dbg_cont(BNODE_MOD, "\n=
");
^1da177e4c3f41 Linus Torvalds 2005-04-16  184  }
^1da177e4c3f41 Linus Torvalds 2005-04-16  185  =


:::::: The code at line 162 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8213379316643261814==--

