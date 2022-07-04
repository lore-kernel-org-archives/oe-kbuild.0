Content-Type: multipart/mixed; boundary="===============7093050032715996982=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: fs/hfs/bnode.c:50:2: warning: Undefined or garbage value returned to caller [clang-analyzer-core.uninitialized.UndefReturn]
Date: Mon, 04 Jul 2022 17:08:28 +0800
Message-ID: <202207041621.fRTGGuDO-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7093050032715996982==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: fs/hfs/bn=
ode.c:50:2: warning: Undefined or garbage value returned to caller [clang-a=
nalyzer-core.uninitialized.UndefReturn]"
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
head:   88084a3df1672e131ddc1b4e39eeacfd39864acf
commit: 54a5ead6f5e2b47131a7385d0c0af18e7b89cb02 hfs: fix high memory mappi=
ng in hfs_bnode_read
date:   12 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 12 months ago
config: s390-randconfig-c005-20220702 (https://download.01.org/0day-ci/arch=
ive/20220704/202207041621.fRTGGuDO-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 5d7876=
89b14574fe58ba9798563f4a6df6059fbf)
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
   fs/udf/namei.c:361:7: note: Assuming 'namelen' is not equal to 0
                   if (!namelen) {
                       ^~~~~~~~
   fs/udf/namei.c:361:3: note: Taking false branch
                   if (!namelen) {
                   ^
   fs/udf/namei.c:375:13: note: Field 'i_alloc_type' is not equal to ICBTAG=
_FLAG_AD_IN_ICB
           if (dinfo->i_alloc_type !=3D ICBTAG_FLAG_AD_IN_ICB) {
                      ^
   fs/udf/namei.c:375:2: note: Taking true branch
           if (dinfo->i_alloc_type !=3D ICBTAG_FLAG_AD_IN_ICB) {
           ^
   fs/udf/namei.c:376:7: note: Assuming the condition is true
                   if (inode_bmap(dir, f_pos >> dir->i_sb->s_blocksize_bits=
, &epos,
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   fs/udf/namei.c:376:3: note: Taking true branch
                   if (inode_bmap(dir, f_pos >> dir->i_sb->s_blocksize_bits=
, &epos,
                   ^
   fs/udf/namei.c:381:4: note: Control jumps to line 429
                           goto add;
                           ^
   fs/udf/namei.c:431:6: note: Assuming field 'i_alloc_type' is not equal t=
o ICBTAG_FLAG_AD_IN_ICB
           if (dinfo->i_alloc_type =3D=3D ICBTAG_FLAG_AD_IN_ICB &&
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/udf/namei.c:431:51: note: Left side of '&&' is false
           if (dinfo->i_alloc_type =3D=3D ICBTAG_FLAG_AD_IN_ICB &&
                                                            ^
   fs/udf/namei.c:452:6: note: Assuming the condition is true
           if (sb->s_blocksize - fibh->eoffset >=3D nfidlen) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/udf/namei.c:452:2: note: Taking true branch
           if (sb->s_blocksize - fibh->eoffset >=3D nfidlen) {
           ^
   fs/udf/namei.c:455:13: note: Field 'sbh' is equal to field 'ebh'
                   if (fibh->sbh !=3D fibh->ebh) {
                             ^
   fs/udf/namei.c:455:3: note: Taking false branch
                   if (fibh->sbh !=3D fibh->ebh) {
                   ^
   fs/udf/namei.c:460:14: note: Field 'i_alloc_type' is not equal to ICBTAG=
_FLAG_AD_IN_ICB
                   if (dinfo->i_alloc_type =3D=3D ICBTAG_FLAG_AD_IN_ICB) {
                              ^
   fs/udf/namei.c:460:3: note: Taking false branch
                   if (dinfo->i_alloc_type =3D=3D ICBTAG_FLAG_AD_IN_ICB) {
                   ^
   fs/udf/namei.c:471:6: note: Access to field 'b_data' results in a derefe=
rence of a null pointer (loaded from field 'sbh')
                                   (fibh->sbh->b_data + fibh->soffset);
                                    ^     ~~~
   fs/udf/udfend.h:12:24: warning: 1st function call argument is an uniniti=
alized value [clang-analyzer-core.CallAndMessage]
           out.logicalBlockNum =3D le32_to_cpu(in.logicalBlockNum);
                                 ^
   include/linux/byteorder/generic.h:89:21: note: expanded from macro 'le32=
_to_cpu'
   #define le32_to_cpu __le32_to_cpu
                       ^
   include/uapi/linux/byteorder/big_endian.h:34:26: note: expanded from mac=
ro '__le32_to_cpu'
   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                            ^
   include/uapi/linux/swab.h:115:28: note: expanded from macro '__swab32'
   #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
                              ^
   fs/udf/namei.c:1225:2: note: Taking false branch
           if (!udf_find_entry(d_inode(child), &dotdot_name, &fibh, &cfi))
           ^
   fs/udf/namei.c:1228:11: note: Field 'sbh' is equal to field 'ebh'
           if (fibh.sbh !=3D fibh.ebh)
                    ^
   fs/udf/namei.c:1228:2: note: Taking false branch
           if (fibh.sbh !=3D fibh.ebh)
           ^
   fs/udf/namei.c:1232:9: note: Uninitialized value stored to 'in.logicalBl=
ockNum'
           tloc =3D lelb_to_cpu(cfi.icb.extLocation);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/udf/namei.c:1232:9: note: Calling 'lelb_to_cpu'
           tloc =3D lelb_to_cpu(cfi.icb.extLocation);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/udf/udfend.h:12:24: note: 1st function call argument is an uninitiali=
zed value
           out.logicalBlockNum =3D le32_to_cpu(in.logicalBlockNum);
                                 ^
   include/linux/byteorder/generic.h:89:21: note: expanded from macro 'le32=
_to_cpu'
   #define le32_to_cpu __le32_to_cpu
                       ^
   include/uapi/linux/byteorder/big_endian.h:34:26: note: expanded from mac=
ro '__le32_to_cpu'
   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/swab.h:115:28: note: expanded from macro '__swab32'
   #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
                              ^                 ~~~~~~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   fs/hfs/bfind.c:111:2: warning: Value stored to 'res' is never read [clan=
g-analyzer-deadcode.DeadStores]
           res =3D 0;
           ^     ~
   fs/hfs/bfind.c:111:2: note: Value stored to 'res' is never read
           res =3D 0;
           ^     ~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   23 warnings generated.
>> fs/hfs/bnode.c:50:2: warning: Undefined or garbage value returned to cal=
ler [clang-analyzer-core.uninitialized.UndefReturn]
           return be16_to_cpu(data);
           ^
   fs/hfs/bnode.c:193:6: note: Assuming field 'prev' is not equal to 0
           if (node->prev) {
               ^~~~~~~~~~
   fs/hfs/bnode.c:193:2: note: Taking true branch
           if (node->prev) {
           ^
   fs/hfs/bnode.c:194:9: note: Calling 'hfs_bnode_find'
                   tmp =3D hfs_bnode_find(tree, node->prev);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/hfs/bnode.c:336:6: note: Assuming 'node' is null
           if (node) {
               ^~~~
   fs/hfs/bnode.c:336:2: note: Taking false branch
           if (node) {
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
   fs/hfs/bnode.c:34:19: note: Assuming '__UNIQUE_ID___x324' is >=3D '__UNI=
QUE_ID___y325'
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

vim +50 fs/hfs/bnode.c

^1da177e4c3f41 Linus Torvalds        2005-04-16   17  =

54a5ead6f5e2b4 Desmond Cheong Zhi Xi 2021-07-14   18  void hfs_bnode_read(s=
truct hfs_bnode *node, void *buf, int off, int len)
^1da177e4c3f41 Linus Torvalds        2005-04-16   19  {
^1da177e4c3f41 Linus Torvalds        2005-04-16   20  	struct page *page;
54a5ead6f5e2b4 Desmond Cheong Zhi Xi 2021-07-14   21  	int pagenum;
54a5ead6f5e2b4 Desmond Cheong Zhi Xi 2021-07-14   22  	int bytes_read;
54a5ead6f5e2b4 Desmond Cheong Zhi Xi 2021-07-14   23  	int bytes_to_read;
54a5ead6f5e2b4 Desmond Cheong Zhi Xi 2021-07-14   24  	void *vaddr;
^1da177e4c3f41 Linus Torvalds        2005-04-16   25  =

^1da177e4c3f41 Linus Torvalds        2005-04-16   26  	off +=3D node->page_=
offset;
54a5ead6f5e2b4 Desmond Cheong Zhi Xi 2021-07-14   27  	pagenum =3D off >> P=
AGE_SHIFT;
54a5ead6f5e2b4 Desmond Cheong Zhi Xi 2021-07-14   28  	off &=3D ~PAGE_MASK;=
 /* compute page offset for the first page */
^1da177e4c3f41 Linus Torvalds        2005-04-16   29  =

54a5ead6f5e2b4 Desmond Cheong Zhi Xi 2021-07-14   30  	for (bytes_read =3D =
0; bytes_read < len; bytes_read +=3D bytes_to_read) {
54a5ead6f5e2b4 Desmond Cheong Zhi Xi 2021-07-14   31  		if (pagenum >=3D no=
de->tree->pages_per_bnode)
54a5ead6f5e2b4 Desmond Cheong Zhi Xi 2021-07-14   32  			break;
54a5ead6f5e2b4 Desmond Cheong Zhi Xi 2021-07-14   33  		page =3D node->page=
[pagenum];
54a5ead6f5e2b4 Desmond Cheong Zhi Xi 2021-07-14   34  		bytes_to_read =3D m=
in_t(int, len - bytes_read, PAGE_SIZE - off);
54a5ead6f5e2b4 Desmond Cheong Zhi Xi 2021-07-14   35  =

54a5ead6f5e2b4 Desmond Cheong Zhi Xi 2021-07-14   36  		vaddr =3D kmap_atom=
ic(page);
54a5ead6f5e2b4 Desmond Cheong Zhi Xi 2021-07-14   37  		memcpy(buf + bytes_=
read, vaddr + off, bytes_to_read);
54a5ead6f5e2b4 Desmond Cheong Zhi Xi 2021-07-14   38  		kunmap_atomic(vaddr=
);
54a5ead6f5e2b4 Desmond Cheong Zhi Xi 2021-07-14   39  =

54a5ead6f5e2b4 Desmond Cheong Zhi Xi 2021-07-14   40  		pagenum++;
54a5ead6f5e2b4 Desmond Cheong Zhi Xi 2021-07-14   41  		off =3D 0; /* page =
offset only applies to the first page */
54a5ead6f5e2b4 Desmond Cheong Zhi Xi 2021-07-14   42  	}
^1da177e4c3f41 Linus Torvalds        2005-04-16  @43  }
^1da177e4c3f41 Linus Torvalds        2005-04-16   44  =

^1da177e4c3f41 Linus Torvalds        2005-04-16   45  u16 hfs_bnode_read_u1=
6(struct hfs_bnode *node, int off)
^1da177e4c3f41 Linus Torvalds        2005-04-16   46  {
^1da177e4c3f41 Linus Torvalds        2005-04-16   47  	__be16 data;
^1da177e4c3f41 Linus Torvalds        2005-04-16   48  	// optimize later...
^1da177e4c3f41 Linus Torvalds        2005-04-16   49  	hfs_bnode_read(node,=
 &data, off, 2);
^1da177e4c3f41 Linus Torvalds        2005-04-16  @50  	return be16_to_cpu(d=
ata);
^1da177e4c3f41 Linus Torvalds        2005-04-16   51  }
^1da177e4c3f41 Linus Torvalds        2005-04-16   52  =

^1da177e4c3f41 Linus Torvalds        2005-04-16   53  u8 hfs_bnode_read_u8(=
struct hfs_bnode *node, int off)
^1da177e4c3f41 Linus Torvalds        2005-04-16   54  {
^1da177e4c3f41 Linus Torvalds        2005-04-16   55  	u8 data;
^1da177e4c3f41 Linus Torvalds        2005-04-16   56  	// optimize later...
^1da177e4c3f41 Linus Torvalds        2005-04-16   57  	hfs_bnode_read(node,=
 &data, off, 1);
^1da177e4c3f41 Linus Torvalds        2005-04-16   58  	return data;
^1da177e4c3f41 Linus Torvalds        2005-04-16   59  }
^1da177e4c3f41 Linus Torvalds        2005-04-16   60  =

^1da177e4c3f41 Linus Torvalds        2005-04-16   61  void hfs_bnode_read_k=
ey(struct hfs_bnode *node, void *key, int off)
^1da177e4c3f41 Linus Torvalds        2005-04-16   62  {
^1da177e4c3f41 Linus Torvalds        2005-04-16   63  	struct hfs_btree *tr=
ee;
^1da177e4c3f41 Linus Torvalds        2005-04-16   64  	int key_len;
^1da177e4c3f41 Linus Torvalds        2005-04-16   65  =

^1da177e4c3f41 Linus Torvalds        2005-04-16   66  	tree =3D node->tree;
^1da177e4c3f41 Linus Torvalds        2005-04-16   67  	if (node->type =3D=
=3D HFS_NODE_LEAF ||
^1da177e4c3f41 Linus Torvalds        2005-04-16   68  	    tree->attributes=
 & HFS_TREE_VARIDXKEYS)
^1da177e4c3f41 Linus Torvalds        2005-04-16   69  		key_len =3D hfs_bno=
de_read_u8(node, off) + 1;
^1da177e4c3f41 Linus Torvalds        2005-04-16   70  	else
^1da177e4c3f41 Linus Torvalds        2005-04-16   71  		key_len =3D tree->m=
ax_key_len + 1;
^1da177e4c3f41 Linus Torvalds        2005-04-16   72  =

^1da177e4c3f41 Linus Torvalds        2005-04-16   73  	hfs_bnode_read(node,=
 key, off, key_len);
^1da177e4c3f41 Linus Torvalds        2005-04-16   74  }
^1da177e4c3f41 Linus Torvalds        2005-04-16   75  =

^1da177e4c3f41 Linus Torvalds        2005-04-16   76  void hfs_bnode_write(=
struct hfs_bnode *node, void *buf, int off, int len)
^1da177e4c3f41 Linus Torvalds        2005-04-16   77  {
^1da177e4c3f41 Linus Torvalds        2005-04-16   78  	struct page *page;
^1da177e4c3f41 Linus Torvalds        2005-04-16   79  =

^1da177e4c3f41 Linus Torvalds        2005-04-16   80  	off +=3D node->page_=
offset;
^1da177e4c3f41 Linus Torvalds        2005-04-16   81  	page =3D node->page[=
0];
^1da177e4c3f41 Linus Torvalds        2005-04-16   82  =

^1da177e4c3f41 Linus Torvalds        2005-04-16   83  	memcpy(kmap(page) + =
off, buf, len);
^1da177e4c3f41 Linus Torvalds        2005-04-16   84  	kunmap(page);
^1da177e4c3f41 Linus Torvalds        2005-04-16   85  	set_page_dirty(page);
^1da177e4c3f41 Linus Torvalds        2005-04-16   86  }
^1da177e4c3f41 Linus Torvalds        2005-04-16   87  =

^1da177e4c3f41 Linus Torvalds        2005-04-16   88  void hfs_bnode_write_=
u16(struct hfs_bnode *node, int off, u16 data)
^1da177e4c3f41 Linus Torvalds        2005-04-16   89  {
^1da177e4c3f41 Linus Torvalds        2005-04-16   90  	__be16 v =3D cpu_to_=
be16(data);
^1da177e4c3f41 Linus Torvalds        2005-04-16   91  	// optimize later...
^1da177e4c3f41 Linus Torvalds        2005-04-16   92  	hfs_bnode_write(node=
, &v, off, 2);
^1da177e4c3f41 Linus Torvalds        2005-04-16   93  }
^1da177e4c3f41 Linus Torvalds        2005-04-16   94  =

^1da177e4c3f41 Linus Torvalds        2005-04-16   95  void hfs_bnode_write_=
u8(struct hfs_bnode *node, int off, u8 data)
^1da177e4c3f41 Linus Torvalds        2005-04-16   96  {
^1da177e4c3f41 Linus Torvalds        2005-04-16   97  	// optimize later...
^1da177e4c3f41 Linus Torvalds        2005-04-16   98  	hfs_bnode_write(node=
, &data, off, 1);
^1da177e4c3f41 Linus Torvalds        2005-04-16   99  }
^1da177e4c3f41 Linus Torvalds        2005-04-16  100  =

^1da177e4c3f41 Linus Torvalds        2005-04-16  101  void hfs_bnode_clear(=
struct hfs_bnode *node, int off, int len)
^1da177e4c3f41 Linus Torvalds        2005-04-16  102  {
^1da177e4c3f41 Linus Torvalds        2005-04-16  103  	struct page *page;
^1da177e4c3f41 Linus Torvalds        2005-04-16  104  =

^1da177e4c3f41 Linus Torvalds        2005-04-16  105  	off +=3D node->page_=
offset;
^1da177e4c3f41 Linus Torvalds        2005-04-16  106  	page =3D node->page[=
0];
^1da177e4c3f41 Linus Torvalds        2005-04-16  107  =

^1da177e4c3f41 Linus Torvalds        2005-04-16  108  	memset(kmap(page) + =
off, 0, len);
^1da177e4c3f41 Linus Torvalds        2005-04-16  109  	kunmap(page);
^1da177e4c3f41 Linus Torvalds        2005-04-16  110  	set_page_dirty(page);
^1da177e4c3f41 Linus Torvalds        2005-04-16  111  }
^1da177e4c3f41 Linus Torvalds        2005-04-16  112  =

^1da177e4c3f41 Linus Torvalds        2005-04-16  113  void hfs_bnode_copy(s=
truct hfs_bnode *dst_node, int dst,
^1da177e4c3f41 Linus Torvalds        2005-04-16  114  		struct hfs_bnode *s=
rc_node, int src, int len)
^1da177e4c3f41 Linus Torvalds        2005-04-16  115  {
^1da177e4c3f41 Linus Torvalds        2005-04-16  116  	struct page *src_pag=
e, *dst_page;
^1da177e4c3f41 Linus Torvalds        2005-04-16  117  =

c2b3e1f76e5c90 Joe Perches           2013-04-30  118  	hfs_dbg(BNODE_MOD, "=
copybytes: %u,%u,%u\n", dst, src, len);
^1da177e4c3f41 Linus Torvalds        2005-04-16  119  	if (!len)
^1da177e4c3f41 Linus Torvalds        2005-04-16  120  		return;
^1da177e4c3f41 Linus Torvalds        2005-04-16  121  	src +=3D src_node->p=
age_offset;
^1da177e4c3f41 Linus Torvalds        2005-04-16  122  	dst +=3D dst_node->p=
age_offset;
^1da177e4c3f41 Linus Torvalds        2005-04-16  123  	src_page =3D src_nod=
e->page[0];
^1da177e4c3f41 Linus Torvalds        2005-04-16  124  	dst_page =3D dst_nod=
e->page[0];
^1da177e4c3f41 Linus Torvalds        2005-04-16  125  =

^1da177e4c3f41 Linus Torvalds        2005-04-16  126  	memcpy(kmap(dst_page=
) + dst, kmap(src_page) + src, len);
^1da177e4c3f41 Linus Torvalds        2005-04-16  127  	kunmap(src_page);
^1da177e4c3f41 Linus Torvalds        2005-04-16  128  	kunmap(dst_page);
^1da177e4c3f41 Linus Torvalds        2005-04-16  129  	set_page_dirty(dst_p=
age);
^1da177e4c3f41 Linus Torvalds        2005-04-16  130  }
^1da177e4c3f41 Linus Torvalds        2005-04-16  131  =

^1da177e4c3f41 Linus Torvalds        2005-04-16  132  void hfs_bnode_move(s=
truct hfs_bnode *node, int dst, int src, int len)
^1da177e4c3f41 Linus Torvalds        2005-04-16  133  {
^1da177e4c3f41 Linus Torvalds        2005-04-16  134  	struct page *page;
^1da177e4c3f41 Linus Torvalds        2005-04-16  135  	void *ptr;
^1da177e4c3f41 Linus Torvalds        2005-04-16  136  =

c2b3e1f76e5c90 Joe Perches           2013-04-30  137  	hfs_dbg(BNODE_MOD, "=
movebytes: %u,%u,%u\n", dst, src, len);
^1da177e4c3f41 Linus Torvalds        2005-04-16  138  	if (!len)
^1da177e4c3f41 Linus Torvalds        2005-04-16  139  		return;
^1da177e4c3f41 Linus Torvalds        2005-04-16  140  	src +=3D node->page_=
offset;
^1da177e4c3f41 Linus Torvalds        2005-04-16  141  	dst +=3D node->page_=
offset;
^1da177e4c3f41 Linus Torvalds        2005-04-16  142  	page =3D node->page[=
0];
^1da177e4c3f41 Linus Torvalds        2005-04-16  143  	ptr =3D kmap(page);
^1da177e4c3f41 Linus Torvalds        2005-04-16  144  	memmove(ptr + dst, p=
tr + src, len);
^1da177e4c3f41 Linus Torvalds        2005-04-16  145  	kunmap(page);
^1da177e4c3f41 Linus Torvalds        2005-04-16  146  	set_page_dirty(page);
^1da177e4c3f41 Linus Torvalds        2005-04-16  147  }
^1da177e4c3f41 Linus Torvalds        2005-04-16  148  =

^1da177e4c3f41 Linus Torvalds        2005-04-16  149  void hfs_bnode_dump(s=
truct hfs_bnode *node)
^1da177e4c3f41 Linus Torvalds        2005-04-16  150  {
^1da177e4c3f41 Linus Torvalds        2005-04-16  151  	struct hfs_bnode_des=
c desc;
^1da177e4c3f41 Linus Torvalds        2005-04-16  152  	__be32 cnid;
^1da177e4c3f41 Linus Torvalds        2005-04-16  153  	int i, off, key_off;
^1da177e4c3f41 Linus Torvalds        2005-04-16  154  =

c2b3e1f76e5c90 Joe Perches           2013-04-30  155  	hfs_dbg(BNODE_MOD, "=
bnode: %d\n", node->this);
^1da177e4c3f41 Linus Torvalds        2005-04-16  156  	hfs_bnode_read(node,=
 &desc, 0, sizeof(desc));
c2b3e1f76e5c90 Joe Perches           2013-04-30  157  	hfs_dbg(BNODE_MOD, "=
%d, %d, %d, %d, %d\n",
^1da177e4c3f41 Linus Torvalds        2005-04-16  158  		be32_to_cpu(desc.ne=
xt), be32_to_cpu(desc.prev),
^1da177e4c3f41 Linus Torvalds        2005-04-16  159  		desc.type, desc.hei=
ght, be16_to_cpu(desc.num_recs));
^1da177e4c3f41 Linus Torvalds        2005-04-16  160  =

^1da177e4c3f41 Linus Torvalds        2005-04-16  161  	off =3D node->tree->=
node_size - 2;
^1da177e4c3f41 Linus Torvalds        2005-04-16 @162  	for (i =3D be16_to_c=
pu(desc.num_recs); i >=3D 0; off -=3D 2, i--) {
^1da177e4c3f41 Linus Torvalds        2005-04-16  163  		key_off =3D hfs_bno=
de_read_u16(node, off);
c2b3e1f76e5c90 Joe Perches           2013-04-30  164  		hfs_dbg_cont(BNODE_=
MOD, " %d", key_off);
^1da177e4c3f41 Linus Torvalds        2005-04-16  165  		if (i && node->type=
 =3D=3D HFS_NODE_INDEX) {
^1da177e4c3f41 Linus Torvalds        2005-04-16  166  			int tmp;
^1da177e4c3f41 Linus Torvalds        2005-04-16  167  =

^1da177e4c3f41 Linus Torvalds        2005-04-16  168  			if (node->tree->at=
tributes & HFS_TREE_VARIDXKEYS)
^1da177e4c3f41 Linus Torvalds        2005-04-16  169  				tmp =3D (hfs_bnod=
e_read_u8(node, key_off) | 1) + 1;
^1da177e4c3f41 Linus Torvalds        2005-04-16  170  			else
^1da177e4c3f41 Linus Torvalds        2005-04-16  171  				tmp =3D node->tre=
e->max_key_len + 1;
c2b3e1f76e5c90 Joe Perches           2013-04-30  172  			hfs_dbg_cont(BNODE=
_MOD, " (%d,%d",
c2b3e1f76e5c90 Joe Perches           2013-04-30  173  				     tmp, hfs_bno=
de_read_u8(node, key_off));
^1da177e4c3f41 Linus Torvalds        2005-04-16  174  			hfs_bnode_read(nod=
e, &cnid, key_off + tmp, 4);
c2b3e1f76e5c90 Joe Perches           2013-04-30  175  			hfs_dbg_cont(BNODE=
_MOD, ",%d)", be32_to_cpu(cnid));
^1da177e4c3f41 Linus Torvalds        2005-04-16  176  		} else if (i && nod=
e->type =3D=3D HFS_NODE_LEAF) {
^1da177e4c3f41 Linus Torvalds        2005-04-16  177  			int tmp;
^1da177e4c3f41 Linus Torvalds        2005-04-16  178  =

^1da177e4c3f41 Linus Torvalds        2005-04-16  179  			tmp =3D hfs_bnode_=
read_u8(node, key_off);
c2b3e1f76e5c90 Joe Perches           2013-04-30  180  			hfs_dbg_cont(BNODE=
_MOD, " (%d)", tmp);
^1da177e4c3f41 Linus Torvalds        2005-04-16  181  		}
^1da177e4c3f41 Linus Torvalds        2005-04-16  182  	}
c2b3e1f76e5c90 Joe Perches           2013-04-30  183  	hfs_dbg_cont(BNODE_M=
OD, "\n");
^1da177e4c3f41 Linus Torvalds        2005-04-16  184  }
^1da177e4c3f41 Linus Torvalds        2005-04-16  185  =


:::::: The code at line 50 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7093050032715996982==--

