Content-Type: multipart/mixed; boundary="===============4606375930996048603=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [willy-pagecache:fs-folio 52/58] fs/nilfs2/inode.c:232:6: warning: Branch condition evaluates to a garbage value [clang-analyzer-core.uninitialized.Branch]
Date: Wed, 16 Feb 2022 20:15:14 +0800
Message-ID: <202202162046.jBbZT2Da-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4606375930996048603==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: "Matthew Wilcox (Oracle)" <willy@infradead.org>

tree:   git://git.infradead.org/users/willy/pagecache fs-folio
head:   d640eb583a16152f0c70301f98e0198d23a58b60
commit: 2b173a2f07fda1115fa469da0698ee5696c8b8c8 [52/58] nilfs: Convert nil=
fs_set_page_dirty() to nilfs_dirty_folio()
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: riscv-randconfig-c006-20220216 (https://download.01.org/0day-ci/arc=
hive/20220216/202202162046.jBbZT2Da-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0e628a=
783b935c70c80815db6c061ec84f884af5)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        git remote add willy-pagecache git://git.infradead.org/users/willy/=
pagecache
        git fetch --no-tags willy-pagecache fs-folio
        git checkout 2b173a2f07fda1115fa469da0698ee5696c8b8c8
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ext4/extents.c:977:2: note: Taking false branch
           if (unlikely(logical =3D=3D le32_to_cpu(curp->p_idx->ei_block)))=
 {
           ^
   fs/ext4/extents.c:984:6: note: Assuming the condition is false
           if (unlikely(le16_to_cpu(curp->p_hdr->eh_entries)
               ^
   include/linux/compiler.h:78:22: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ext4/extents.c:984:2: note: Taking false branch
           if (unlikely(le16_to_cpu(curp->p_hdr->eh_entries)
           ^
   fs/ext4/extents.c:993:6: note: Assuming 'logical' is <=3D field 'ei_bloc=
k'
           if (logical > le32_to_cpu(curp->p_idx->ei_block)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ext4/extents.c:993:2: note: Taking false branch
           if (logical > le32_to_cpu(curp->p_idx->ei_block)) {
           ^
   fs/ext4/extents.c:1000:3: note: Taking false branch
                   ext_debug(inode, "insert new index %d before: %llu\n",
                   ^
   fs/ext4/ext4.h:99:34: note: expanded from macro 'ext_debug'
   #define ext_debug(ino, fmt, ...)        no_printk(fmt, ##__VA_ARGS__)
                                           ^
   include/linux/printk.h:131:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   fs/ext4/extents.c:1002:3: note: Value assigned to 'ix'
                   ix =3D curp->p_idx;
                   ^~~~~~~~~~~~~~~~
   fs/ext4/extents.c:1006:9: note: Assuming 'len' is >=3D 0
           BUG_ON(len < 0);
                  ^
   include/asm-generic/bug.h:161:45: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                               ^~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   fs/ext4/extents.c:1006:2: note: Taking false branch
           BUG_ON(len < 0);
           ^
   include/asm-generic/bug.h:161:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                  ^
   fs/ext4/extents.c:1006:2: note: Loop condition is false.  Exiting loop
           BUG_ON(len < 0);
           ^
   include/asm-generic/bug.h:161:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                             ^
   fs/ext4/extents.c:1007:6: note: Assuming 'len' is <=3D 0
           if (len > 0) {
               ^~~~~~~
   fs/ext4/extents.c:1007:2: note: Taking false branch
           if (len > 0) {
           ^
   fs/ext4/extents.c:1014:20: note: Assuming field 'eh_max' is 0
           if (unlikely(ix > EXT_MAX_INDEX(curp->p_hdr))) {
                             ^
   fs/ext4/ext4_extents.h:178:3: note: expanded from macro 'EXT_MAX_INDEX'
           ((le16_to_cpu((__hdr__)->eh_max)) ? \
            ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   fs/ext4/extents.c:1014:20: note: '?' condition is false
           if (unlikely(ix > EXT_MAX_INDEX(curp->p_hdr))) {
                             ^
   fs/ext4/ext4_extents.h:178:3: note: expanded from macro 'EXT_MAX_INDEX'
           ((le16_to_cpu((__hdr__)->eh_max)) ? \
            ^
   fs/ext4/extents.c:1014:15: note: Assuming pointer value is null
           if (unlikely(ix > EXT_MAX_INDEX(curp->p_hdr))) {
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   fs/ext4/extents.c:1014:2: note: Taking false branch
           if (unlikely(ix > EXT_MAX_INDEX(curp->p_hdr))) {
           ^
   fs/ext4/extents.c:1019:15: note: Access to field 'ei_block' results in a=
 dereference of a null pointer (loaded from variable 'ix')
           ix->ei_block =3D cpu_to_le32(logical);
           ~~           ^
   fs/ext4/extents.c:3371:2: warning: Value stored to 'split_flag1' is neve=
r read [clang-analyzer-deadcode.DeadStores]
           split_flag1 =3D 0;
           ^             ~
   fs/ext4/extents.c:3371:2: note: Value stored to 'split_flag1' is never r=
ead
           split_flag1 =3D 0;
           ^             ~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
>> fs/nilfs2/inode.c:232:6: warning: Branch condition evaluates to a garbag=
e value [clang-analyzer-core.uninitialized.Branch]
           if (nr_dirty)
               ^~~~~~~~
   fs/nilfs2/inode.c:207:2: note: 'nr_dirty' declared without an initial va=
lue
           unsigned int nr_dirty;
           ^~~~~~~~~~~~~~~~~~~~~
   fs/nilfs2/inode.c:215:6: note: Assuming 'head' is null
           if (head) {
               ^~~~
   fs/nilfs2/inode.c:215:2: note: Taking false branch
           if (head) {
           ^
   fs/nilfs2/inode.c:227:13: note: Assuming 'ret' is false
           } else if (ret) {
                      ^~~
   fs/nilfs2/inode.c:227:9: note: Taking false branch
           } else if (ret) {
                  ^
   fs/nilfs2/inode.c:232:6: note: Branch condition evaluates to a garbage v=
alue
           if (nr_dirty)
               ^~~~~~~~
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   fs/nilfs2/dir.c:161:2: warning: Value stored to 'error' is never read [c=
lang-analyzer-deadcode.DeadStores]
           error =3D "rec_len is smaller than minimal";
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/nilfs2/dir.c:161:2: note: Value stored to 'error' is never read
           error =3D "rec_len is smaller than minimal";
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/nilfs2/dir.c:164:2: warning: Value stored to 'error' is never read [c=
lang-analyzer-deadcode.DeadStores]
           error =3D "unaligned directory entry";
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/nilfs2/dir.c:164:2: note: Value stored to 'error' is never read
           error =3D "unaligned directory entry";
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/nilfs2/dir.c:167:2: warning: Value stored to 'error' is never read [c=
lang-analyzer-deadcode.DeadStores]
           error =3D "rec_len is too small for name_len";
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/nilfs2/dir.c:167:2: note: Value stored to 'error' is never read
           error =3D "rec_len is too small for name_len";
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/nilfs2/dir.c:170:2: warning: Value stored to 'error' is never read [c=
lang-analyzer-deadcode.DeadStores]
           error =3D "directory entry across blocks";
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/nilfs2/dir.c:170:2: note: Value stored to 'error' is never read
           error =3D "directory entry across blocks";
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/nilfs2/dir.c:179:2: warning: Value stored to 'p' is never read [clang=
-analyzer-deadcode.DeadStores]
           p =3D (struct nilfs_dir_entry *)(kaddr + offs);
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/nilfs2/dir.c:179:2: note: Value stored to 'p' is never read
           p =3D (struct nilfs_dir_entry *)(kaddr + offs);
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   fs/nilfs2/super.c:193:4: warning: Null pointer passed as 1st argument to=
 memory copy function [clang-analyzer-unix.cstring.NullArg]
                           memcpy(nilfs->ns_sbp[1], nilfs->ns_sbp[0],
                           ^
   fs/nilfs2/super.c:1275:6: note: Assuming the condition is false
           if (!(flags & SB_RDONLY))
               ^~~~~~~~~~~~~~~~~~~~
   fs/nilfs2/super.c:1275:2: note: Taking false branch
           if (!(flags & SB_RDONLY))
           ^
   fs/nilfs2/super.c:1279:2: note: Taking false branch
           if (IS_ERR(sd.bdev))
           ^
   fs/nilfs2/super.c:1284:2: note: Taking false branch
           if (nilfs_identify((char *)data, &sd)) {
           ^
   fs/nilfs2/super.c:1295:6: note: Assuming field 'bd_fsfreeze_count' is <=
=3D 0
           if (sd.bdev->bd_fsfreeze_count > 0) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/nilfs2/super.c:1295:2: note: Taking false branch
           if (sd.bdev->bd_fsfreeze_count > 0) {
           ^
   fs/nilfs2/super.c:1303:2: note: Taking false branch
           if (IS_ERR(s)) {
           ^
   fs/nilfs2/super.c:1308:6: note: Assuming field 's_root' is non-null
           if (!s->s_root) {
               ^~~~~~~~~~
   fs/nilfs2/super.c:1308:2: note: Taking false branch
           if (!s->s_root) {
           ^
   fs/nilfs2/super.c:1321:17: note: Field 'cno' is 0
           } else if (!sd.cno) {
                          ^
   fs/nilfs2/super.c:1321:9: note: Taking true branch
           } else if (!sd.cno) {
                  ^
   fs/nilfs2/super.c:1322:3: note: Taking false branch
                   if (nilfs_tree_is_busy(s->s_root)) {
                   ^
   fs/nilfs2/super.c:1335:10: note: Calling 'nilfs_remount'
                           err =3D nilfs_remount(s, &flags, data);

vim +232 fs/nilfs2/inode.c

05fe58fdc10df9 Ryusuke Konishi         2009-04-06  201  =

2b173a2f07fda1 Matthew Wilcox (Oracle  2022-02-09  202) static bool nilfs_d=
irty_folio(struct address_space *mapping,
2b173a2f07fda1 Matthew Wilcox (Oracle  2022-02-09  203) 		struct folio *fol=
io)
05fe58fdc10df9 Ryusuke Konishi         2009-04-06  204  {
2b173a2f07fda1 Matthew Wilcox (Oracle  2022-02-09  205) 	struct inode *inod=
e =3D mapping->host;
2b173a2f07fda1 Matthew Wilcox (Oracle  2022-02-09  206) 	struct buffer_head=
 *head;
2b173a2f07fda1 Matthew Wilcox (Oracle  2022-02-09  207) 	unsigned int nr_di=
rty;
2b173a2f07fda1 Matthew Wilcox (Oracle  2022-02-09  208) 	bool ret =3D filem=
ap_dirty_folio(mapping, folio);
05fe58fdc10df9 Ryusuke Konishi         2009-04-06  209  =

136e8770cd5d1f Ryusuke Konishi         2013-05-24  210  	/*
2b173a2f07fda1 Matthew Wilcox (Oracle  2022-02-09  211) 	 * The page may no=
t be locked, eg if called from try_to_unmap_one()
136e8770cd5d1f Ryusuke Konishi         2013-05-24  212  	 */
2b173a2f07fda1 Matthew Wilcox (Oracle  2022-02-09  213) 	spin_lock(&mapping=
->private_lock);
2b173a2f07fda1 Matthew Wilcox (Oracle  2022-02-09  214) 	head =3D folio_buf=
fers(folio);
2b173a2f07fda1 Matthew Wilcox (Oracle  2022-02-09  215) 	if (head) {
2b173a2f07fda1 Matthew Wilcox (Oracle  2022-02-09  216) 		struct buffer_hea=
d *bh =3D head;
2b173a2f07fda1 Matthew Wilcox (Oracle  2022-02-09  217) =

2b173a2f07fda1 Matthew Wilcox (Oracle  2022-02-09  218) 		nr_dirty =3D 0;
136e8770cd5d1f Ryusuke Konishi         2013-05-24  219  		do {
136e8770cd5d1f Ryusuke Konishi         2013-05-24  220  			/* Do not mark h=
ole blocks dirty */
136e8770cd5d1f Ryusuke Konishi         2013-05-24  221  			if (buffer_dirty=
(bh) || !buffer_mapped(bh))
136e8770cd5d1f Ryusuke Konishi         2013-05-24  222  				continue;
136e8770cd5d1f Ryusuke Konishi         2013-05-24  223  =

136e8770cd5d1f Ryusuke Konishi         2013-05-24  224  			set_buffer_dirty=
(bh);
136e8770cd5d1f Ryusuke Konishi         2013-05-24  225  			nr_dirty++;
136e8770cd5d1f Ryusuke Konishi         2013-05-24  226  		} while (bh =3D b=
h->b_this_page, bh !=3D head);
56d7acc792c0d9 Andreas Rohner          2014-09-25  227  	} else if (ret) {
2b173a2f07fda1 Matthew Wilcox (Oracle  2022-02-09  228) 		nr_dirty =3D 1 <<=
 (PAGE_SHIFT - inode->i_blkbits);
2b173a2f07fda1 Matthew Wilcox (Oracle  2022-02-09  229) 	}
2b173a2f07fda1 Matthew Wilcox (Oracle  2022-02-09  230) 	spin_unlock(&mappi=
ng->private_lock);
56d7acc792c0d9 Andreas Rohner          2014-09-25  231  =

2b173a2f07fda1 Matthew Wilcox (Oracle  2022-02-09 @232) 	if (nr_dirty)
bcbc8c648d6cc8 Ryusuke Konishi         2010-12-27  233  		nilfs_set_file_di=
rty(inode, nr_dirty);
05fe58fdc10df9 Ryusuke Konishi         2009-04-06  234  	return ret;
05fe58fdc10df9 Ryusuke Konishi         2009-04-06  235  }
05fe58fdc10df9 Ryusuke Konishi         2009-04-06  236  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4606375930996048603==--

