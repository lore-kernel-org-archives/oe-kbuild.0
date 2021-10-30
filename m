Content-Type: multipart/mixed; boundary="===============1504712788228980146=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 1/3] block: bio-integrity: add PI iovec to bio
Date: Sat, 30 Oct 2021 18:29:37 +0800
Message-ID: <202110301812.rqF4TxnJ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1504712788228980146==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20211028112406.101314-2-a.buev@yadro.com>
References: <20211028112406.101314-2-a.buev@yadro.com>
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
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: riscv-randconfig-c006-20211028 (attached as .config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 5db756=
8a6a1fcb408eb8988abdaff2a225a8eb72)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/0day-ci/linux/commit/582fcf396dced9b11bbf489cd=
5f64e213de2e4fd
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Alexander-V-Buev/implement-direct-=
IO-with-integrity/20211028-193652
        git checkout 582fcf396dced9b11bbf489cd5f64e213de2e4fd
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   drivers/phy/microchip/sparx5_serdes.c:715:10: warning: 2nd function call=
 argument is an uninitialized value [clang-analyzer-core.CallAndMessage]
           u8 iw =3D sd25g28_get_iw_setting(macro->priv->dev, mode->bitwidt=
h);
                   ^
   drivers/phy/microchip/sparx5_serdes.c:2219:6: note: Assuming 'err' is 0
           if (err)
               ^~~
   drivers/phy/microchip/sparx5_serdes.c:2219:2: note: Taking false branch
           if (err)
           ^
   drivers/phy/microchip/sparx5_serdes.c:2221:6: note: Assuming field 'serd=
estype' is equal to SPX5_SDT_25G
           if (macro->serdestype =3D=3D SPX5_SDT_25G)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/phy/microchip/sparx5_serdes.c:2221:2: note: Taking true branch
           if (macro->serdestype =3D=3D SPX5_SDT_25G)
           ^
   drivers/phy/microchip/sparx5_serdes.c:2222:9: note: Calling 'sparx5_sd25=
g28_config'
                   err =3D sparx5_sd25g28_config(macro, true);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/phy/microchip/sparx5_serdes.c:1868:8: note: Calling 'sparx5_sd10=
g25_get_mode_preset'
           err =3D sparx5_sd10g25_get_mode_preset(macro, &mode);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/phy/microchip/sparx5_serdes.c:647:2: note: Control jumps to 'cas=
