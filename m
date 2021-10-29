Content-Type: multipart/mixed; boundary="===============1588220596660655829=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 3/3] block: fops: handle IOCB_USE_PI in direct IO
Date: Fri, 29 Oct 2021 23:19:08 +0800
Message-ID: <202110292330.BTXOXuLW-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1588220596660655829==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20211028112406.101314-4-a.buev@yadro.com>
References: <20211028112406.101314-4-a.buev@yadro.com>
TO: "Alexander V. Buev" <a.buev@yadro.com>
TO: linux-block(a)vger.kernel.org
CC: Jens Axboe <axboe@kernel.dk>
CC: Christoph Hellwig <hch@lst.de>
CC: "Martin K . Petersen" <martin.petersen@oracle.com>
CC: Mikhail Malygin <m.malygin@yadro.com>
CC: linux(a)yadro.com
CC: "Alexander V. Buev" <a.buev@yadro.com>

Hi "Alexander,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v5.15-rc7]
[cannot apply to axboe-block/for-next hch-configfs/for-next next-20211029]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Alexander-V-Buev/implement=
-direct-IO-with-integrity/20211028-193652
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
1fc596a56b334f4d593a2b49e5ff55af6aaa0816
:::::: branch date: 28 hours ago
:::::: commit date: 28 hours ago
config: i386-randconfig-c001-20211028 (attached as .config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 5db756=
8a6a1fcb408eb8988abdaff2a225a8eb72)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/48606c737ef4eeab1fd098ed5=
7d9966dd73b97c3
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Alexander-V-Buev/implement-direct-=
IO-with-integrity/20211028-193652
        git checkout 48606c737ef4eeab1fd098ed57d9966dd73b97c3
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                                               ^
   include/linux/err.h:36:2: note: Returning zero, which participates in a =
