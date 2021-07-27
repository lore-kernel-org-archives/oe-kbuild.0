Content-Type: multipart/mixed; boundary="===============9124454536947327485=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 2247/3590] fs/ext4/mballoc.c:1333:4: warning: 1st function call argument is an uninitialized value [clang-analyzer-core.CallAndMessage]
Date: Wed, 28 Jul 2021 06:50:53 +0800
Message-ID: <202107280647.wC7fjdnA-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============9124454536947327485==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: clang-built-linux(a)googlegroups.com
CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: "Matthew Wilcox (Oracle)" <willy@infradead.org>
CC: Christoph Hellwig <hch@lst.de>
CC: William Kucharski <william.kucharski@oracle.com>
CC: David Howells <dhowells@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   42d0b5f52c9b633a10626da27786049c76d4ea75
commit: 8c02d1a1387610edb84cd5f5fcbc78adcd0591cf [2247/3590] mm: Add folio =
flag manipulation functions
:::::: branch date: 7 hours ago
:::::: commit date: 7 days ago
config: x86_64-randconfig-c001-20210727 (attached as .config)
compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project c658b4=
72f3e61e1818e1909bf02f3d65470018a5)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install x86_64 cross compiling tool for clang build
        # apt-get install binutils-x86-64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3D8c02d1a1387610edb84cd5f5fcbc78adcd0591cf
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 8c02d1a1387610edb84cd5f5fcbc78adcd0591cf
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   fs/ext4/mballoc.c:1521:6: note: Assuming 'page' is equal to NULL
           if (page =3D=3D NULL || !PageUptodate(page)) {
               ^~~~~~~~~~~~
   fs/ext4/mballoc.c:1521:19: note: Left side of '||' is true
           if (page =3D=3D NULL || !PageUptodate(page)) {
                            ^
   fs/ext4/mballoc.c:1522:7: note: 'page' is null
                   if (page)
                       ^~~~
   fs/ext4/mballoc.c:1522:3: note: Taking false branch
                   if (page)
                   ^
   fs/ext4/mballoc.c:1533:7: note: Assuming 'page' is non-null
                   if (page) {
                       ^~~~
   fs/ext4/mballoc.c:1533:3: note: Taking true branch
                   if (page) {
                   ^
   fs/ext4/mballoc.c:1534:11: note: Assuming field 'mapping' is equal to fi=
eld 'i_mapping'
                           BUG_ON(page->mapping !=3D inode->i_mapping);
                                  ^
   include/asm-generic/bug.h:65:45: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                               ^~~~~~~~~
   include/linux/compiler.h:48:41: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                                             ^
   include/linux/compiler.h:33:34: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                         ^
   fs/ext4/mballoc.c:1534:17: note: Field 'mapping' is equal to field 'i_ma=
pping'
                           BUG_ON(page->mapping !=3D inode->i_mapping);
                                        ^
   fs/ext4/mballoc.c:1534:4: note: Taking false branch
                           BUG_ON(page->mapping !=3D inode->i_mapping);
                           ^
   include/asm-generic/bug.h:65:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                  ^
   fs/ext4/mballoc.c:1534:4: note: Loop condition is false.  Exiting loop
                           BUG_ON(page->mapping !=3D inode->i_mapping);
                           ^
   include/asm-generic/bug.h:65:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                             ^
   fs/ext4/mballoc.c:1535:4: note: Taking true branch
                           if (!PageUptodate(page)) {
                           ^
   fs/ext4/mballoc.c:1536:11: note: Calling 'ext4_mb_init_cache'
                                   ret =3D ext4_mb_init_cache(page, NULL, g=
fp);
                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ext4/mballoc.c:1203:2: note: Taking false branch
           mb_debug(sb, "init page %lu\n", page->index);
           ^
   fs/ext4/mballoc.h:31:2: note: expanded from macro 'mb_debug'
           pr_debug("[%s/%d] EXT4-fs (%s): (%s, %d): %s: " fmt,            \
           ^
   include/linux/printk.h:477:2: note: expanded from macro 'pr_debug'
           no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:140:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   fs/ext4/mballoc.c:1206:6: note: Assuming 'groups_per_page' is not equal =
to 0
           if (groups_per_page =3D=3D 0)
               ^~~~~~~~~~~~~~~~~~~~
   fs/ext4/mballoc.c:1206:2: note: Taking false branch
           if (groups_per_page =3D=3D 0)
           ^
   fs/ext4/mballoc.c:1210:6: note: Assuming 'groups_per_page' is <=3D 1
           if (groups_per_page > 1) {
               ^~~~~~~~~~~~~~~~~~~
   fs/ext4/mballoc.c:1210:2: note: Taking false branch
           if (groups_per_page > 1) {
           ^
   fs/ext4/mballoc.c:1223:35: note: Assuming 'i' is < 'groups_per_page'
           for (i =3D 0, group =3D first_group; i < groups_per_page; i++, g=
roup++) {
                                            ^~~~~~~~~~~~~~~~~~~
   fs/ext4/mballoc.c:1223:2: note: Loop condition is true.  Entering loop b=
ody
           for (i =3D 0, group =3D first_group; i < groups_per_page; i++, g=
roup++) {
           ^
   fs/ext4/mballoc.c:1224:7: note: Assuming 'group' is >=3D 'ngroups'
                   if (group >=3D ngroups)
                       ^~~~~~~~~~~~~~~~
   fs/ext4/mballoc.c:1224:3: note: Taking true branch
                   if (group >=3D ngroups)
                   ^
   fs/ext4/mballoc.c:1225:4: note:  Execution continues on line 1248
                           break;
                           ^
   fs/ext4/mballoc.c:1248:7: note: The value 0 is assigned to 'i'
           for (i =3D 0, group =3D first_group; i < groups_per_page; i++, g=
roup++) {
                ^~~~~
   fs/ext4/mballoc.c:1248:2: note: Loop condition is true.  Entering loop b=
ody
           for (i =3D 0, group =3D first_group; i < groups_per_page; i++, g=
roup++) {
           ^
   fs/ext4/mballoc.c:1251:7: note: Branch condition evaluates to a garbage =
value
                   if (!bh[i])
                       ^~~~~~
>> fs/ext4/mballoc.c:1333:4: warning: 1st function call argument is an unin=
itialized value [clang-analyzer-core.CallAndMessage]
                           brelse(bh[i]);
                           ^
   fs/ext4/mballoc.c:6341:6: note: Assuming 'minlen' is <=3D field 's_clust=
ers_per_group'
           if (minlen > EXT4_CLUSTERS_PER_GROUP(sb) ||
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ext4/mballoc.c:6341:6: note: Left side of '||' is false
   fs/ext4/mballoc.c:6342:6: note: Assuming 'start' is < 'max_blks'
               start >=3D max_blks ||
               ^~~~~~~~~~~~~~~~~
   fs/ext4/mballoc.c:6341:6: note: Left side of '||' is false
           if (minlen > EXT4_CLUSTERS_PER_GROUP(sb) ||
               ^
   fs/ext4/mballoc.c:6343:6: note: Assuming field 'len' is >=3D field 's_bl=
ocksize'
               range->len < sb->s_blocksize)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ext4/mballoc.c:6341:2: note: Taking false branch
           if (minlen > EXT4_CLUSTERS_PER_GROUP(sb) ||
           ^
   fs/ext4/mballoc.c:6345:6: note: Assuming 'end' is < 'max_blks'
           if (end >=3D max_blks)
               ^~~~~~~~~~~~~~~
   fs/ext4/mballoc.c:6345:2: note: Taking false branch
           if (end >=3D max_blks)
           ^
   fs/ext4/mballoc.c:6347:6: note: Assuming 'end' is > 'first_data_blk'
           if (end <=3D first_data_blk)
               ^~~~~~~~~~~~~~~~~~~~~
   fs/ext4/mballoc.c:6347:2: note: Taking false branch
           if (end <=3D first_data_blk)
           ^
   fs/ext4/mballoc.c:6349:6: note: Assuming 'start' is >=3D 'first_data_blk'
           if (start < first_data_blk)
               ^~~~~~~~~~~~~~~~~~~~~~
   fs/ext4/mballoc.c:6349:2: note: Taking false branch
           if (start < first_data_blk)
           ^
   fs/ext4/mballoc.c:6361:28: note: Assuming 'group' is <=3D 'last_group'
           for (group =3D first_group; group <=3D last_group; group++) {
                                     ^~~~~~~~~~~~~~~~~~~
   fs/ext4/mballoc.c:6361:2: note: Loop condition is true.  Entering loop b=
ody
           for (group =3D first_group; group <=3D last_group; group++) {
           ^
   fs/ext4/mballoc.c:6364:7: note: Assuming the condition is false
                   if (unlikely(EXT4_MB_GRP_NEED_INIT(grp))) {
                       ^
   include/linux/compiler.h:48:24: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:23:50: note: expanded from macro '__branch_chec=
k__'
   #define __branch_check__(x, expect, is_constant) ({                     \
                                                    ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/ext4/mballoc.c:6364:3: note: Taking false branch
                   if (unlikely(EXT4_MB_GRP_NEED_INIT(grp))) {
                   ^
   fs/ext4/mballoc.c:6376:7: note: Assuming 'group' is not equal to 'last_g=
roup'
                   if (group =3D=3D last_group)
                       ^~~~~~~~~~~~~~~~~~~
   fs/ext4/mballoc.c:6376:3: note: Taking false branch
                   if (group =3D=3D last_group)
                   ^
   fs/ext4/mballoc.c:6379:7: note: Assuming 'minlen' is <=3D field 'bb_free'
                   if (grp->bb_free >=3D minlen) {
                       ^~~~~~~~~~~~~~~~~~~~~~
   fs/ext4/mballoc.c:6379:3: note: Taking true branch
                   if (grp->bb_free >=3D minlen) {
                   ^
   fs/ext4/mballoc.c:6380:10: note: Calling 'ext4_trim_all_free'
                           cnt =3D ext4_trim_all_free(sb, group, first_clus=
ter,
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   fs/ext4/mballoc.c:6251:8: note: Calling 'ext4_mb_load_buddy'
           ret =3D ext4_mb_load_buddy(sb, group, &e4b);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ext4/mballoc.c:1612:9: note: Calling 'ext4_mb_load_buddy_gfp'
           return ext4_mb_load_buddy_gfp(sb, group, e4b, GFP_NOFS);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ext4/mballoc.c:1486:2: note: Loop condition is false.  Exiting loop
           might_sleep();
           ^
   include/linux/kernel.h:132:2: note: expanded from macro 'might_sleep'
           do { __might_sleep(__FILE__, __LINE__, 0); might_resched(); } wh=
ile (0)
           ^
   fs/ext4/mballoc.c:1487:2: note: Taking false branch
           mb_debug(sb, "load group %u\n", group);
           ^
   fs/ext4/mballoc.h:31:2: note: expanded from macro 'mb_debug'
           pr_debug("[%s/%d] EXT4-fs (%s): (%s, %d): %s: " fmt,            \
           ^
   include/linux/printk.h:477:2: note: expanded from macro 'pr_debug'
           no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:140:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   fs/ext4/mballoc.c:1499:6: note: Assuming the condition is true
           if (unlikely(EXT4_MB_GRP_NEED_INIT(grp))) {
               ^
   include/linux/compiler.h:48:24: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:23:50: note: expanded from macro '__branch_chec=
k__'

vim +1333 fs/ext4/mballoc.c

c9de560ded61fa Alex Tomas            2008-01-29  1158  =

c9de560ded61fa Alex Tomas            2008-01-29  1159  /* The buddy informa=
tion is attached the buddy cache inode
c9de560ded61fa Alex Tomas            2008-01-29  1160   * for convenience. =
The information regarding each group
c9de560ded61fa Alex Tomas            2008-01-29  1161   * is loaded via ext=
4_mb_load_buddy. The information involve
c9de560ded61fa Alex Tomas            2008-01-29  1162   * block bitmap and =
buddy information. The information are
c9de560ded61fa Alex Tomas            2008-01-29  1163   * stored in the ino=
de as
c9de560ded61fa Alex Tomas            2008-01-29  1164   *
c9de560ded61fa Alex Tomas            2008-01-29  1165   * {                =
        page                        }
c3a326a657562d Aneesh Kumar K.V      2008-11-25  1166   * [ group 0 bitmap]=
[ group 0 buddy] [group 1][ group 1]...
c9de560ded61fa Alex Tomas            2008-01-29  1167   *
c9de560ded61fa Alex Tomas            2008-01-29  1168   *
c9de560ded61fa Alex Tomas            2008-01-29  1169   * one block each fo=
r bitmap and buddy information.
c9de560ded61fa Alex Tomas            2008-01-29  1170   * So for each group=
 we take up 2 blocks. A page can
ea1754a084760e Kirill A. Shutemov    2016-04-01  1171   * contain blocks_pe=
r_page (PAGE_SIZE / blocksize)  blocks.
c9de560ded61fa Alex Tomas            2008-01-29  1172   * So it can have in=
formation regarding groups_per_page which
c9de560ded61fa Alex Tomas            2008-01-29  1173   * is blocks_per_pag=
e/2
8a57d9d61a6e36 Curt Wohlgemuth       2010-05-16  1174   *
8a57d9d61a6e36 Curt Wohlgemuth       2010-05-16  1175   * Locking note:  Th=
is routine takes the block group lock of all groups
8a57d9d61a6e36 Curt Wohlgemuth       2010-05-16  1176   * for this page; do=
 not hold this lock when calling this routine!
c9de560ded61fa Alex Tomas            2008-01-29  1177   */
c9de560ded61fa Alex Tomas            2008-01-29  1178  =

adb7ef600cc9d9 Konstantin Khlebnikov 2016-03-13  1179  static int ext4_mb_i=
nit_cache(struct page *page, char *incore, gfp_t gfp)
c9de560ded61fa Alex Tomas            2008-01-29  1180  {
8df9675f8b498d Theodore Ts'o         2009-05-01  1181  	ext4_group_t ngroup=
s;
c9de560ded61fa Alex Tomas            2008-01-29  1182  	int blocksize;
c9de560ded61fa Alex Tomas            2008-01-29  1183  	int blocks_per_page;
c9de560ded61fa Alex Tomas            2008-01-29  1184  	int groups_per_page;
c9de560ded61fa Alex Tomas            2008-01-29  1185  	int err =3D 0;
c9de560ded61fa Alex Tomas            2008-01-29  1186  	int i;
813e57276fd909 Theodore Ts'o         2012-02-20  1187  	ext4_group_t first_=
group, group;
c9de560ded61fa Alex Tomas            2008-01-29  1188  	int first_block;
c9de560ded61fa Alex Tomas            2008-01-29  1189  	struct super_block =
*sb;
c9de560ded61fa Alex Tomas            2008-01-29  1190  	struct buffer_head =
*bhs;
fa77dcfafeaa6b Darrick J. Wong       2012-04-29  1191  	struct buffer_head =
**bh =3D NULL;
c9de560ded61fa Alex Tomas            2008-01-29  1192  	struct inode *inode;
c9de560ded61fa Alex Tomas            2008-01-29  1193  	char *data;
c9de560ded61fa Alex Tomas            2008-01-29  1194  	char *bitmap;
9b8b7d353f5f9b Amir Goldstein        2011-05-09  1195  	struct ext4_group_i=
nfo *grinfo;
c9de560ded61fa Alex Tomas            2008-01-29  1196  =

c9de560ded61fa Alex Tomas            2008-01-29  1197  	inode =3D page->map=
ping->host;
c9de560ded61fa Alex Tomas            2008-01-29  1198  	sb =3D inode->i_sb;
8df9675f8b498d Theodore Ts'o         2009-05-01  1199  	ngroups =3D ext4_ge=
t_groups_count(sb);
93407472a21b82 Fabian Frederick      2017-02-27  1200  	blocksize =3D i_blo=
cksize(inode);
09cbfeaf1a5a67 Kirill A. Shutemov    2016-04-01  1201  	blocks_per_page =3D=
 PAGE_SIZE / blocksize;
c9de560ded61fa Alex Tomas            2008-01-29  1202  =

d3df14535f4a5b Ritesh Harjani        2020-05-10  1203  	mb_debug(sb, "init =
page %lu\n", page->index);
d3df14535f4a5b Ritesh Harjani        2020-05-10  1204  =

c9de560ded61fa Alex Tomas            2008-01-29  1205  	groups_per_page =3D=
 blocks_per_page >> 1;
c9de560ded61fa Alex Tomas            2008-01-29  1206  	if (groups_per_page=
 =3D=3D 0)
c9de560ded61fa Alex Tomas            2008-01-29  1207  		groups_per_page =
=3D 1;
c9de560ded61fa Alex Tomas            2008-01-29  1208  =

c9de560ded61fa Alex Tomas            2008-01-29  1209  	/* allocate buffer_=
heads to read bitmaps */
c9de560ded61fa Alex Tomas            2008-01-29  1210  	if (groups_per_page=
 > 1) {
c9de560ded61fa Alex Tomas            2008-01-29  1211  		i =3D sizeof(struc=
t buffer_head *) * groups_per_page;
adb7ef600cc9d9 Konstantin Khlebnikov 2016-03-13  1212  		bh =3D kzalloc(i, =
gfp);
813e57276fd909 Theodore Ts'o         2012-02-20  1213  		if (bh =3D=3D NULL=
) {
813e57276fd909 Theodore Ts'o         2012-02-20  1214  			err =3D -ENOMEM;
c9de560ded61fa Alex Tomas            2008-01-29  1215  			goto out;
813e57276fd909 Theodore Ts'o         2012-02-20  1216  		}
c9de560ded61fa Alex Tomas            2008-01-29  1217  	} else
c9de560ded61fa Alex Tomas            2008-01-29  1218  		bh =3D &bhs;
c9de560ded61fa Alex Tomas            2008-01-29  1219  =

c9de560ded61fa Alex Tomas            2008-01-29  1220  	first_group =3D pag=
e->index * blocks_per_page / 2;
c9de560ded61fa Alex Tomas            2008-01-29  1221  =

c9de560ded61fa Alex Tomas            2008-01-29  1222  	/* read all groups =
the page covers into the cache */
813e57276fd909 Theodore Ts'o         2012-02-20  1223  	for (i =3D 0, group=
 =3D first_group; i < groups_per_page; i++, group++) {
813e57276fd909 Theodore Ts'o         2012-02-20  1224  		if (group >=3D ngr=
oups)
c9de560ded61fa Alex Tomas            2008-01-29  1225  			break;
c9de560ded61fa Alex Tomas            2008-01-29  1226  =

813e57276fd909 Theodore Ts'o         2012-02-20  1227  		grinfo =3D ext4_ge=
t_group_info(sb, group);
9b8b7d353f5f9b Amir Goldstein        2011-05-09  1228  		/*
9b8b7d353f5f9b Amir Goldstein        2011-05-09  1229  		 * If page is upto=
date then we came here after online resize
9b8b7d353f5f9b Amir Goldstein        2011-05-09  1230  		 * which added som=
e new uninitialized group info structs, so
9b8b7d353f5f9b Amir Goldstein        2011-05-09  1231  		 * we must skip al=
l initialized uptodate buddies on the page,
9b8b7d353f5f9b Amir Goldstein        2011-05-09  1232  		 * which may be cu=
rrently in use by an allocating task.
9b8b7d353f5f9b Amir Goldstein        2011-05-09  1233  		 */
9b8b7d353f5f9b Amir Goldstein        2011-05-09  1234  		if (PageUptodate(p=
age) && !EXT4_MB_GRP_NEED_INIT(grinfo)) {
9b8b7d353f5f9b Amir Goldstein        2011-05-09  1235  			bh[i] =3D NULL;
9b8b7d353f5f9b Amir Goldstein        2011-05-09  1236  			continue;
9b8b7d353f5f9b Amir Goldstein        2011-05-09  1237  		}
cfd73237722135 Alex Zhuravlev        2020-04-21  1238  		bh[i] =3D ext4_rea=
d_block_bitmap_nowait(sb, group, false);
9008a58e5dcee0 Darrick J. Wong       2015-10-17  1239  		if (IS_ERR(bh[i]))=
 {
9008a58e5dcee0 Darrick J. Wong       2015-10-17  1240  			err =3D PTR_ERR(b=
h[i]);
9008a58e5dcee0 Darrick J. Wong       2015-10-17  1241  			bh[i] =3D NULL;
c9de560ded61fa Alex Tomas            2008-01-29  1242  			goto out;
2ccb5fb9f113da Aneesh Kumar K.V      2009-01-05  1243  		}
d3df14535f4a5b Ritesh Harjani        2020-05-10  1244  		mb_debug(sb, "read=
 bitmap for group %u\n", group);
c9de560ded61fa Alex Tomas            2008-01-29  1245  	}
c9de560ded61fa Alex Tomas            2008-01-29  1246  =

c9de560ded61fa Alex Tomas            2008-01-29  1247  	/* wait for I/O com=
pletion */
813e57276fd909 Theodore Ts'o         2012-02-20  1248  	for (i =3D 0, group=
 =3D first_group; i < groups_per_page; i++, group++) {
9008a58e5dcee0 Darrick J. Wong       2015-10-17  1249  		int err2;
9008a58e5dcee0 Darrick J. Wong       2015-10-17  1250  =

9008a58e5dcee0 Darrick J. Wong       2015-10-17  1251  		if (!bh[i])
9008a58e5dcee0 Darrick J. Wong       2015-10-17  1252  			continue;
9008a58e5dcee0 Darrick J. Wong       2015-10-17  1253  		err2 =3D ext4_wait=
_block_bitmap(sb, group, bh[i]);
9008a58e5dcee0 Darrick J. Wong       2015-10-17  1254  		if (!err)
9008a58e5dcee0 Darrick J. Wong       2015-10-17  1255  			err =3D err2;
813e57276fd909 Theodore Ts'o         2012-02-20  1256  	}
c9de560ded61fa Alex Tomas            2008-01-29  1257  =

c9de560ded61fa Alex Tomas            2008-01-29  1258  	first_block =3D pag=
e->index * blocks_per_page;
c9de560ded61fa Alex Tomas            2008-01-29  1259  	for (i =3D 0; i < b=
locks_per_page; i++) {
c9de560ded61fa Alex Tomas            2008-01-29  1260  		group =3D (first_b=
lock + i) >> 1;
8df9675f8b498d Theodore Ts'o         2009-05-01  1261  		if (group >=3D ngr=
oups)
c9de560ded61fa Alex Tomas            2008-01-29  1262  			break;
c9de560ded61fa Alex Tomas            2008-01-29  1263  =

9b8b7d353f5f9b Amir Goldstein        2011-05-09  1264  		if (!bh[group - fi=
rst_group])
9b8b7d353f5f9b Amir Goldstein        2011-05-09  1265  			/* skip initializ=
ed uptodate buddy */
9b8b7d353f5f9b Amir Goldstein        2011-05-09  1266  			continue;
9b8b7d353f5f9b Amir Goldstein        2011-05-09  1267  =

bbdc322f2c6006 Lukas Czerner         2015-06-08  1268  		if (!buffer_verifi=
ed(bh[group - first_group]))
bbdc322f2c6006 Lukas Czerner         2015-06-08  1269  			/* Skip faulty bi=
tmaps */
bbdc322f2c6006 Lukas Czerner         2015-06-08  1270  			continue;
bbdc322f2c6006 Lukas Czerner         2015-06-08  1271  		err =3D 0;
bbdc322f2c6006 Lukas Czerner         2015-06-08  1272  =

c9de560ded61fa Alex Tomas            2008-01-29  1273  		/*
c9de560ded61fa Alex Tomas            2008-01-29  1274  		 * data carry info=
rmation regarding this
c9de560ded61fa Alex Tomas            2008-01-29  1275  		 * particular grou=
p in the format specified
c9de560ded61fa Alex Tomas            2008-01-29  1276  		 * above
c9de560ded61fa Alex Tomas            2008-01-29  1277  		 *
c9de560ded61fa Alex Tomas            2008-01-29  1278  		 */
c9de560ded61fa Alex Tomas            2008-01-29  1279  		data =3D page_addr=
ess(page) + (i * blocksize);
c9de560ded61fa Alex Tomas            2008-01-29  1280  		bitmap =3D bh[grou=
p - first_group]->b_data;
c9de560ded61fa Alex Tomas            2008-01-29  1281  =

c9de560ded61fa Alex Tomas            2008-01-29  1282  		/*
c9de560ded61fa Alex Tomas            2008-01-29  1283  		 * We place the bu=
ddy block and bitmap block
c9de560ded61fa Alex Tomas            2008-01-29  1284  		 * close together
c9de560ded61fa Alex Tomas            2008-01-29  1285  		 */
c9de560ded61fa Alex Tomas            2008-01-29  1286  		if ((first_block +=
 i) & 1) {
c9de560ded61fa Alex Tomas            2008-01-29  1287  			/* this is block =
of buddy */
c9de560ded61fa Alex Tomas            2008-01-29  1288  			BUG_ON(incore =3D=
=3D NULL);
d3df14535f4a5b Ritesh Harjani        2020-05-10  1289  			mb_debug(sb, "put=
 buddy for group %u in page %lu/%x\n",
c9de560ded61fa Alex Tomas            2008-01-29  1290  				group, page->ind=
ex, i * blocksize);
f307333e14f6b1 Theodore Ts'o         2010-05-17  1291  			trace_ext4_mb_bud=
dy_bitmap_load(sb, group);
c9de560ded61fa Alex Tomas            2008-01-29  1292  			grinfo =3D ext4_g=
et_group_info(sb, group);
c9de560ded61fa Alex Tomas            2008-01-29  1293  			grinfo->bb_fragme=
nts =3D 0;
c9de560ded61fa Alex Tomas            2008-01-29  1294  			memset(grinfo->bb=
_counters, 0,
1927805e6599d8 Eric Sandeen          2009-08-25  1295  			       sizeof(*gr=
info->bb_counters) *
4b68f6df105966 Harshad Shirwadkar    2021-04-01  1296  			       (MB_NUM_OR=
DERS(sb)));
c9de560ded61fa Alex Tomas            2008-01-29  1297  			/*
c9de560ded61fa Alex Tomas            2008-01-29  1298  			 * incore got set=
 to the group block bitmap below
c9de560ded61fa Alex Tomas            2008-01-29  1299  			 */
7a2fcbf7f85737 Aneesh Kumar K.V      2009-01-05  1300  			ext4_lock_group(s=
b, group);
9b8b7d353f5f9b Amir Goldstein        2011-05-09  1301  			/* init the buddy=
 */
9b8b7d353f5f9b Amir Goldstein        2011-05-09  1302  			memset(data, 0xff=
, blocksize);
c9de560ded61fa Alex Tomas            2008-01-29  1303  			ext4_mb_generate_=
buddy(sb, data, incore, group);
7a2fcbf7f85737 Aneesh Kumar K.V      2009-01-05  1304  			ext4_unlock_group=
(sb, group);
c9de560ded61fa Alex Tomas            2008-01-29  1305  			incore =3D NULL;
c9de560ded61fa Alex Tomas            2008-01-29  1306  		} else {
c9de560ded61fa Alex Tomas            2008-01-29  1307  			/* this is block =
of bitmap */
c9de560ded61fa Alex Tomas            2008-01-29  1308  			BUG_ON(incore !=
=3D NULL);
d3df14535f4a5b Ritesh Harjani        2020-05-10  1309  			mb_debug(sb, "put=
 bitmap for group %u in page %lu/%x\n",
c9de560ded61fa Alex Tomas            2008-01-29  1310  				group, page->ind=
ex, i * blocksize);
f307333e14f6b1 Theodore Ts'o         2010-05-17  1311  			trace_ext4_mb_bit=
map_load(sb, group);
c9de560ded61fa Alex Tomas            2008-01-29  1312  =

c9de560ded61fa Alex Tomas            2008-01-29  1313  			/* see comments i=
n ext4_mb_put_pa() */
c9de560ded61fa Alex Tomas            2008-01-29  1314  			ext4_lock_group(s=
b, group);
c9de560ded61fa Alex Tomas            2008-01-29  1315  			memcpy(data, bitm=
ap, blocksize);
c9de560ded61fa Alex Tomas            2008-01-29  1316  =

c9de560ded61fa Alex Tomas            2008-01-29  1317  			/* mark all preal=
located blks used in in-core bitmap */
c9de560ded61fa Alex Tomas            2008-01-29  1318  			ext4_mb_generate_=
from_pa(sb, data, group);
7a2fcbf7f85737 Aneesh Kumar K.V      2009-01-05  1319  			ext4_mb_generate_=
from_freelist(sb, data, group);
c9de560ded61fa Alex Tomas            2008-01-29  1320  			ext4_unlock_group=
(sb, group);
c9de560ded61fa Alex Tomas            2008-01-29  1321  =

c9de560ded61fa Alex Tomas            2008-01-29  1322  			/* set incore so =
that the buddy information can be
c9de560ded61fa Alex Tomas            2008-01-29  1323  			 * generated usin=
g this
c9de560ded61fa Alex Tomas            2008-01-29  1324  			 */
c9de560ded61fa Alex Tomas            2008-01-29  1325  			incore =3D data;
c9de560ded61fa Alex Tomas            2008-01-29  1326  		}
c9de560ded61fa Alex Tomas            2008-01-29  1327  	}
c9de560ded61fa Alex Tomas            2008-01-29  1328  	SetPageUptodate(pag=
e);
c9de560ded61fa Alex Tomas            2008-01-29  1329  =

c9de560ded61fa Alex Tomas            2008-01-29  1330  out:
c9de560ded61fa Alex Tomas            2008-01-29  1331  	if (bh) {
9b8b7d353f5f9b Amir Goldstein        2011-05-09  1332  		for (i =3D 0; i < =
groups_per_page; i++)
c9de560ded61fa Alex Tomas            2008-01-29 @1333  			brelse(bh[i]);
c9de560ded61fa Alex Tomas            2008-01-29  1334  		if (bh !=3D &bhs)
c9de560ded61fa Alex Tomas            2008-01-29  1335  			kfree(bh);
c9de560ded61fa Alex Tomas            2008-01-29  1336  	}
c9de560ded61fa Alex Tomas            2008-01-29  1337  	return err;
c9de560ded61fa Alex Tomas            2008-01-29  1338  }
c9de560ded61fa Alex Tomas            2008-01-29  1339  =


:::::: The code@line 1333 was first introduced by commit
:::::: c9de560ded61faa5b754137b7753da252391c55a ext4: Add multi block alloc=
ator for ext4

:::::: TO: Alex Tomas <alex@clusterfs.com>
:::::: CC: Theodore Ts'o <tytso@mit.edu>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============9124454536947327485==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============9124454536947327485==--

