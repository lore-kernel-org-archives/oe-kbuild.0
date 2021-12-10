Content-Type: multipart/mixed; boundary="===============0155997130597675941=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [xiang-erofs:dev 5/5] fs/erofs/data.c:143:15: warning: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
Date: Sat, 11 Dec 2021 03:04:50 +0800
Message-ID: <202112110204.hiGFCnz2-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0155997130597675941==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: Xiang Gao <xiang@kernel.org>
CC: linux-erofs(a)lists.ozlabs.org
TO: Gao Xiang <hsiangkao@linux.alibaba.com>
CC: Yue Hu <huyue2@yulong.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs.git dev
head:   469407a3b5ed9390cfacb0363d1cc926a51f6a14
commit: 469407a3b5ed9390cfacb0363d1cc926a51f6a14 [5/5] erofs: clean up erof=
s_map_blocks tracepoints
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: riscv-randconfig-c006-20211210 (https://download.01.org/0day-ci/arc=
hive/20211211/202112110204.hiGFCnz2-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 097a1c=
b1d5ebb3a0ec4bcaed8ba3ff6a8e33c00a)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs.git/c=
ommit/?id=3D469407a3b5ed9390cfacb0363d1cc926a51f6a14
        git remote add xiang-erofs https://git.kernel.org/pub/scm/linux/ker=