condition later
           return IS_ERR_VALUE((unsigned long)ptr);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ntfs/dir.c:1222:6: note: Returning from 'IS_ERR'
           if (IS_ERR(bmp_vi)) {
               ^~~~~~~~~~~~~~
   fs/ntfs/dir.c:1222:2: note: Taking false branch
           if (IS_ERR(bmp_vi)) {
           ^
   fs/ntfs/dir.c:1230:15: note: Assuming the condition is false
           if (unlikely(bmp_pos >> 3 >=3D i_size_read(bmp_vi))) {
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   fs/ntfs/dir.c:1230:2: note: Taking false branch
           if (unlikely(bmp_pos >> 3 >=3D i_size_read(bmp_vi))) {
           ^
   fs/ntfs/dir.c:1239:2: note: Taking false branch
           ntfs_debug("Reading bitmap with page index 0x%llx, bit ofs 0x%ll=
x",
           ^
   fs/ntfs/debug.h:39:2: note: expanded from macro 'ntfs_debug'
           if (0)                                                          \
           ^
   fs/ntfs/dir.c:1239:2: note: Loop condition is false.  Exiting loop
           ntfs_debug("Reading bitmap with page index 0x%llx, bit ofs 0x%ll=
x",
           ^
   fs/ntfs/debug.h:37:35: note: expanded from macro 'ntfs_debug'
   #define ntfs_debug(fmt, ...)                                            \
                                                                           ^
   fs/ntfs/dir.c:1245:6: note: Calling 'IS_ERR'
           if (IS_ERR(bmp_page)) {
               ^~~~~~~~~~~~~~~~
   include/linux/err.h:36:2: note: Returning zero, which participates in a =
condition later
           return IS_ERR_VALUE((unsigned long)ptr);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ntfs/dir.c:1245:6: note: Returning from 'IS_ERR'
           if (IS_ERR(bmp_page)) {
               ^~~~~~~~~~~~~~~~
   fs/ntfs/dir.c:1245:2: note: Taking false branch
           if (IS_ERR(bmp_page)) {
           ^
   fs/ntfs/dir.c:1253:2: note: Loop condition is false. Execution continues=
 on line 1272
           while (!(bmp[cur_bmp_pos >> 3] & (1 << (cur_bmp_pos & 7)))) {
           ^
   fs/ntfs/dir.c:1272:2: note: Taking false branch
           ntfs_debug("Handling index buffer 0x%llx.",
           ^
   fs/ntfs/debug.h:39:2: note: expanded from macro 'ntfs_debug'
           if (0)                                                          \
           ^
   fs/ntfs/dir.c:1272:2: note: Loop condition is false.  Exiting loop
           ntfs_debug("Handling index buffer 0x%llx.",
           ^
   fs/ntfs/debug.h:37:35: note: expanded from macro 'ntfs_debug'
   #define ntfs_debug(fmt, ...)                                            \
                                                                           ^
   fs/ntfs/dir.c:1275:6: note: Assuming the condition is false
           if ((prev_ia_pos & (s64)PAGE_MASK) !=3D
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ntfs/dir.c:1275:2: note: Taking false branch
           if ((prev_ia_pos & (s64)PAGE_MASK) !=3D
           ^
   fs/ntfs/dir.c:1297:2: note: Null pointer value stored to 'ia'
           ia =3D (INDEX_ALLOCATION*)(kaddr + (ia_pos & ~PAGE_MASK &
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ntfs/dir.c:1300:15: note: 'ia' is >=3D 'kaddr'
           if (unlikely((u8*)ia < kaddr || (u8*)ia > kaddr + PAGE_SIZE)) {
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   fs/ntfs/dir.c:1300:15: note: Left side of '||' is false
           if (unlikely((u8*)ia < kaddr || (u8*)ia > kaddr + PAGE_SIZE)) {
                        ^
   fs/ntfs/dir.c:1300:2: note: Taking false branch
           if (unlikely((u8*)ia < kaddr || (u8*)ia > kaddr + PAGE_SIZE)) {
           ^
   fs/ntfs/dir.c:1306:36: note: Access to field 'magic' results in a derefe=
rence of a null pointer (loaded from variable 'ia')
           if (unlikely(!ntfs_is_indx_record(ia->magic))) {
                                             ^
   fs/ntfs/layout.h:139:50: note: expanded from macro 'ntfs_is_indx_record'
   #define ntfs_is_indx_record(x)          ( ntfs_is_magic (x, INDX) )
                                                            ^
   fs/ntfs/layout.h:124:45: note: expanded from macro 'ntfs_is_magic'
   #define ntfs_is_magic(x, m)     __ntfs_is_magic(x, magic_##m)
                                                   ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
>> block/fops.c:294:24: warning: Access to field 'iov_base' results in a de=
reference of an undefined pointer value (loaded from variable 'pi_iov') [cl=
ang-analyzer-core.NullDereference]
                           _pi_iov.iov_base =3D  pi_iov->iov_base;
                                               ^~~~~~
   block/fops.c:200:16: note: 'pi_iov' declared without an initial value
           struct iovec *pi_iov, _pi_iov;
                         ^~~~~~
   block/fops.c:201:17: note: Assuming the condition is true
           bool is_poll =3D (iocb->ki_flags & IOCB_HIPRI) !=3D 0;
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/fops.c:207:6: note: Assuming the condition is false
           if (iocb->ki_flags & IOCB_USE_PI) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/fops.c:207:2: note: Taking false branch
           if (iocb->ki_flags & IOCB_USE_PI) {
           ^
   block/fops.c:233:6: note: Assuming the condition is false
           if ((pos | iov_iter_alignment(iter)) &
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/fops.c:233:2: note: Taking false branch
           if ((pos | iov_iter_alignment(iter)) &
           ^
   block/fops.c:239:8: note: Left side of '&&' is false
           dio =3D container_of(bio, struct blkdev_dio, bio);
                 ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   block/fops.c:239:8: note: Taking false branch
           dio =3D container_of(bio, struct blkdev_dio, bio);
                 ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:302:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   block/fops.c:239:8: note: Loop condition is false.  Exiting loop
           dio =3D container_of(bio, struct blkdev_dio, bio);
                 ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:300:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   block/fops.c:241:11: note: Field 'is_sync' is false
           if (dio->is_sync) {
                    ^
   block/fops.c:241:2: note: Taking false branch
           if (dio->is_sync) {
           ^
   block/fops.c:250:22: note: 'is_read' is false
           dio->should_dirty =3D is_read && iter_is_iovec(iter);
                               ^~~~~~~
   block/fops.c:250:30: note: Left side of '&&' is false
           dio->should_dirty =3D is_read && iter_is_iovec(iter);
                                       ^
   block/fops.c:256:7: note: 'is_poll' is true
           if (!is_poll)
                ^~~~~~~
   block/fops.c:256:2: note: Taking false branch
           if (!is_poll)
           ^
   block/fops.c:259:2: note: Loop condition is true.  Entering loop body
           for (;;) {
           ^
   block/fops.c:260:3: note: Assuming 'bdev' is equal to field 'bi_bdev'
                   bio_set_dev(bio, bdev);
                   ^
   include/linux/bio.h:495:6: note: expanded from macro 'bio_set_dev'
           if ((bio)->bi_bdev !=3D (bdev))                   \
               ^~~~~~~~~~~~~~~~~~~~~~~~
   block/fops.c:260:3: note: Taking false branch
                   bio_set_dev(bio, bdev);
                   ^
   include/linux/bio.h:495:2: note: expanded from macro 'bio_set_dev'
           if ((bio)->bi_bdev !=3D (bdev))                   \
           ^
   block/fops.c:260:3: note: Loop condition is false.  Exiting loop
                   bio_set_dev(bio, bdev);
                   ^
   include/linux/bio.h:492:36: note: expanded from macro 'bio_set_dev'
   #define bio_set_dev(bio, bdev)                          \

vim +294 block/fops.c

cd82cca7ebfe9c Christoph Hellwig 2021-09-07  190  =

cd82cca7ebfe9c Christoph Hellwig 2021-09-07  191  static ssize_t __blkdev_d=
irect_IO(struct kiocb *iocb, struct iov_iter *iter,
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  192  		unsigned int nr_pages)
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  193  {
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  194  	struct file *file =3D io=
cb->ki_filp;
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  195  	struct inode *inode =3D =
bdev_file_inode(file);
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  196  	struct block_device *bde=
v =3D I_BDEV(inode);
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  197  	struct blk_plug plug;
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  198  	struct blkdev_dio *dio;
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  199  	struct bio *bio;
48606c737ef4ee Alexander V. Buev 2021-10-28  200  	struct iovec *pi_iov, _p=
i_iov;
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  201  	bool is_poll =3D (iocb->=
ki_flags & IOCB_HIPRI) !=3D 0;
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  202  	bool is_read =3D (iov_it=
er_rw(iter) =3D=3D READ), is_sync;
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  203  	loff_t pos =3D iocb->ki_=
pos;
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  204  	blk_qc_t qc =3D BLK_QC_T=
_NONE;
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  205  	int ret =3D 0;
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  206  =

48606c737ef4ee Alexander V. Buev 2021-10-28  207  	if (iocb->ki_flags & IOC=
B_USE_PI) {
48606c737ef4ee Alexander V. Buev 2021-10-28  208  		struct blk_integrity *b=
i =3D blk_get_integrity(bdev->bd_disk);
48606c737ef4ee Alexander V. Buev 2021-10-28  209  		unsigned int intervals;
48606c737ef4ee Alexander V. Buev 2021-10-28  210  =

48606c737ef4ee Alexander V. Buev 2021-10-28  211  		/* Last iovec contains =
protection information. */
48606c737ef4ee Alexander V. Buev 2021-10-28  212  		if (!iter->nr_segs)
48606c737ef4ee Alexander V. Buev 2021-10-28  213  			return -EINVAL;
48606c737ef4ee Alexander V. Buev 2021-10-28  214  =

48606c737ef4ee Alexander V. Buev 2021-10-28  215  		iter->nr_segs--;
48606c737ef4ee Alexander V. Buev 2021-10-28  216  		pi_iov =3D (struct iove=
c *)(iter->iov + iter->nr_segs);
48606c737ef4ee Alexander V. Buev 2021-10-28  217  =

48606c737ef4ee Alexander V. Buev 2021-10-28  218  		/* TODO: seems iter is =
in charge of this check ? */
48606c737ef4ee Alexander V. Buev 2021-10-28  219  		if (pi_iov->iov_len > i=
ter->count)
48606c737ef4ee Alexander V. Buev 2021-10-28  220  			return -EINVAL;
48606c737ef4ee Alexander V. Buev 2021-10-28  221  =

48606c737ef4ee Alexander V. Buev 2021-10-28  222  		iter->count -=3D pi_iov=
->iov_len;
48606c737ef4ee Alexander V. Buev 2021-10-28  223  =

48606c737ef4ee Alexander V. Buev 2021-10-28  224  		intervals =3D bio_integ=
rity_intervals(bi, iter->count >> 9);
48606c737ef4ee Alexander V. Buev 2021-10-28  225  		if (unlikely(intervals =
* bi->tuple_size > pi_iov->iov_len)) {
48606c737ef4ee Alexander V. Buev 2021-10-28  226  			pr_err("Integrity & da=
ta size mismatch data=3D%lu integrity=3D%u intervals=3D%u tupple=3D%u",
48606c737ef4ee Alexander V. Buev 2021-10-28  227  				iter->count, (unsigne=
d int)pi_iov->iov_len,
48606c737ef4ee Alexander V. Buev 2021-10-28  228  				intervals, bi->tuple_=
size);
48606c737ef4ee Alexander V. Buev 2021-10-28  229  				return -EINVAL;
48606c737ef4ee Alexander V. Buev 2021-10-28  230  		}
48606c737ef4ee Alexander V. Buev 2021-10-28  231  	}
48606c737ef4ee Alexander V. Buev 2021-10-28  232  =

cd82cca7ebfe9c Christoph Hellwig 2021-09-07  233  	if ((pos | iov_iter_alig=
nment(iter)) &
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  234  	    (bdev_logical_block_=
size(bdev) - 1))
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  235  		return -EINVAL;
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  236  =

cd82cca7ebfe9c Christoph Hellwig 2021-09-07  237  	bio =3D bio_alloc_kiocb(=
iocb, nr_pages, &blkdev_dio_pool);
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  238  =

cd82cca7ebfe9c Christoph Hellwig 2021-09-07  239  	dio =3D container_of(bio=
, struct blkdev_dio, bio);
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  240  	dio->is_sync =3D is_sync=
 =3D is_sync_kiocb(iocb);
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  241  	if (dio->is_sync) {
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  242  		dio->waiter =3D current;
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  243  		bio_get(bio);
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  244  	} else {
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  245  		dio->iocb =3D iocb;
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  246  	}
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  247  =

cd82cca7ebfe9c Christoph Hellwig 2021-09-07  248  	dio->size =3D 0;
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  249  	dio->multi_bio =3D false;
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  250  	dio->should_dirty =3D is=
_read && iter_is_iovec(iter);
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  251  =

cd82cca7ebfe9c Christoph Hellwig 2021-09-07  252  	/*
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  253  	 * Don't plug for HIPRI/=
polled IO, as those should go straight
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  254  	 * to issue
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  255  	 */
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  256  	if (!is_poll)
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  257  		blk_start_plug(&plug);
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  258  =

cd82cca7ebfe9c Christoph Hellwig 2021-09-07  259  	for (;;) {
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  260  		bio_set_dev(bio, bdev);
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  261  		bio->bi_iter.bi_sector =
=3D pos >> 9;
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  262  		bio->bi_write_hint =3D =
iocb->ki_hint;
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  263  		bio->bi_private =3D dio;
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  264  		bio->bi_end_io =3D blkd=
ev_bio_end_io;
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  265  		bio->bi_ioprio =3D iocb=
->ki_ioprio;
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  266  =

cd82cca7ebfe9c Christoph Hellwig 2021-09-07  267  		ret =3D bio_iov_iter_ge=
t_pages(bio, iter);
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  268  		if (unlikely(ret)) {
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  269  			bio->bi_status =3D BLK=
_STS_IOERR;
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  270  			bio_endio(bio);
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  271  			break;
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  272  		}
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  273  =

cd82cca7ebfe9c Christoph Hellwig 2021-09-07  274  		if (is_read) {
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  275  			bio->bi_opf =3D REQ_OP=
_READ;
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  276  			if (dio->should_dirty)
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  277  				bio_set_pages_dirty(b=
io);
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  278  		} else {
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  279  			bio->bi_opf =3D dio_bi=
o_write_op(iocb);
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  280  			task_io_account_write(=
bio->bi_iter.bi_size);
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  281  		}
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  282  		if (iocb->ki_flags & IO=
CB_NOWAIT)
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  283  			bio->bi_opf |=3D REQ_N=
OWAIT;
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  284  =

cd82cca7ebfe9c Christoph Hellwig 2021-09-07  285  		dio->size +=3D bio->bi_=
iter.bi_size;
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  286  		pos +=3D bio->bi_iter.b=
i_size;
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  287  =

48606c737ef4ee Alexander V. Buev 2021-10-28  288  		/* in case we can't add=
 all data to one bio */
48606c737ef4ee Alexander V. Buev 2021-10-28  289  		/* we must split integr=
ity too */
48606c737ef4ee Alexander V. Buev 2021-10-28  290  =

48606c737ef4ee Alexander V. Buev 2021-10-28  291  		if (iocb->ki_flags & IO=
CB_USE_PI) {
48606c737ef4ee Alexander V. Buev 2021-10-28  292  			struct blk_integrity *=
bi =3D bdev_get_integrity(bio->bi_bdev);
48606c737ef4ee Alexander V. Buev 2021-10-28  293  =

48606c737ef4ee Alexander V. Buev 2021-10-28 @294  			_pi_iov.iov_base =3D  =
pi_iov->iov_base;
48606c737ef4ee Alexander V. Buev 2021-10-28  295  			_pi_iov.iov_base +=3D =
bio_integrity_bytes(bi, (dio->size-bio->bi_iter.bi_size) >> 9);
48606c737ef4ee Alexander V. Buev 2021-10-28  296  			_pi_iov.iov_len  =3D b=
io_integrity_bytes(bi, bio->bi_iter.bi_size >> 9);
48606c737ef4ee Alexander V. Buev 2021-10-28  297  		}
48606c737ef4ee Alexander V. Buev 2021-10-28  298  =

cd82cca7ebfe9c Christoph Hellwig 2021-09-07  299  		nr_pages =3D bio_iov_ve=
cs_to_alloc(iter, BIO_MAX_VECS);
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  300  		if (!nr_pages) {
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  301  			bool polled =3D false;
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  302  =

cd82cca7ebfe9c Christoph Hellwig 2021-09-07  303  			if (iocb->ki_flags & I=
OCB_HIPRI) {
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  304  				bio_set_polled(bio, i=
ocb);
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  305  				polled =3D true;
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  306  			}
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  307  =

48606c737ef4ee Alexander V. Buev 2021-10-28  308  			/* Add protection info=
rmation to bio */
48606c737ef4ee Alexander V. Buev 2021-10-28  309  			if (iocb->ki_flags & I=
OCB_USE_PI) {
48606c737ef4ee Alexander V. Buev 2021-10-28  310  				ret =3D bio_integrity=
_add_pi_iovec(bio, &_pi_iov);
48606c737ef4ee Alexander V. Buev 2021-10-28  311  				if (ret) {
48606c737ef4ee Alexander V. Buev 2021-10-28  312  					bio->bi_status =3D B=
LK_STS_IOERR;
48606c737ef4ee Alexander V. Buev 2021-10-28  313  					bio_endio(bio);
48606c737ef4ee Alexander V. Buev 2021-10-28  314  					break;
48606c737ef4ee Alexander V. Buev 2021-10-28  315  				}
48606c737ef4ee Alexander V. Buev 2021-10-28  316  			}
48606c737ef4ee Alexander V. Buev 2021-10-28  317  =

cd82cca7ebfe9c Christoph Hellwig 2021-09-07  318  			qc =3D submit_bio(bio);
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  319  =

cd82cca7ebfe9c Christoph Hellwig 2021-09-07  320  			if (polled)
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  321  				WRITE_ONCE(iocb->ki_c=
ookie, qc);
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  322  			break;
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  323  		}
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  324  =

cd82cca7ebfe9c Christoph Hellwig 2021-09-07  325  		if (!dio->multi_bio) {
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  326  			/*
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  327  			 * AIO needs an extra =
reference to ensure the dio
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  328  			 * structure which is =
embedded into the first bio
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  329  			 * stays around.
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  330  			 */
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  331  			if (!is_sync)
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  332  				bio_get(bio);
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  333  			dio->multi_bio =3D tru=
e;
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  334  			atomic_set(&dio->ref, =
2);
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  335  		} else {
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  336  			atomic_inc(&dio->ref);
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  337  		}
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  338  =

48606c737ef4ee Alexander V. Buev 2021-10-28  339  =

48606c737ef4ee Alexander V. Buev 2021-10-28  340  		if (iocb->ki_flags & IO=
CB_USE_PI) {
48606c737ef4ee Alexander V. Buev 2021-10-28  341  			ret =3D bio_integrity_=
add_pi_iovec(bio, &_pi_iov);
48606c737ef4ee Alexander V. Buev 2021-10-28  342  			if (ret) {
48606c737ef4ee Alexander V. Buev 2021-10-28  343  				bio->bi_status =3D BL=
K_STS_IOERR;
48606c737ef4ee Alexander V. Buev 2021-10-28  344  				bio_endio(bio);
48606c737ef4ee Alexander V. Buev 2021-10-28  345  				break;
48606c737ef4ee Alexander V. Buev 2021-10-28  346  			}
48606c737ef4ee Alexander V. Buev 2021-10-28  347  		}
48606c737ef4ee Alexander V. Buev 2021-10-28  348  =

cd82cca7ebfe9c Christoph Hellwig 2021-09-07  349  		submit_bio(bio);
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  350  		bio =3D bio_alloc(GFP_K=
ERNEL, nr_pages);
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  351  	}
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  352  =

cd82cca7ebfe9c Christoph Hellwig 2021-09-07  353  	if (!is_poll)
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  354  		blk_finish_plug(&plug);
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  355  =

cd82cca7ebfe9c Christoph Hellwig 2021-09-07  356  	if (!is_sync)
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  357  		return -EIOCBQUEUED;
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  358  =

cd82cca7ebfe9c Christoph Hellwig 2021-09-07  359  	for (;;) {
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  360  		set_current_state(TASK_=
UNINTERRUPTIBLE);
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  361  		if (!READ_ONCE(dio->wai=
ter))
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  362  			break;
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  363  =

cd82cca7ebfe9c Christoph Hellwig 2021-09-07  364  		if (!(iocb->ki_flags & =
IOCB_HIPRI) ||
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  365  		    !blk_poll(bdev_get_=
queue(bdev), qc, true))
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  366  			blk_io_schedule();
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  367  	}
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  368  	__set_current_state(TASK=
_RUNNING);
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  369  =

cd82cca7ebfe9c Christoph Hellwig 2021-09-07  370  	if (!ret)
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  371  		ret =3D blk_status_to_e=
rrno(dio->bio.bi_status);
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  372  	if (likely(!ret))
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  373  		ret =3D dio->size;
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  374  =

cd82cca7ebfe9c Christoph Hellwig 2021-09-07  375  	bio_put(&dio->bio);
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  376  	return ret;
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  377  }
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  378  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============1588220596660655829==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============1588220596660655829==--

