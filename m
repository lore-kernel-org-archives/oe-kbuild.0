Content-Type: multipart/mixed; boundary="===============2378756699096702385=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [RFC PATCH] md: raid456 improve discard performance
Date: Thu, 10 Feb 2022 05:06:46 +0800
Message-ID: <202202100503.q4GxZJj7-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2378756699096702385==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220207152735.27381-1-vverma@digitalocean.com>
References: <20220207152735.27381-1-vverma@digitalocean.com>
TO: Vishal Verma <vverma@digitalocean.com>

Hi Vishal,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on song-md/md-next]
[also build test WARNING on v5.17-rc3 next-20220209]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Vishal-Verma/md-raid456-im=
prove-discard-performance/20220207-234145
base:   git://git.kernel.org/pub/scm/linux/kernel/git/song/md.git md-next
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/202=
20210/202202100503.q4GxZJj7-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project e8bff9=
ae54a55b4dbfeb6ba55f723abbd81bf494)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/4af21de77f50109eca27fc515=
da03b83ebc7b91a
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Vishal-Verma/md-raid456-improve-di=
scard-performance/20220207-234145
        git checkout 4af21de77f50109eca27fc515da03b83ebc7b91a
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   drivers/md/raid5.c:2185:2: warning: Value stored to 'tx' is never read [=
clang-analyzer-deadcode.DeadStores]
           tx =3D async_trigger_callback(&submit);
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/raid5.c:2185:2: note: Value stored to 'tx' is never read
           tx =3D async_trigger_callback(&submit);
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/raid5.c:2841:4: warning: 2nd function call argument is an uni=
nitialized value [clang-analyzer-core.CallAndMessage]
                           set_bit(WriteErrorSeen, &rdev->flags);
                           ^                       ~~~~~~~~~~~~
   drivers/md/raid5.c:2799:2: note: 'rdev' declared without an initial value
           struct md_rdev *rdev;
           ^~~~~~~~~~~~~~~~~~~~
   drivers/md/raid5.c:2804:15: note: Assuming 'i' is >=3D 'disks'
           for (i =3D 0 ; i < disks; i++) {
                        ^~~~~~~~~
   drivers/md/raid5.c:2804:2: note: Loop condition is false. Execution cont=
inues on line 2822
           for (i =3D 0 ; i < disks; i++) {
           ^
   drivers/md/raid5.c:2822:2: note: Taking false branch
           pr_debug("end_write_request %llu/%d, count %d, error: %d.\n",
           ^
   include/linux/printk.h:580:2: note: expanded from macro 'pr_debug'
           no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:131:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   drivers/md/raid5.c:2825:6: note: Assuming 'i' is not equal to 'disks'
           if (i =3D=3D disks) {
               ^~~~~~~~~~
   drivers/md/raid5.c:2825:2: note: Taking false branch
           if (i =3D=3D disks) {
           ^
   drivers/md/raid5.c:2831:6: note: 'replacement' is 0
           if (replacement) {
               ^~~~~~~~~~~
   drivers/md/raid5.c:2831:2: note: Taking false branch
           if (replacement) {
           ^
   drivers/md/raid5.c:2839:7: note: Assuming field 'bi_status' is not equal=
 to 0
                   if (bi->bi_status) {
                       ^~~~~~~~~~~~~
   drivers/md/raid5.c:2839:3: note: Taking true branch
                   if (bi->bi_status) {
                   ^
   drivers/md/raid5.c:2841:4: note: 2nd function call argument is an uninit=
ialized value
                           set_bit(WriteErrorSeen, &rdev->flags);
                           ^                       ~~~~~~~~~~~~
   drivers/md/raid5.c:2846:14: warning: 1st function call argument is an un=
initialized value [clang-analyzer-core.CallAndMessage]
                   } else if (is_badblock(rdev, sh->sector,
                              ^           ~~~~
   drivers/md/raid5.c:2799:2: note: 'rdev' declared without an initial value
           struct md_rdev *rdev;
           ^~~~~~~~~~~~~~~~~~~~
   drivers/md/raid5.c:2804:15: note: Assuming 'i' is >=3D 'disks'
           for (i =3D 0 ; i < disks; i++) {
                        ^~~~~~~~~
   drivers/md/raid5.c:2804:2: note: Loop condition is false. Execution cont=
inues on line 2822
           for (i =3D 0 ; i < disks; i++) {
           ^
   drivers/md/raid5.c:2822:2: note: Taking false branch
           pr_debug("end_write_request %llu/%d, count %d, error: %d.\n",
           ^
   include/linux/printk.h:580:2: note: expanded from macro 'pr_debug'
           no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:131:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   drivers/md/raid5.c:2825:6: note: Assuming 'i' is not equal to 'disks'
           if (i =3D=3D disks) {
               ^~~~~~~~~~
   drivers/md/raid5.c:2825:2: note: Taking false branch
           if (i =3D=3D disks) {
           ^
   drivers/md/raid5.c:2831:6: note: 'replacement' is 0
           if (replacement) {
               ^~~~~~~~~~~
   drivers/md/raid5.c:2831:2: note: Taking false branch
           if (replacement) {
           ^
   drivers/md/raid5.c:2839:7: note: Assuming field 'bi_status' is 0
                   if (bi->bi_status) {
                       ^~~~~~~~~~~~~
   drivers/md/raid5.c:2839:3: note: Taking false branch
                   if (bi->bi_status) {
                   ^
   drivers/md/raid5.c:2846:14: note: 1st function call argument is an unini=
tialized value
                   } else if (is_badblock(rdev, sh->sector,
                              ^           ~~~~
   drivers/md/raid5.c:4014:5: warning: Value stored to 'dev' is never read =
[clang-analyzer-deadcode.DeadStores]
                                   dev =3D &sh->dev[i];
                                   ^     ~~~~~~~~~~~
   drivers/md/raid5.c:4014:5: note: Value stored to 'dev' is never read
                                   dev =3D &sh->dev[i];
                                   ^     ~~~~~~~~~~~
>> drivers/md/raid5.c:5761:3: warning: Value stored to 'dev_start' is never=
 read [clang-analyzer-deadcode.DeadStores]
                   dev_start =3D bio_start;
                   ^           ~~~~~~~~~
   drivers/md/raid5.c:5761:3: note: Value stored to 'dev_start' is never re=
ad
                   dev_start =3D bio_start;
                   ^           ~~~~~~~~~
>> drivers/md/raid5.c:5762:3: warning: Value stored to 'dev_end' is never r=
ead [clang-analyzer-deadcode.DeadStores]
                   dev_end =3D bio_end;
                   ^         ~~~~~~~
   drivers/md/raid5.c:5762:3: note: Value stored to 'dev_end' is never read
                   dev_end =3D bio_end;
                   ^         ~~~~~~~
   include/linux/list.h:284:9: warning: Dereference of null pointer [clang-=
analyzer-core.NullDereference]
           return READ_ONCE(head->next) =3D=3D head;
                  ^
   include/asm-generic/rwonce.h:50:2: note: expanded from macro 'READ_ONCE'
           __READ_ONCE(x);                                                 \
           ^
   include/asm-generic/rwonce.h:44:24: note: expanded from macro '__READ_ON=
CE'
   #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(=
x))
                           ^
   drivers/md/raid5.c:6512:2: note: Taking false branch
           pr_debug("+++ raid5d active\n");
           ^
   include/linux/printk.h:580:2: note: expanded from macro 'pr_debug'
           no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:131:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   drivers/md/raid5.c:6519:2: note: Loop condition is true.  Entering loop =
body
           while (1) {
           ^
   drivers/md/raid5.c:6525:7: note: 'released' is 0
                   if (released)
                       ^~~~~~~~
   drivers/md/raid5.c:6525:3: note: Taking false branch
                   if (released)
                   ^
   drivers/md/raid5.c:6529:7: note: Assuming the condition is false
                       !list_empty(&conf->bitmap_list)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/raid5.c:6528:3: note: Taking false branch
                   if (
                   ^
   drivers/md/raid5.c:6540:3: note: Loop condition is false. Execution cont=
inues on line 6550
                   while ((bio =3D remove_bio_from_retry(conf, &offset))) {
                   ^
   drivers/md/raid5.c:6550:16: note: Calling 'handle_active_stripes'
                   batch_size =3D handle_active_stripes(conf, ANY_GROUP, NU=
LL,
                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/raid5.c:6413:9: note: 'batch_size' is < MAX_STRIPE_BATCH
           while (batch_size < MAX_STRIPE_BATCH &&
                  ^~~~~~~~~~
   drivers/md/raid5.c:6413:9: note: Left side of '&&' is true
   drivers/md/raid5.c:6414:10: note: Calling '__get_priority_stripe'
                           (sh =3D __get_priority_stripe(conf, group)) !=3D=
 NULL)
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/raid5.c:5520:2: note: 'handle_list' initialized to a null poi=
nter value
           struct list_head *handle_list =3D NULL;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/raid5.c:5522:20: note: Assuming the condition is false
           bool second_try =3D !r5c_is_writeback(conf->log) &&
                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/raid5.c:5522:49: note: Left side of '&&' is false
           bool second_try =3D !r5c_is_writeback(conf->log) &&
                                                          ^
   drivers/md/raid5.c:5524:20: note: Assuming the condition is true
           bool try_loprio =3D test_bit(R5C_LOG_TIGHT, &conf->cache_state) =
||
                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/raid5.c:5524:64: note: Left side of '||' is true
           bool try_loprio =3D test_bit(R5C_LOG_TIGHT, &conf->cache_state) =
||
                                                                         ^
   drivers/md/raid5.c:5530:6: note: Assuming field 'worker_cnt_per_group' i=
s not equal to 0
           if (conf->worker_cnt_per_group =3D=3D 0) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/raid5.c:5530:2: note: Taking false branch
           if (conf->worker_cnt_per_group =3D=3D 0) {
           ^
   drivers/md/raid5.c:5533:9: note: Taking false branch
           } else if (group !=3D ANY_GROUP) {
                  ^
   drivers/md/raid5.c:5539:15: note: Assuming 'i' is >=3D field 'group_cnt'
                   for (i =3D 0; i < conf->group_cnt; i++) {
                               ^~~~~~~~~~~~~~~~~~~
   drivers/md/raid5.c:5539:3: note: Loop condition is false. Execution cont=
inues on line 5548
                   for (i =3D 0; i < conf->group_cnt; i++) {
                   ^
   drivers/md/raid5.c:5548:2: note: Taking false branch
           pr_debug("%s: handle: %s hold: %s full_writes: %d bypass_count: =
%d\n",
           ^
   include/linux/printk.h:580:2: note: expanded from macro 'pr_debug'
           no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:131:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   drivers/md/raid5.c:5554:18: note: Passing null pointer value via 1st par=
ameter 'head'
           if (!list_empty(handle_list)) {
                           ^~~~~~~~~~~
   drivers/md/raid5.c:5554:7: note: Calling 'list_empty'
           if (!list_empty(handle_list)) {
                ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:284:9: note: Left side of '||' is false
           return READ_ONCE(head->next) =3D=3D head;
                  ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'

vim +/dev_start +5761 drivers/md/raid5.c

8811b5968f6216e Shaohua Li        2012-08-02  5681  =

620125f2bf8ff0c Shaohua Li        2012-10-11  5682  static void make_discar=
d_request(struct mddev *mddev, struct bio *bi)
620125f2bf8ff0c Shaohua Li        2012-10-11  5683  {
620125f2bf8ff0c Shaohua Li        2012-10-11  5684  	struct r5conf *conf =
=3D mddev->private;
4af21de77f50109 Vishal Verma      2022-02-07  5685  	sector_t bio_start, bi=
o_end;
4af21de77f50109 Vishal Verma      2022-02-07  5686  	unsigned int start_dis=
k_index, end_disk_index;
4af21de77f50109 Vishal Verma      2022-02-07  5687  	sector_t start_disk_of=
fset, end_disk_offset;
4af21de77f50109 Vishal Verma      2022-02-07  5688  	sector_t first_stripe_=
index, last_stripe_index;
4af21de77f50109 Vishal Verma      2022-02-07  5689  	sector_t split_size;
4af21de77f50109 Vishal Verma      2022-02-07  5690  	struct bio *split;
4af21de77f50109 Vishal Verma      2022-02-07  5691  	unsigned int remainder;
4af21de77f50109 Vishal Verma      2022-02-07  5692  	int d;
620125f2bf8ff0c Shaohua Li        2012-10-11  5693  	int stripe_sectors;
620125f2bf8ff0c Shaohua Li        2012-10-11  5694  =

bf2c411bb1cfc45 Vishal Verma      2021-12-21  5695  	/* We need to handle t=
his when io_uring supports discard/trim */
bf2c411bb1cfc45 Vishal Verma      2021-12-21  5696  	if (WARN_ON_ONCE(bi->b=
i_opf & REQ_NOWAIT))
bf2c411bb1cfc45 Vishal Verma      2021-12-21  5697  		return;
bf2c411bb1cfc45 Vishal Verma      2021-12-21  5698  =

4af21de77f50109 Vishal Verma      2022-02-07  5699  	/* Skip discard while =
reshape or resync is happening */
4af21de77f50109 Vishal Verma      2022-02-07  5700  	if ((mddev->reshape_po=
sition !=3D MaxSector) ||
4af21de77f50109 Vishal Verma      2022-02-07  5701  	    test_bit(MD_RECOVE=
RY_SYNC, &mddev->recovery)) {
620125f2bf8ff0c Shaohua Li        2012-10-11  5702  		return;
4af21de77f50109 Vishal Verma      2022-02-07  5703  	}
620125f2bf8ff0c Shaohua Li        2012-10-11  5704  =

620125f2bf8ff0c Shaohua Li        2012-10-11  5705  	stripe_sectors =3D con=
f->chunk_sectors *
620125f2bf8ff0c Shaohua Li        2012-10-11  5706  		(conf->raid_disks - c=
onf->max_degraded);
620125f2bf8ff0c Shaohua Li        2012-10-11  5707  =

4af21de77f50109 Vishal Verma      2022-02-07  5708  	if (bio_sectors(bi) < =
stripe_sectors * 2)
4af21de77f50109 Vishal Verma      2022-02-07  5709  		return;
620125f2bf8ff0c Shaohua Li        2012-10-11  5710  =

4af21de77f50109 Vishal Verma      2022-02-07  5711  	bio_start =3D bi->bi_i=
ter.bi_sector & ~((sector_t)RAID5_STRIPE_SECTORS(conf)-1);
4af21de77f50109 Vishal Verma      2022-02-07  5712  	bio_end =3D bio_end_se=
ctor(bi);
4af21de77f50109 Vishal Verma      2022-02-07  5713  =

4af21de77f50109 Vishal Verma      2022-02-07  5714  	/*
4af21de77f50109 Vishal Verma      2022-02-07  5715  	 * Keep bio aligned wi=
th strip size.
4af21de77f50109 Vishal Verma      2022-02-07  5716  	 */
4af21de77f50109 Vishal Verma      2022-02-07  5717  	div_u64_rem(bio_start,=
 stripe_sectors, &remainder);
4af21de77f50109 Vishal Verma      2022-02-07  5718  	if (remainder) {
4af21de77f50109 Vishal Verma      2022-02-07  5719  		split_size =3D stripe=
_sectors - remainder;
4af21de77f50109 Vishal Verma      2022-02-07  5720  		split =3D bio_split(b=
i, split_size, GFP_NOIO, &conf->bio_split);
4af21de77f50109 Vishal Verma      2022-02-07  5721  		bio_chain(split, bi);
4af21de77f50109 Vishal Verma      2022-02-07  5722  		/* Resend the fist sp=
lit part */
4af21de77f50109 Vishal Verma      2022-02-07  5723  		submit_bio_noacct(spl=
it);
4af21de77f50109 Vishal Verma      2022-02-07  5724  	}
4af21de77f50109 Vishal Verma      2022-02-07  5725  	div_u64_rem(bio_end-bi=
o_start, stripe_sectors, &remainder);
4af21de77f50109 Vishal Verma      2022-02-07  5726  	if (remainder) {
4af21de77f50109 Vishal Verma      2022-02-07  5727  		split_size =3D bio_se=
ctors(bi) - remainder;
4af21de77f50109 Vishal Verma      2022-02-07  5728  		split =3D bio_split(b=
i, split_size, GFP_NOIO, &conf->bio_split);
4af21de77f50109 Vishal Verma      2022-02-07  5729  		bio_chain(split, bi);
4af21de77f50109 Vishal Verma      2022-02-07  5730  		/* Resend the second =
split part */
4af21de77f50109 Vishal Verma      2022-02-07  5731  		submit_bio_noacct(bi);
4af21de77f50109 Vishal Verma      2022-02-07  5732  		bi =3D split;
620125f2bf8ff0c Shaohua Li        2012-10-11  5733  	}
4af21de77f50109 Vishal Verma      2022-02-07  5734  =

4af21de77f50109 Vishal Verma      2022-02-07  5735  	bio_start =3D bi->bi_i=
ter.bi_sector & ~((sector_t)RAID5_STRIPE_SECTORS(conf)-1);
4af21de77f50109 Vishal Verma      2022-02-07  5736  	bio_end =3D bio_end_se=
ctor(bi);
4af21de77f50109 Vishal Verma      2022-02-07  5737  =

4af21de77f50109 Vishal Verma      2022-02-07  5738  	bi->bi_next =3D NULL;
4af21de77f50109 Vishal Verma      2022-02-07  5739  =

4af21de77f50109 Vishal Verma      2022-02-07  5740  	first_stripe_index =3D=
 bio_start;
4af21de77f50109 Vishal Verma      2022-02-07  5741  	sector_div(first_strip=
e_index, stripe_sectors);
4af21de77f50109 Vishal Verma      2022-02-07  5742  =

4af21de77f50109 Vishal Verma      2022-02-07  5743  	last_stripe_index =3D =
bio_end;
4af21de77f50109 Vishal Verma      2022-02-07  5744  	sector_div(last_stripe=
_index, stripe_sectors);
4af21de77f50109 Vishal Verma      2022-02-07  5745  =

4af21de77f50109 Vishal Verma      2022-02-07  5746  	start_disk_index =3D (=
int)(bio_start - first_stripe_index * stripe_sectors) /
4af21de77f50109 Vishal Verma      2022-02-07  5747  		conf->chunk_sectors;
4af21de77f50109 Vishal Verma      2022-02-07  5748  	start_disk_offset =3D =
((int)(bio_start - first_stripe_index * stripe_sectors) %
4af21de77f50109 Vishal Verma      2022-02-07  5749  		conf->chunk_sectors) +
4af21de77f50109 Vishal Verma      2022-02-07  5750  		first_stripe_index * =
conf->chunk_sectors;
4af21de77f50109 Vishal Verma      2022-02-07  5751  	end_disk_index =3D (in=
t)(bio_end - last_stripe_index * stripe_sectors) /
4af21de77f50109 Vishal Verma      2022-02-07  5752  		conf->chunk_sectors;
4af21de77f50109 Vishal Verma      2022-02-07  5753  	end_disk_offset =3D ((=
int)(bio_end - last_stripe_index * stripe_sectors) %
4af21de77f50109 Vishal Verma      2022-02-07  5754  		conf->chunk_sectors) +
4af21de77f50109 Vishal Verma      2022-02-07  5755  		last_stripe_index * c=
onf->chunk_sectors;
4af21de77f50109 Vishal Verma      2022-02-07  5756  =

620125f2bf8ff0c Shaohua Li        2012-10-11  5757  	for (d =3D 0; d < conf=
->raid_disks; d++) {
4af21de77f50109 Vishal Verma      2022-02-07  5758  		sector_t dev_start, d=
ev_end;
4af21de77f50109 Vishal Verma      2022-02-07  5759  		struct md_rdev *rdev =
=3D READ_ONCE(conf->disks[d].rdev);
4af21de77f50109 Vishal Verma      2022-02-07  5760  =

4af21de77f50109 Vishal Verma      2022-02-07 @5761  		dev_start =3D bio_sta=
rt;
4af21de77f50109 Vishal Verma      2022-02-07 @5762  		dev_end =3D bio_end;
4af21de77f50109 Vishal Verma      2022-02-07  5763  =

4af21de77f50109 Vishal Verma      2022-02-07  5764  		if (d < start_disk_in=
dex)
4af21de77f50109 Vishal Verma      2022-02-07  5765  			dev_start =3D (first=
_stripe_index + 1) *
4af21de77f50109 Vishal Verma      2022-02-07  5766  				conf->chunk_sectors;
4af21de77f50109 Vishal Verma      2022-02-07  5767  		else if (d > start_di=
sk_index)
4af21de77f50109 Vishal Verma      2022-02-07  5768  			dev_start =3D first_=
stripe_index * conf->chunk_sectors;
4af21de77f50109 Vishal Verma      2022-02-07  5769  		else
4af21de77f50109 Vishal Verma      2022-02-07  5770  			dev_start =3D start_=
disk_offset;
4af21de77f50109 Vishal Verma      2022-02-07  5771  =

4af21de77f50109 Vishal Verma      2022-02-07  5772  		if (d < end_disk_inde=
x)
4af21de77f50109 Vishal Verma      2022-02-07  5773  			dev_end =3D (last_st=
ripe_index + 1) * conf->chunk_sectors;
4af21de77f50109 Vishal Verma      2022-02-07  5774  		else if (d > end_disk=
_index)
4af21de77f50109 Vishal Verma      2022-02-07  5775  			dev_end =3D last_str=
ipe_index * conf->chunk_sectors;
4af21de77f50109 Vishal Verma      2022-02-07  5776  		else
4af21de77f50109 Vishal Verma      2022-02-07  5777  			dev_end =3D end_disk=
_offset;
4af21de77f50109 Vishal Verma      2022-02-07  5778  =

4af21de77f50109 Vishal Verma      2022-02-07  5779  		if (dev_end <=3D dev_=
start)
620125f2bf8ff0c Shaohua Li        2012-10-11  5780  			continue;
620125f2bf8ff0c Shaohua Li        2012-10-11  5781  =

4af21de77f50109 Vishal Verma      2022-02-07  5782  		md_submit_discard_bio=
(mddev, rdev, bi,
4af21de77f50109 Vishal Verma      2022-02-07  5783  					dev_start + rdev->=
data_offset,
4af21de77f50109 Vishal Verma      2022-02-07  5784  					dev_end - dev_star=
t);
620125f2bf8ff0c Shaohua Li        2012-10-11  5785  	}
620125f2bf8ff0c Shaohua Li        2012-10-11  5786  =

4246a0b63bd8f56 Christoph Hellwig 2015-07-20  5787  	bio_endio(bi);
620125f2bf8ff0c Shaohua Li        2012-10-11  5788  }
620125f2bf8ff0c Shaohua Li        2012-10-11  5789  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2378756699096702385==--