e SPX5_SD_MODE_SFI:'  at line 648
           switch (macro->serdesmode) {
           ^
   drivers/phy/microchip/sparx5_serdes.c:649:7: note: Assuming field 'speed=
' is not equal to SPEED_25000
                   if (macro->speed =3D=3D SPEED_25000)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/phy/microchip/sparx5_serdes.c:649:3: note: Taking false branch
                   if (macro->speed =3D=3D SPEED_25000)
                   ^
   drivers/phy/microchip/sparx5_serdes.c:651:12: note: Assuming field 'spee=
d' is not equal to SPEED_10000
                   else if (macro->speed =3D=3D SPEED_10000)
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/phy/microchip/sparx5_serdes.c:651:8: note: Taking false branch
                   else if (macro->speed =3D=3D SPEED_10000)
                        ^
   drivers/phy/microchip/sparx5_serdes.c:653:12: note: Assuming field 'spee=
d' is not equal to SPEED_5000
                   else if (macro->speed =3D=3D SPEED_5000)
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/phy/microchip/sparx5_serdes.c:653:8: note: Taking false branch
                   else if (macro->speed =3D=3D SPEED_5000)
                        ^
   drivers/phy/microchip/sparx5_serdes.c:655:3: note:  Execution continues =
on line 669
                   break;
                   ^
   drivers/phy/microchip/sparx5_serdes.c:669:2: note: Returning without wri=
ting to 'mode->bitwidth'
           return 0;
           ^
   drivers/phy/microchip/sparx5_serdes.c:1868:8: note: Returning from 'spar=
x5_sd10g25_get_mode_preset'
           err =3D sparx5_sd10g25_get_mode_preset(macro, &mode);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/phy/microchip/sparx5_serdes.c:1869:6: note: 'err' is 0
           if (err)
               ^~~
   drivers/phy/microchip/sparx5_serdes.c:1869:2: note: Taking false branch
           if (err)
           ^
   drivers/phy/microchip/sparx5_serdes.c:1871:2: note: Calling 'sparx5_sd25=
g28_get_params'
           sparx5_sd25g28_get_params(macro, &media, &mode, &args, &params);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/phy/microchip/sparx5_serdes.c:715:10: note: 2nd function call ar=
gument is an uninitialized value
           u8 iw =3D sd25g28_get_iw_setting(macro->priv->dev, mode->bitwidt=
h);
                   ^                                        ~~~~~~~~~~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   block/bfq-wf2q.c:263:7: warning: Access to field 'my_sched_data' results=
 in a dereference of a null pointer (loaded from variable 'entity') [clang-=
analyzer-core.NullDereference]
           if (!entity->my_sched_data)
                ^
   block/bfq-wf2q.c:1508:2: note: 'entity' initialized to a null pointer va=
lue
           struct bfq_entity *entity =3D NULL;
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   block/bfq-wf2q.c:1512:6: note: Assuming the condition is false
           if (bfq_tot_busy_queues(bfqd) =3D=3D 0)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/bfq-wf2q.c:1512:2: note: Taking false branch
           if (bfq_tot_busy_queues(bfqd) =3D=3D 0)
           ^
   block/bfq-wf2q.c:1521:2: note: Loop condition is false. Execution contin=
ues on line 1582
           for (; sd ; sd =3D entity->my_sched_data) {
           ^
   block/bfq-wf2q.c:1582:28: note: Passing null pointer value via 1st param=
eter 'entity'
           bfqq =3D bfq_entity_to_bfqq(entity);
                                     ^~~~~~
   block/bfq-wf2q.c:1582:9: note: Calling 'bfq_entity_to_bfqq'
           bfqq =3D bfq_entity_to_bfqq(entity);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~
   block/bfq-wf2q.c:263:7: note: Access to field 'my_sched_data' results in=
 a dereference of a null pointer (loaded from variable 'entity')
           if (!entity->my_sched_data)
                ^~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (6 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
>> block/bio-integrity.c:492:13: warning: Access to field 'bip_flags' resul=
ts in a dereference of an undefined pointer value (loaded from variable 'bi=
p') [clang-analyzer-core.NullDereference]
           if (ret && bip->bip_flags & BIP_RELEASE_PAGES)
                      ^~~
   block/bio-integrity.c:406:2: note: 'bip' declared without an initial val=
ue
           struct bio_integrity_payload *bip;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/bio-integrity.c:417:16: note: 'bi' is non-null
           if (unlikely(!bi)) {
                         ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   block/bio-integrity.c:417:2: note: Taking false branch
           if (unlikely(!bi)) {
           ^
   block/bio-integrity.c:425:15: note: Assuming 'nr_vec_page' is <=3D 8
           if (unlikely(nr_vec_page > __MAX_ONSTACK_PI_PAGES)) {
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   block/bio-integrity.c:425:2: note: Taking false branch
           if (unlikely(nr_vec_page > __MAX_ONSTACK_PI_PAGES)) {
           ^
   block/bio-integrity.c:432:15: note: Assuming the condition is true
           if (unlikely(intervals * bi->tuple_size < pi_iov->iov_len)) {
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   block/bio-integrity.c:432:2: note: Taking true branch
           if (unlikely(intervals * bi->tuple_size < pi_iov->iov_len)) {
           ^
   block/bio-integrity.c:433:3: note: Left side of '&&' is true
                   pr_err("Interval number is wrong, intervals=3D%d, bi->tu=
ple_size=3D%d, pi_iov->iov_len=3D%u",
                   ^
   include/linux/printk.h:489:2: note: expanded from macro 'pr_err'
           printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:446:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:417:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:370:7: note: expanded from macro '__printk_index_=
emit'
                   if (__builtin_constant_p(_fmt) && __builtin_constant_p(_=
level)) { \
                       ^
   block/bio-integrity.c:433:3: note: Taking true branch
                   pr_err("Interval number is wrong, intervals=3D%d, bi->tu=
ple_size=3D%d, pi_iov->iov_len=3D%u",
                   ^
   include/linux/printk.h:489:2: note: expanded from macro 'pr_err'
           printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:446:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:417:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:370:3: note: expanded from macro '__printk_index_=
emit'
                   if (__builtin_constant_p(_fmt) && __builtin_constant_p(_=
level)) { \
                   ^
   block/bio-integrity.c:433:3: note: '?' condition is true
                   pr_err("Interval number is wrong, intervals=3D%d, bi->tu=
ple_size=3D%d, pi_iov->iov_len=3D%u",
                   ^
   include/linux/printk.h:489:2: note: expanded from macro 'pr_err'
           printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:446:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:417:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:379:12: note: expanded from macro '__printk_index=
_emit'
                                   .fmt =3D __builtin_constant_p(_fmt) ? (_=
fmt) : NULL, \
                                          ^
   block/bio-integrity.c:433:3: note: '?' condition is true
                   pr_err("Interval number is wrong, intervals=3D%d, bi->tu=
ple_size=3D%d, pi_iov->iov_len=3D%u",
                   ^
   include/linux/printk.h:489:2: note: expanded from macro 'pr_err'
           printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:446:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:417:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:383:14: note: expanded from macro '__printk_index=
_emit'
                                   .level =3D __builtin_constant_p(_level) =
? (_level) : NULL, \
                                            ^
   block/bio-integrity.c:433:3: note: Loop condition is false.  Exiting loop
                   pr_err("Interval number is wrong, intervals=3D%d, bi->tu=
ple_size=3D%d, pi_iov->iov_len=3D%u",
                   ^
   include/linux/printk.h:489:2: note: expanded from macro 'pr_err'
           printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:446:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)

vim +492 block/bio-integrity.c

7ba1ba12eeef0a fs/bio-integrity.c    Martin K. Petersen 2008-06-30  394  =

582fcf396dced9 block/bio-integrity.c Alexander V. Buev  2021-10-28  395  #d=
efine __MAX_ONSTACK_PI_PAGES (8)
582fcf396dced9 block/bio-integrity.c Alexander V. Buev  2021-10-28  396  /**
582fcf396dced9 block/bio-integrity.c Alexander V. Buev  2021-10-28  397   *=
 bio_integrity_add_pi_iovec - Add PI io vector
582fcf396dced9 block/bio-integrity.c Alexander V. Buev  2021-10-28  398   *=
 @bio:	bio whose integrity vector to update
582fcf396dced9 block/bio-integrity.c Alexander V. Buev  2021-10-28  399   *=
 @pi_iov:	iovec added to @bio's integrity
582fcf396dced9 block/bio-integrity.c Alexander V. Buev  2021-10-28  400   *
582fcf396dced9 block/bio-integrity.c Alexander V. Buev  2021-10-28  401   *=
 Description: Pins pages for *pi_iov and appends them to @bio's integrity.
582fcf396dced9 block/bio-integrity.c Alexander V. Buev  2021-10-28  402   */
582fcf396dced9 block/bio-integrity.c Alexander V. Buev  2021-10-28  403  in=
t bio_integrity_add_pi_iovec(struct bio *bio, struct iovec *pi_iov)
582fcf396dced9 block/bio-integrity.c Alexander V. Buev  2021-10-28  404  {
582fcf396dced9 block/bio-integrity.c Alexander V. Buev  2021-10-28  405  	s=
truct blk_integrity *bi =3D bdev_get_integrity(bio->bi_bdev);
582fcf396dced9 block/bio-integrity.c Alexander V. Buev  2021-10-28  406  	s=
truct bio_integrity_payload *bip;
582fcf396dced9 block/bio-integrity.c Alexander V. Buev  2021-10-28  407  	s=
truct page *pi_pages[__MAX_ONSTACK_PI_PAGES];
582fcf396dced9 block/bio-integrity.c Alexander V. Buev  2021-10-28  408  	s=
truct page **pi_page =3D pi_pages;
582fcf396dced9 block/bio-integrity.c Alexander V. Buev  2021-10-28  409  	s=
truct iov_iter pi_iter;
582fcf396dced9 block/bio-integrity.c Alexander V. Buev  2021-10-28  410  	i=
nt nr_vec_page =3D 0;
582fcf396dced9 block/bio-integrity.c Alexander V. Buev  2021-10-28  411  	i=
nt ret =3D 0, intervals =3D 0;
582fcf396dced9 block/bio-integrity.c Alexander V. Buev  2021-10-28  412  	b=
ool is_write =3D op_is_write(bio_op(bio));
582fcf396dced9 block/bio-integrity.c Alexander V. Buev  2021-10-28  413  	s=
size_t size, pg_num;
582fcf396dced9 block/bio-integrity.c Alexander V. Buev  2021-10-28  414  	s=
ize_t offset;
582fcf396dced9 block/bio-integrity.c Alexander V. Buev  2021-10-28  415  	s=
ize_t len;
582fcf396dced9 block/bio-integrity.c Alexander V. Buev  2021-10-28  416  =

582fcf396dced9 block/bio-integrity.c Alexander V. Buev  2021-10-28  417  	i=
f (unlikely(!bi)) {
582fcf396dced9 block/bio-integrity.c Alexander V. Buev  2021-10-28  418  		=
pr_err("The disk is not integrity capable");
582fcf396dced9 block/bio-integrity.c Alexander V. Buev  2021-10-28  419  		=
return -EINVAL;
582fcf396dced9 block/bio-integrity.c Alexander V. Buev  2021-10-28  420  	}
582fcf396dced9 block/bio-integrity.c Alexander V. Buev  2021-10-28  421  =

582fcf396dced9 block/bio-integrity.c Alexander V. Buev  2021-10-28  422  	n=
r_vec_page =3D (pi_iov->iov_len + PAGE_SIZE - 1) >> PAGE_SHIFT;
582fcf396dced9 block/bio-integrity.c Alexander V. Buev  2021-10-28  423  	n=
r_vec_page +=3D 1; // we need this die to data of size N pages can be pinne=
d to N+1 page
582fcf396dced9 block/bio-integrity.c Alexander V. Buev  2021-10-28  424  =

582fcf396dced9 block/bio-integrity.c Alexander V. Buev  2021-10-28  425  	i=
f (unlikely(nr_vec_page > __MAX_ONSTACK_PI_PAGES)) {
582fcf396dced9 block/bio-integrity.c Alexander V. Buev  2021-10-28  426  		=
pi_page =3D kcalloc(nr_vec_page, sizeof(struct pi_page *), GFP_NOIO);
582fcf396dced9 block/bio-integrity.c Alexander V. Buev  2021-10-28  427  		=
if (!pi_page)
582fcf396dced9 block/bio-integrity.c Alexander V. Buev  2021-10-28  428  		=
	return -ENOMEM;
582fcf396dced9 block/bio-integrity.c Alexander V. Buev  2021-10-28  429  	}
582fcf396dced9 block/bio-integrity.c Alexander V. Buev  2021-10-28  430  =

582fcf396dced9 block/bio-integrity.c Alexander V. Buev  2021-10-28  431  	i=
ntervals =3D bio_integrity_intervals(bi, bio_sectors(bio));
582fcf396dced9 block/bio-integrity.c Alexander V. Buev  2021-10-28  432  	i=
f (unlikely(intervals * bi->tuple_size < pi_iov->iov_len)) {
582fcf396dced9 block/bio-integrity.c Alexander V. Buev  2021-10-28  433  		=
pr_err("Interval number is wrong, intervals=3D%d, bi->tuple_size=3D%d, pi_i=
ov->iov_len=3D%u",
582fcf396dced9 block/bio-integrity.c Alexander V. Buev  2021-10-28  434  		=
	(int)intervals, (int)bi->tuple_size,
582fcf396dced9 block/bio-integrity.c Alexander V. Buev  2021-10-28  435  		=
	(unsigned int)pi_iov->iov_len);
582fcf396dced9 block/bio-integrity.c Alexander V. Buev  2021-10-28  436  =

582fcf396dced9 block/bio-integrity.c Alexander V. Buev  2021-10-28  437  		=
ret =3D -EINVAL;
582fcf396dced9 block/bio-integrity.c Alexander V. Buev  2021-10-28  438  		=
goto exit;
582fcf396dced9 block/bio-integrity.c Alexander V. Buev  2021-10-28  439  	}
582fcf396dced9 block/bio-integrity.c Alexander V. Buev  2021-10-28  440  =

582fcf396dced9 block/bio-integrity.c Alexander V. Buev  2021-10-28  441  	b=
ip =3D bio_integrity_alloc(bio, GFP_NOIO, nr_vec_page);
582fcf396dced9 block/bio-integrity.c Alexander V. Buev  2021-10-28  442  	i=
f (IS_ERR(bip)) {
582fcf396dced9 block/bio-integrity.c Alexander V. Buev  2021-10-28  443  		=
ret =3D PTR_ERR(bip);
582fcf396dced9 block/bio-integrity.c Alexander V. Buev  2021-10-28  444  		=
goto exit;
582fcf396dced9 block/bio-integrity.c Alexander V. Buev  2021-10-28  445  	}
582fcf396dced9 block/bio-integrity.c Alexander V. Buev  2021-10-28  446  =

582fcf396dced9 block/bio-integrity.c Alexander V. Buev  2021-10-28  447  	b=
ip->bip_iter.bi_size =3D pi_iov->iov_len;
582fcf396dced9 block/bio-integrity.c Alexander V. Buev  2021-10-28  448  	b=
ip->bio_iter =3D bio->bi_iter;
582fcf396dced9 block/bio-integrity.c Alexander V. Buev  2021-10-28  449  	b=
ip_set_seed(bip, bio->bi_iter.bi_sector);
582fcf396dced9 block/bio-integrity.c Alexander V. Buev  2021-10-28  450  =

582fcf396dced9 block/bio-integrity.c Alexander V. Buev  2021-10-28  451  	i=
f (bi->flags & BLK_INTEGRITY_IP_CHECKSUM)
582fcf396dced9 block/bio-integrity.c Alexander V. Buev  2021-10-28  452  		=
bip->bip_flags |=3D BIP_IP_CHECKSUM;
582fcf396dced9 block/bio-integrity.c Alexander V. Buev  2021-10-28  453  =

582fcf396dced9 block/bio-integrity.c Alexander V. Buev  2021-10-28  454  	i=
ov_iter_init(&pi_iter, is_write ?  WRITE : READ, pi_iov, 1, pi_iov->iov_len=
);
582fcf396dced9 block/bio-integrity.c Alexander V. Buev  2021-10-28  455  =

582fcf396dced9 block/bio-integrity.c Alexander V. Buev  2021-10-28  456  	/=
/ pin user data to pages
582fcf396dced9 block/bio-integrity.c Alexander V. Buev  2021-10-28  457  	s=
ize =3D iov_iter_get_pages(&pi_iter, pi_page, LONG_MAX, nr_vec_page, &offse=
t);
582fcf396dced9 block/bio-integrity.c Alexander V. Buev  2021-10-28  458  	i=
f (unlikely(size < 0)) {
582fcf396dced9 block/bio-integrity.c Alexander V. Buev  2021-10-28  459  		=
pr_err("Failed to pin PI buffer to page");
582fcf396dced9 block/bio-integrity.c Alexander V. Buev  2021-10-28  460  		=
ret =3D -EFAULT;
582fcf396dced9 block/bio-integrity.c Alexander V. Buev  2021-10-28  461  		=
goto exit;
582fcf396dced9 block/bio-integrity.c Alexander V. Buev  2021-10-28  462  	}
582fcf396dced9 block/bio-integrity.c Alexander V. Buev  2021-10-28  463  =

582fcf396dced9 block/bio-integrity.c Alexander V. Buev  2021-10-28  464  	/=
/ calc count of pined pages
582fcf396dced9 block/bio-integrity.c Alexander V. Buev  2021-10-28  465  	i=
f (size > (PAGE_SIZE-offset)) {
582fcf396dced9 block/bio-integrity.c Alexander V. Buev  2021-10-28  466  		=
size =3D DIV_ROUND_UP(size - (PAGE_SIZE-offset), PAGE_SIZE)+1;
582fcf396dced9 block/bio-integrity.c Alexander V. Buev  2021-10-28  467  	}=
 else
582fcf396dced9 block/bio-integrity.c Alexander V. Buev  2021-10-28  468  		=
size =3D 1;
582fcf396dced9 block/bio-integrity.c Alexander V. Buev  2021-10-28  469  =

582fcf396dced9 block/bio-integrity.c Alexander V. Buev  2021-10-28  470  	/=
/ fill bio integrity biovecs the given pages
582fcf396dced9 block/bio-integrity.c Alexander V. Buev  2021-10-28  471  	l=
en =3D pi_iov->iov_len;
582fcf396dced9 block/bio-integrity.c Alexander V. Buev  2021-10-28  472  	f=
or (pg_num =3D 0; pg_num < size; ++pg_num) {
582fcf396dced9 block/bio-integrity.c Alexander V. Buev  2021-10-28  473  		=
size_t sz;
582fcf396dced9 block/bio-integrity.c Alexander V. Buev  2021-10-28  474  =

582fcf396dced9 block/bio-integrity.c Alexander V. Buev  2021-10-28  475  		=
offset =3D (pg_num)?0:offset;
582fcf396dced9 block/bio-integrity.c Alexander V. Buev  2021-10-28  476  		=
sz =3D PAGE_SIZE-offset;
582fcf396dced9 block/bio-integrity.c Alexander V. Buev  2021-10-28  477  		=
if (sz > len)
582fcf396dced9 block/bio-integrity.c Alexander V. Buev  2021-10-28  478  		=
	sz =3D len;
582fcf396dced9 block/bio-integrity.c Alexander V. Buev  2021-10-28  479  		=
ret =3D bio_integrity_add_page(bio, pi_page[pg_num], sz, offset);
582fcf396dced9 block/bio-integrity.c Alexander V. Buev  2021-10-28  480  		=
if (unlikely(ret !=3D sz)) {
582fcf396dced9 block/bio-integrity.c Alexander V. Buev  2021-10-28  481  		=
	ret =3D -ENOMEM;
582fcf396dced9 block/bio-integrity.c Alexander V. Buev  2021-10-28  482  		=
	goto exit;
582fcf396dced9 block/bio-integrity.c Alexander V. Buev  2021-10-28  483  		}
582fcf396dced9 block/bio-integrity.c Alexander V. Buev  2021-10-28  484  		=
len -=3D sz;
582fcf396dced9 block/bio-integrity.c Alexander V. Buev  2021-10-28  485  		=
bip->bip_flags |=3D BIP_RELEASE_PAGES;
582fcf396dced9 block/bio-integrity.c Alexander V. Buev  2021-10-28  486  	}
582fcf396dced9 block/bio-integrity.c Alexander V. Buev  2021-10-28  487  =

582fcf396dced9 block/bio-integrity.c Alexander V. Buev  2021-10-28  488  	r=
et =3D 0;
582fcf396dced9 block/bio-integrity.c Alexander V. Buev  2021-10-28  489  =

582fcf396dced9 block/bio-integrity.c Alexander V. Buev  2021-10-28  490  ex=
it:
582fcf396dced9 block/bio-integrity.c Alexander V. Buev  2021-10-28  491  =

582fcf396dced9 block/bio-integrity.c Alexander V. Buev  2021-10-28 @492  	i=
f (ret && bip->bip_flags & BIP_RELEASE_PAGES)
582fcf396dced9 block/bio-integrity.c Alexander V. Buev  2021-10-28  493  		=
bio_integrity_payload_release_pages(bip);
582fcf396dced9 block/bio-integrity.c Alexander V. Buev  2021-10-28  494  =

582fcf396dced9 block/bio-integrity.c Alexander V. Buev  2021-10-28  495  	i=
f (pi_page !=3D pi_pages)
582fcf396dced9 block/bio-integrity.c Alexander V. Buev  2021-10-28  496  		=
kfree(pi_page);
582fcf396dced9 block/bio-integrity.c Alexander V. Buev  2021-10-28  497  =

582fcf396dced9 block/bio-integrity.c Alexander V. Buev  2021-10-28  498  	r=
eturn ret;
582fcf396dced9 block/bio-integrity.c Alexander V. Buev  2021-10-28  499  }
582fcf396dced9 block/bio-integrity.c Alexander V. Buev  2021-10-28  500  EX=
PORT_SYMBOL(bio_integrity_add_pi_iovec);
582fcf396dced9 block/bio-integrity.c Alexander V. Buev  2021-10-28  501  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============1504712788228980146==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
/w8DtgOYz0UCAA==
--===============1504712788228980146==--