nel/git/xiang/erofs.git
        git fetch --no-tags xiang-erofs dev
        git checkout 469407a3b5ed9390cfacb0363d1cc926a51f6a14
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   fs/reiserfs/namei.c:1371:2: note: Taking false branch
           if (retval !=3D NAME_FOUND || old_de.de_objectid !=3D old_inode-=
>i_ino) {
           ^
   fs/reiserfs/namei.c:1377:6: note: Assuming the condition is false
           if (S_ISDIR(old_inode_mode)) {
               ^
   include/uapi/linux/stat.h:23:21: note: expanded from macro 'S_ISDIR'
   #define S_ISDIR(m)      (((m) & S_IFMT) =3D=3D S_IFDIR)
                            ^~~~~~~~~~~~~~~~~~~~~~~~~
   fs/reiserfs/namei.c:1377:2: note: Taking false branch
           if (S_ISDIR(old_inode_mode)) {
           ^
   fs/reiserfs/namei.c:1412:6: note: Assuming 'retval' is 0
           if (retval) {
               ^~~~~~
   fs/reiserfs/namei.c:1412:2: note: Taking false branch
           if (retval) {
           ^
   fs/reiserfs/namei.c:1421:6: note: Assuming the condition is true
           if (retval =3D=3D -EEXIST) {
               ^~~~~~~~~~~~~~~~~
   fs/reiserfs/namei.c:1421:2: note: Taking true branch
           if (retval =3D=3D -EEXIST) {
           ^
   fs/reiserfs/namei.c:1422:7: note: Assuming 'new_dentry_inode' is non-null
                   if (!new_dentry_inode) {
                       ^~~~~~~~~~~~~~~~~
   fs/reiserfs/namei.c:1422:3: note: Taking false branch
                   if (!new_dentry_inode) {
                   ^
   fs/reiserfs/namei.c:1441:6: note: 'new_dentry_inode' is non-null
           if (new_dentry_inode)
               ^~~~~~~~~~~~~~~~
   fs/reiserfs/namei.c:1441:2: note: Taking true branch
           if (new_dentry_inode)
           ^
   fs/reiserfs/namei.c:1444:2: note: Loop condition is true.  Entering loop=
 body
           while (1) {
           ^
   fs/reiserfs/namei.c:1449:3: note: Taking false branch
                   if ((retval =3D
                   ^
   fs/reiserfs/namei.c:1475:7: note: 'retval' is equal to NAME_FOUND_INVISI=
BLE
                   if (retval !=3D NAME_FOUND_INVISIBLE && retval !=3D NAME=
_FOUND) {
                       ^~~~~~
   fs/reiserfs/namei.c:1475:38: note: Left side of '&&' is false
                   if (retval !=3D NAME_FOUND_INVISIBLE && retval !=3D NAME=
_FOUND) {
                                                      ^
   fs/reiserfs/namei.c:1487:7: note: Assuming the condition is true
                   if (S_ISDIR(old_inode->i_mode)) {
                       ^
   include/uapi/linux/stat.h:23:21: note: expanded from macro 'S_ISDIR'
   #define S_ISDIR(m)      (((m) & S_IFMT) =3D=3D S_IFDIR)
                            ^~~~~~~~~~~~~~~~~~~~~~~~~
   fs/reiserfs/namei.c:1487:3: note: Taking true branch
                   if (S_ISDIR(old_inode->i_mode)) {
                   ^
   fs/reiserfs/namei.c:1489:9: note: Calling 'search_by_entry_key'
                                search_by_entry_key(new_dir->i_sb,
                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/reiserfs/namei.c:126:2: note: Control jumps to 'case 1:'  at line 137
           switch (retval) {
           ^
   fs/reiserfs/namei.c:138:3: note:  Execution continues on line 149
                   break;
                   ^
   fs/reiserfs/namei.c:149:2: note: Calling 'set_de_item_location'
           set_de_item_location(de, path);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/reiserfs/namei.c:67:1: note: Returning without writing to 'de->de_ent=
ry_key.on_disk_key.k_offset'
   }
   ^
   fs/reiserfs/namei.c:149:2: note: Returning from 'set_de_item_location'
           set_de_item_location(de, path);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/reiserfs/namei.c:152:6: note: Left side of '||' is false
           if (!is_direntry_le_ih(de->de_ih) ||
               ^
   fs/reiserfs/namei.c:153:6: note: Assuming the condition is false
               COMP_SHORT_KEYS(&de->de_ih->ih_key, key)) {
               ^
   fs/reiserfs/reiserfs.h:2657:25: note: expanded from macro 'COMP_SHORT_KE=
YS'
   #define COMP_SHORT_KEYS comp_short_keys
                           ^
   fs/reiserfs/namei.c:152:2: note: Taking false branch
           if (!is_direntry_le_ih(de->de_ih) ||
           ^
   fs/reiserfs/namei.c:165:38: note: Calling 'cpu_key_k_offset'
           retval =3D bin_search_in_dir_item(de, cpu_key_k_offset(key));
                                               ^~~~~~~~~~~~~~~~~~~~~
   fs/reiserfs/reiserfs.h:1584:2: note: Undefined or garbage value returned=
 to caller
           return key->on_disk_key.k_offset;
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
>> fs/erofs/data.c:143:15: warning: Assigned value is garbage or undefined =
[clang-analyzer-core.uninitialized.Assign]
                   map->m_llen =3D map->m_plen;
                               ^
   fs/erofs/data.c:201:8: note: Calling 'erofs_map_blocks'
           ret =3D erofs_map_blocks(inode, &map, EROFS_GET_BLOCKS_RAW);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/erofs/data.c:81:2: note: Calling 'trace_erofs_map_blocks_enter'
           trace_erofs_map_blocks_enter(inode, map, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/trace/events/erofs.h:172:1: note: Returning without writing to '=
map->m_plen'
   DEFINE_EVENT(erofs__map_blocks_enter, erofs_map_blocks_enter,
   ^
   include/linux/tracepoint.h:542:2: note: expanded from macro 'DEFINE_EVEN=
T'
           DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
           ^
   include/linux/tracepoint.h:419:2: note: expanded from macro 'DECLARE_TRA=
CE'
           __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
           ^
   include/linux/tracepoint.h:343:4: note: expanded from macro '__DECLARE_T=
RACE'
           { }                                                             \
             ^
   fs/erofs/data.c:81:2: note: Returning from 'trace_erofs_map_blocks_enter'
           trace_erofs_map_blocks_enter(inode, map, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/erofs/data.c:83:6: note: Assuming field 'm_la' is < field 'i_size'
           if (map->m_la >=3D inode->i_size) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/erofs/data.c:83:2: note: Taking false branch
           if (map->m_la >=3D inode->i_size) {
           ^
   fs/erofs/data.c:90:6: note: Assuming field 'datalayout' is equal to EROF=
S_INODE_CHUNK_BASED
           if (vi->datalayout !=3D EROFS_INODE_CHUNK_BASED) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/erofs/data.c:90:2: note: Taking false branch
           if (vi->datalayout !=3D EROFS_INODE_CHUNK_BASED) {
           ^
   fs/erofs/data.c:95:6: note: Assuming the condition is false
           if (vi->chunkformat & EROFS_CHUNK_FORMAT_INDEXES)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/erofs/data.c:95:2: note: Taking false branch
           if (vi->chunkformat & EROFS_CHUNK_FORMAT_INDEXES)
           ^
   fs/erofs/data.c:104:9: note: Calling 'erofs_get_meta_page'
           page =3D erofs_get_meta_page(inode->i_sb, erofs_blknr(pos));
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/erofs/data.c:20:2: note: Taking false branch
           if (!IS_ERR(page))
           ^
   fs/erofs/data.c:22:2: note: Returning pointer (loaded from 'page'), whic=
h participates in a condition later
           return page;
           ^~~~~~~~~~~
   fs/erofs/data.c:104:9: note: Returning from 'erofs_get_meta_page'
           page =3D erofs_get_meta_page(inode->i_sb, erofs_blknr(pos));
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/erofs/data.c:105:6: note: Calling 'IS_ERR'
           if (IS_ERR(page)) {
               ^~~~~~~~~~~~
   include/linux/err.h:36:2: note: Returning the value 1, which participate=
s in a condition later
           return IS_ERR_VALUE((unsigned long)ptr);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/erofs/data.c:105:6: note: Returning from 'IS_ERR'
           if (IS_ERR(page)) {
               ^~~~~~~~~~~~
   fs/erofs/data.c:105:2: note: Taking true branch
           if (IS_ERR(page)) {
           ^
   fs/erofs/data.c:107:3: note: Control jumps to line 142
                   goto out;
                   ^
   fs/erofs/data.c:142:6: note: Assuming 'err' is 0
           if (!err)
               ^~~~
   fs/erofs/data.c:142:2: note: Taking true branch
           if (!err)
           ^
   fs/erofs/data.c:143:15: note: Assigned value is garbage or undefined
                   map->m_llen =3D map->m_plen;
                               ^ ~~~~~~~~~~~
   fs/erofs/data.c:220:20: warning: The left operand of '&' is a garbage va=
lue [clang-analyzer-core.UndefinedBinaryOperatorResult]
           if (!(map.m_flags & EROFS_MAP_MAPPED)) {
                 ~~~~~~~~~~~ ^
   fs/erofs/data.c:201:8: note: Calling 'erofs_map_blocks'
           ret =3D erofs_map_blocks(inode, &map, EROFS_GET_BLOCKS_RAW);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/erofs/data.c:81:2: note: Calling 'trace_erofs_map_blocks_enter'
           trace_erofs_map_blocks_enter(inode, map, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/trace/events/erofs.h:172:1: note: Returning without writing to '=
map->m_flags'
   DEFINE_EVENT(erofs__map_blocks_enter, erofs_map_blocks_enter,
   ^
   include/linux/tracepoint.h:542:2: note: expanded from macro 'DEFINE_EVEN=
T'
           DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
           ^
   include/linux/tracepoint.h:419:2: note: expanded from macro 'DECLARE_TRA=
CE'
           __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
           ^
   include/linux/tracepoint.h:343:4: note: expanded from macro '__DECLARE_T=
RACE'
           { }                                                             \
             ^
   fs/erofs/data.c:81:2: note: Returning from 'trace_erofs_map_blocks_enter'
           trace_erofs_map_blocks_enter(inode, map, flags);

vim +143 fs/erofs/data.c

81781b02f9845b drivers/staging/erofs/data.c Gao Xiang 2018-07-26   68  =

c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20   69  stat=
ic int erofs_map_blocks(struct inode *inode,
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20   70  			 =
   struct erofs_map_blocks *map, int flags)
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20   71  {
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20   72  	str=
uct super_block *sb =3D inode->i_sb;
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20   73  	str=
uct erofs_inode *vi =3D EROFS_I(inode);
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20   74  	str=
uct erofs_inode_chunk_index *idx;
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20   75  	str=
uct page *page;
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20   76  	u64=
 chunknr;
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20   77  	uns=
igned int unit;
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20   78  	ero=
fs_off_t pos;
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20   79  	int=
 err =3D 0;
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20   80  =

469407a3b5ed93 fs/erofs/data.c              Gao Xiang 2021-12-09   81  	tra=
ce_erofs_map_blocks_enter(inode, map, flags);
dfeab2e95a75a4 fs/erofs/data.c              Gao Xiang 2021-10-14   82  	map=
->m_deviceid =3D 0;
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20   83  	if =
(map->m_la >=3D inode->i_size) {
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20   84  		/*=
 leave out-of-bound access unmapped */
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20   85  		ma=
p->m_flags =3D 0;
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20   86  		ma=
p->m_plen =3D 0;
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20   87  		go=
to out;
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20   88  	}
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20   89  =

469407a3b5ed93 fs/erofs/data.c              Gao Xiang 2021-12-09   90  	if =
(vi->datalayout !=3D EROFS_INODE_CHUNK_BASED) {
469407a3b5ed93 fs/erofs/data.c              Gao Xiang 2021-12-09   91  		er=
r =3D erofs_map_blocks_flatmode(inode, map, flags);
469407a3b5ed93 fs/erofs/data.c              Gao Xiang 2021-12-09   92  		go=
to out;
469407a3b5ed93 fs/erofs/data.c              Gao Xiang 2021-12-09   93  	}
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20   94  =

c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20   95  	if =
(vi->chunkformat & EROFS_CHUNK_FORMAT_INDEXES)
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20   96  		un=
it =3D sizeof(*idx);			/* chunk index */
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20   97  	else
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20   98  		un=
it =3D EROFS_BLOCK_MAP_ENTRY_SIZE;	/* block map */
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20   99  =

c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20  100  	chu=
nknr =3D map->m_la >> vi->chunkbits;
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20  101  	pos=
 =3D ALIGN(iloc(EROFS_SB(sb), vi->nid) + vi->inode_isize +
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20  102  		  =
  vi->xattr_isize, unit) + unit * chunknr;
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20  103  =

c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20  104  	pag=
e =3D erofs_get_meta_page(inode->i_sb, erofs_blknr(pos));
469407a3b5ed93 fs/erofs/data.c              Gao Xiang 2021-12-09  105  	if =
(IS_ERR(page)) {
469407a3b5ed93 fs/erofs/data.c              Gao Xiang 2021-12-09  106  		er=
r =3D PTR_ERR(page);
469407a3b5ed93 fs/erofs/data.c              Gao Xiang 2021-12-09  107  		go=
to out;
469407a3b5ed93 fs/erofs/data.c              Gao Xiang 2021-12-09  108  	}
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20  109  	map=
->m_la =3D chunknr << vi->chunkbits;
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20  110  	map=
->m_plen =3D min_t(erofs_off_t, 1UL << vi->chunkbits,
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20  111  			 =
   roundup(inode->i_size - map->m_la, EROFS_BLKSIZ));
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20  112  =

c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20  113  	/* =
handle block map */
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20  114  	if =
(!(vi->chunkformat & EROFS_CHUNK_FORMAT_INDEXES)) {
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20  115  		__=
le32 *blkaddr =3D page_address(page) + erofs_blkoff(pos);
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20  116  =

c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20  117  		if=
 (le32_to_cpu(*blkaddr) =3D=3D EROFS_NULL_ADDR) {
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20  118  			m=
ap->m_flags =3D 0;
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20  119  		} =
else {
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20  120  			m=
ap->m_pa =3D blknr_to_addr(le32_to_cpu(*blkaddr));
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20  121  			m=
ap->m_flags =3D EROFS_MAP_MAPPED;
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20  122  		}
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20  123  		go=
to out_unlock;
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20  124  	}
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20  125  	/* =
parse chunk indexes */
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20  126  	idx=
 =3D page_address(page) + erofs_blkoff(pos);
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20  127  	swi=
tch (le32_to_cpu(idx->blkaddr)) {
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20  128  	cas=
e EROFS_NULL_ADDR:
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20  129  		ma=
p->m_flags =3D 0;
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20  130  		br=
eak;
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20  131  	def=
ault:
dfeab2e95a75a4 fs/erofs/data.c              Gao Xiang 2021-10-14  132  		ma=
p->m_deviceid =3D le16_to_cpu(idx->device_id) &
dfeab2e95a75a4 fs/erofs/data.c              Gao Xiang 2021-10-14  133  			E=
ROFS_SB(sb)->device_id_mask;
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20  134  		ma=
p->m_pa =3D blknr_to_addr(le32_to_cpu(idx->blkaddr));
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20  135  		ma=
p->m_flags =3D EROFS_MAP_MAPPED;
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20  136  		br=
eak;
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20  137  	}
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20  138  out_=
unlock:
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20  139  	unl=
ock_page(page);
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20  140  	put=
_page(page);
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20  141  out:
469407a3b5ed93 fs/erofs/data.c              Gao Xiang 2021-12-09  142  	if =
(!err)
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20 @143  		ma=
p->m_llen =3D map->m_plen;
469407a3b5ed93 fs/erofs/data.c              Gao Xiang 2021-12-09  144  	tra=
ce_erofs_map_blocks_exit(inode, map, flags, 0);
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20  145  	ret=
urn err;
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20  146  }
c5aa903a59db27 fs/erofs/data.c              Gao Xiang 2021-08-20  147  =


:::::: The code at line 143 was first introduced by commit
:::::: c5aa903a59db274554718cddfda9039913409ec9 erofs: support reading chun=
k-based uncompressed files

:::::: TO: Gao Xiang <hsiangkao@linux.alibaba.com>
:::::: CC: Gao Xiang <hsiangkao@linux.alibaba.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0155997130597675941==--

