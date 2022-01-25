Content-Type: multipart/mixed; boundary="===============5974202633510972756=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [kdave-btrfs-devel:for-next-20220120 42/50] fs/btrfs/inode.c:10433:15: warning: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
Date: Tue, 25 Jan 2022 23:24:27 +0800
Message-ID: <202201252344.ipCK5rkS-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5974202633510972756==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Omar Sandoval <osandov@fb.com>
CC: David Sterba <dsterba@suse.com>

tree:   https://github.com/kdave/btrfs-devel.git for-next-20220120
head:   6fb735a475ecc1022d6f3013418f4ca597eb80fb
commit: dfd0277dca6c45b201724f16417e49f638bd04b4 [42/50] btrfs: add BTRFS_I=
OC_ENCODED_READ
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: x86_64-randconfig-c007-20220124 (https://download.01.org/0day-ci/ar=
chive/20220125/202201252344.ipCK5rkS-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 997e12=
8e2a78f5a5434fc75997441ae1ee76f8a4)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/kdave/btrfs-devel/commit/dfd0277dca6c45b201724=
f16417e49f638bd04b4
        git remote add kdave-btrfs-devel https://github.com/kdave/btrfs-dev=
el.git
        git fetch --no-tags kdave-btrfs-devel for-next-20220120
        git checkout dfd0277dca6c45b201724f16417e49f638bd04b4
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^
   fs/btrfs/inode.c:7606:6: note: 'write' is true
           if (write) {
               ^~~~~
   fs/btrfs/inode.c:7606:2: note: Taking true branch
           if (write) {
           ^
   fs/btrfs/inode.c:7607:9: note: Calling 'btrfs_get_blocks_direct_write'
                   ret =3D btrfs_get_blocks_direct_write(&em, inode, dio_da=
ta,
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/inode.c:7427:6: note: Assuming the condition is false
           if (test_bit(EXTENT_FLAG_PREALLOC, &em->flags) ||
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/inode.c:7427:6: note: Left side of '||' is false
   fs/btrfs/inode.c:7428:8: note: Assuming the condition is false
               ((BTRFS_I(inode)->flags & BTRFS_INODE_NODATACOW) &&
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/inode.c:7428:55: note: Left side of '&&' is false
               ((BTRFS_I(inode)->flags & BTRFS_INODE_NODATACOW) &&
                                                                ^
   fs/btrfs/inode.c:7443:6: note: 'can_nocow' is false
           if (can_nocow) {
               ^~~~~~~~~
   fs/btrfs/inode.c:7443:2: note: Taking false branch
           if (can_nocow) {
           ^
   fs/btrfs/inode.c:7476:3: note: Null pointer value stored to 'em'
                   *map =3D NULL;
                   ^~~~~~~~~~~
   fs/btrfs/inode.c:7482:7: note: Assuming 'ret' is >=3D 0
                   if (ret < 0)
                       ^~~~~~~
   fs/btrfs/inode.c:7482:3: note: Taking false branch
                   if (ret < 0)
                   ^
   fs/btrfs/inode.c:7487:3: note: Taking true branch
                   if (IS_ERR(em)) {
                   ^
   fs/btrfs/inode.c:7489:4: note: Control jumps to line 7513
                           goto out;
                           ^
   fs/btrfs/inode.c:7513:6: note: Assuming 'ret' is 0
           if (ret && space_reserved) {
               ^~~
   fs/btrfs/inode.c:7513:10: note: Left side of '&&' is false
           if (ret && space_reserved) {
                   ^
   fs/btrfs/inode.c:7607:9: note: Returning from 'btrfs_get_blocks_direct_w=
rite'
                   ret =3D btrfs_get_blocks_direct_write(&em, inode, dio_da=
ta,
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/inode.c:7609:7: note: 'ret' is >=3D 0
                   if (ret < 0)
                       ^~~
   fs/btrfs/inode.c:7609:3: note: Taking false branch
                   if (ret < 0)
                   ^
   fs/btrfs/inode.c:7613:18: note: Access to field 'len' results in a deref=
erence of a null pointer (loaded from variable 'em')
                   len =3D min(len, em->len - (start - em->start));
                                  ^
   include/linux/minmax.h:45:36: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                                            ^
   include/linux/minmax.h:38:17: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                                 ^
   include/linux/minmax.h:32:25: note: expanded from macro '__cmp_once'
                   typeof(y) unique_y =3D (y);               \
                                         ^
   fs/btrfs/inode.c:9227:4: warning: Value stored to 'root_log_pinned' is n=
ever read [clang-analyzer-deadcode.DeadStores]
                           root_log_pinned =3D false;
                           ^                 ~~~~~
   fs/btrfs/inode.c:9227:4: note: Value stored to 'root_log_pinned' is neve=
r read
                           root_log_pinned =3D false;
                           ^                 ~~~~~
   fs/btrfs/inode.c:9231:4: warning: Value stored to 'dest_log_pinned' is n=
ever read [clang-analyzer-deadcode.DeadStores]
                           dest_log_pinned =3D false;
                           ^                 ~~~~~
   fs/btrfs/inode.c:9231:4: note: Value stored to 'dest_log_pinned' is neve=
r read
                           dest_log_pinned =3D false;
                           ^                 ~~~~~
   fs/btrfs/inode.c:9347:2: warning: Value stored to 'ret' is never read [c=
lang-analyzer-deadcode.DeadStores]
           ret =3D 0;
           ^     ~
   fs/btrfs/inode.c:9347:2: note: Value stored to 'ret' is never read
           ret =3D 0;
           ^     ~
   fs/btrfs/inode.c:9518:3: warning: Value stored to 'log_pinned' is never =
read [clang-analyzer-deadcode.DeadStores]
                   log_pinned =3D false;
                   ^            ~~~~~
   fs/btrfs/inode.c:9518:3: note: Value stored to 'log_pinned' is never read
                   log_pinned =3D false;
                   ^            ~~~~~
>> fs/btrfs/inode.c:10433:15: warning: Assigned value is garbage or undefin=
ed [clang-analyzer-core.uninitialized.Assign]
                   remaining =3D min(geom.len, disk_io_size - cur);
                               ^
   include/linux/minmax.h:45:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ^
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^
   include/linux/minmax.h:31:3: note: expanded from macro '__cmp_once'
                   typeof(x) unique_x =3D (x);               \
                   ^
   fs/btrfs/inode.c:10559:6: note: Assuming field 'ki_pos' is < field 'i_si=
ze'
           if (iocb->ki_pos >=3D inode->i_size) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/inode.c:10559:2: note: Taking false branch
           if (iocb->ki_pos >=3D inode->i_size) {
           ^
   fs/btrfs/inode.c:10570:2: note: Loop condition is true.  Entering loop b=
ody
           for (;;) {
           ^
   fs/btrfs/inode.c:10575:7: note: Assuming 'ret' is 0
                   if (ret)
                       ^~~
   fs/btrfs/inode.c:10575:3: note: Taking false branch
                   if (ret)
                   ^
   fs/btrfs/inode.c:10580:7: note: Assuming 'ordered' is null
                   if (!ordered)
                       ^~~~~~~~
   fs/btrfs/inode.c:10580:3: note: Taking true branch
                   if (!ordered)
                   ^
   fs/btrfs/inode.c:10581:4: note:  Execution continues on line 10587
                           break;
                           ^
   fs/btrfs/inode.c:10589:2: note: Taking false branch
           if (IS_ERR(em)) {
           ^
   fs/btrfs/inode.c:10594:6: note: Assuming the condition is false
           if (em->block_start =3D=3D EXTENT_MAP_INLINE) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/inode.c:10594:2: note: Taking false branch
           if (em->block_start =3D=3D EXTENT_MAP_INLINE) {
           ^
   fs/btrfs/inode.c:10613:18: note: '__UNIQUE_ID___x1569' is >=3D '__UNIQUE=
_ID___y1570'
           encoded->len =3D (min_t(u64, extent_map_end(em), inode->i_size) -
                           ^
   include/linux/minmax.h:104:27: note: expanded from macro 'min_t'
   #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~
   fs/btrfs/inode.c:10613:18: note: '?' condition is false
           encoded->len =3D (min_t(u64, extent_map_end(em), inode->i_size) -
                           ^
   include/linux/minmax.h:104:27: note: expanded from macro 'min_t'
   #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
                                   ^
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^
   fs/btrfs/inode.c:10615:6: note: Assuming the condition is false
           if (em->block_start =3D=3D EXTENT_MAP_HOLE ||
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/inode.c:10615:6: note: Left side of '||' is false
   fs/btrfs/inode.c:10616:6: note: Assuming the condition is false
               test_bit(EXTENT_FLAG_PREALLOC, &em->flags)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/inode.c:10615:2: note: Taking false branch
           if (em->block_start =3D=3D EXTENT_MAP_HOLE ||
           ^
   fs/btrfs/inode.c:10620:13: note: Assuming the condition is true
           } else if (test_bit(EXTENT_FLAG_COMPRESSED, &em->flags)) {
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/inode.c:10620:9: note: Taking true branch
           } else if (test_bit(EXTENT_FLAG_COMPRESSED, &em->flags)) {
                  ^
   fs/btrfs/inode.c:10626:7: note: Assuming 'count' is >=3D field 'block_le=
n'
                   if (em->block_len > count) {
                       ^~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/inode.c:10626:3: note: Taking false branch
                   if (em->block_len > count) {
                   ^
   fs/btrfs/inode.c:10635:7: note: 'ret' is >=3D 0
                   if (ret < 0)
                       ^~~
   fs/btrfs/inode.c:10635:3: note: Taking false branch

vim +10433 fs/btrfs/inode.c

dfd0277dca6c45 Omar Sandoval 2021-11-17  10391  =

dfd0277dca6c45 Omar Sandoval 2021-11-17  10392  static int btrfs_encoded_re=
ad_regular_fill_pages(struct inode *inode,
dfd0277dca6c45 Omar Sandoval 2021-11-17  10393  						 u64 file_offset,
dfd0277dca6c45 Omar Sandoval 2021-11-17  10394  						 u64 disk_bytenr,
dfd0277dca6c45 Omar Sandoval 2021-11-17  10395  						 u64 disk_io_size,
dfd0277dca6c45 Omar Sandoval 2021-11-17  10396  						 struct page **pages)
dfd0277dca6c45 Omar Sandoval 2021-11-17  10397  {
dfd0277dca6c45 Omar Sandoval 2021-11-17  10398  	struct btrfs_fs_info *fs_i=
nfo =3D btrfs_sb(inode->i_sb);
dfd0277dca6c45 Omar Sandoval 2021-11-17  10399  	struct btrfs_encoded_read_=
private priv =3D {
dfd0277dca6c45 Omar Sandoval 2021-11-17  10400  		.inode =3D inode,
dfd0277dca6c45 Omar Sandoval 2021-11-17  10401  		.file_offset =3D file_off=
set,
dfd0277dca6c45 Omar Sandoval 2021-11-17  10402  		.pending =3D ATOMIC_INIT(=
1),
dfd0277dca6c45 Omar Sandoval 2021-11-17  10403  		.skip_csum =3D BTRFS_I(in=
ode)->flags & BTRFS_INODE_NODATASUM,
dfd0277dca6c45 Omar Sandoval 2021-11-17  10404  	};
dfd0277dca6c45 Omar Sandoval 2021-11-17  10405  	unsigned long i =3D 0;
dfd0277dca6c45 Omar Sandoval 2021-11-17  10406  	u64 cur =3D 0;
dfd0277dca6c45 Omar Sandoval 2021-11-17  10407  	int ret;
dfd0277dca6c45 Omar Sandoval 2021-11-17  10408  =

dfd0277dca6c45 Omar Sandoval 2021-11-17  10409  	init_waitqueue_head(&priv.=
wait);
dfd0277dca6c45 Omar Sandoval 2021-11-17  10410  	/*
dfd0277dca6c45 Omar Sandoval 2021-11-17  10411  	 * Submit bios for the ext=
ent, splitting due to bio or stripe limits as
dfd0277dca6c45 Omar Sandoval 2021-11-17  10412  	 * necessary.
dfd0277dca6c45 Omar Sandoval 2021-11-17  10413  	 */
dfd0277dca6c45 Omar Sandoval 2021-11-17  10414  	while (cur < disk_io_size)=
 {
dfd0277dca6c45 Omar Sandoval 2021-11-17  10415  		struct extent_map *em;
dfd0277dca6c45 Omar Sandoval 2021-11-17  10416  		struct btrfs_io_geometry =
geom;
dfd0277dca6c45 Omar Sandoval 2021-11-17  10417  		struct bio *bio =3D NULL;
dfd0277dca6c45 Omar Sandoval 2021-11-17  10418  		u64 remaining;
dfd0277dca6c45 Omar Sandoval 2021-11-17  10419  =

dfd0277dca6c45 Omar Sandoval 2021-11-17  10420  		em =3D btrfs_get_chunk_ma=
p(fs_info, disk_bytenr + cur,
dfd0277dca6c45 Omar Sandoval 2021-11-17  10421  					 disk_io_size - cur);
dfd0277dca6c45 Omar Sandoval 2021-11-17  10422  		if (IS_ERR(em)) {
dfd0277dca6c45 Omar Sandoval 2021-11-17  10423  			ret =3D PTR_ERR(em);
dfd0277dca6c45 Omar Sandoval 2021-11-17  10424  		} else {
dfd0277dca6c45 Omar Sandoval 2021-11-17  10425  			ret =3D btrfs_get_io_geo=
metry(fs_info, em, BTRFS_MAP_READ,
dfd0277dca6c45 Omar Sandoval 2021-11-17  10426  						    disk_bytenr + cur=
, &geom);
dfd0277dca6c45 Omar Sandoval 2021-11-17  10427  			free_extent_map(em);
dfd0277dca6c45 Omar Sandoval 2021-11-17  10428  		}
dfd0277dca6c45 Omar Sandoval 2021-11-17  10429  		if (ret) {
dfd0277dca6c45 Omar Sandoval 2021-11-17  10430  			WRITE_ONCE(priv.status, =
errno_to_blk_status(ret));
dfd0277dca6c45 Omar Sandoval 2021-11-17  10431  			break;
dfd0277dca6c45 Omar Sandoval 2021-11-17  10432  		}
dfd0277dca6c45 Omar Sandoval 2021-11-17 @10433  		remaining =3D min(geom.le=
n, disk_io_size - cur);
dfd0277dca6c45 Omar Sandoval 2021-11-17  10434  		while (bio || remaining) {
dfd0277dca6c45 Omar Sandoval 2021-11-17  10435  			size_t bytes =3D min_t(u=
64, remaining, PAGE_SIZE);
dfd0277dca6c45 Omar Sandoval 2021-11-17  10436  =

dfd0277dca6c45 Omar Sandoval 2021-11-17  10437  			if (!bio) {
dfd0277dca6c45 Omar Sandoval 2021-11-17  10438  				bio =3D btrfs_bio_alloc=
(BIO_MAX_VECS);
dfd0277dca6c45 Omar Sandoval 2021-11-17  10439  				bio->bi_iter.bi_sector =
=3D
dfd0277dca6c45 Omar Sandoval 2021-11-17  10440  					(disk_bytenr + cur) >>=
 SECTOR_SHIFT;
dfd0277dca6c45 Omar Sandoval 2021-11-17  10441  				bio->bi_end_io =3D btrf=
s_encoded_read_endio;
dfd0277dca6c45 Omar Sandoval 2021-11-17  10442  				bio->bi_private =3D &pr=
iv;
dfd0277dca6c45 Omar Sandoval 2021-11-17  10443  				bio->bi_opf =3D REQ_OP_=
READ;
dfd0277dca6c45 Omar Sandoval 2021-11-17  10444  			}
dfd0277dca6c45 Omar Sandoval 2021-11-17  10445  =

dfd0277dca6c45 Omar Sandoval 2021-11-17  10446  			if (!bytes ||
dfd0277dca6c45 Omar Sandoval 2021-11-17  10447  			    bio_add_page(bio, pa=
ges[i], bytes, 0) < bytes) {
dfd0277dca6c45 Omar Sandoval 2021-11-17  10448  				blk_status_t status;
dfd0277dca6c45 Omar Sandoval 2021-11-17  10449  =

dfd0277dca6c45 Omar Sandoval 2021-11-17  10450  				status =3D submit_encod=
ed_read_bio(inode, bio, 0,
dfd0277dca6c45 Omar Sandoval 2021-11-17  10451  								 0);
dfd0277dca6c45 Omar Sandoval 2021-11-17  10452  				if (status) {
dfd0277dca6c45 Omar Sandoval 2021-11-17  10453  					WRITE_ONCE(priv.status=
, status);
dfd0277dca6c45 Omar Sandoval 2021-11-17  10454  					bio_put(bio);
dfd0277dca6c45 Omar Sandoval 2021-11-17  10455  					goto out;
dfd0277dca6c45 Omar Sandoval 2021-11-17  10456  				}
dfd0277dca6c45 Omar Sandoval 2021-11-17  10457  				bio =3D NULL;
dfd0277dca6c45 Omar Sandoval 2021-11-17  10458  				continue;
dfd0277dca6c45 Omar Sandoval 2021-11-17  10459  			}
dfd0277dca6c45 Omar Sandoval 2021-11-17  10460  =

dfd0277dca6c45 Omar Sandoval 2021-11-17  10461  			i++;
dfd0277dca6c45 Omar Sandoval 2021-11-17  10462  			cur +=3D bytes;
dfd0277dca6c45 Omar Sandoval 2021-11-17  10463  			remaining -=3D bytes;
dfd0277dca6c45 Omar Sandoval 2021-11-17  10464  		}
dfd0277dca6c45 Omar Sandoval 2021-11-17  10465  	}
dfd0277dca6c45 Omar Sandoval 2021-11-17  10466  =

dfd0277dca6c45 Omar Sandoval 2021-11-17  10467  out:
dfd0277dca6c45 Omar Sandoval 2021-11-17  10468  	if (atomic_dec_return(&pri=
v.pending))
dfd0277dca6c45 Omar Sandoval 2021-11-17  10469  		io_wait_event(priv.wait, =
!atomic_read(&priv.pending));
dfd0277dca6c45 Omar Sandoval 2021-11-17  10470  	/* See btrfs_encoded_read_=
endio() for ordering. */
dfd0277dca6c45 Omar Sandoval 2021-11-17  10471  	return blk_status_to_errno=
(READ_ONCE(priv.status));
dfd0277dca6c45 Omar Sandoval 2021-11-17  10472  }
dfd0277dca6c45 Omar Sandoval 2021-11-17  10473  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============5974202633510972756==--

