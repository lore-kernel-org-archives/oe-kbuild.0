Content-Type: multipart/mixed; boundary="===============0796020990941805790=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [hch-misc:btrfs-bio-cleanup 19/40] fs/btrfs/raid56.c:1445:6-25: atomic_dec_and_test variation before object free at line 1447.
Date: Wed, 23 Mar 2022 01:57:52 +0800
Message-ID: <202203230147.t3TXzOyp-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0796020990941805790==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: Christoph Hellwig <hch@lst.de>

tree:   git://git.infradead.org/users/hch/misc.git btrfs-bio-cleanup
head:   61d70226fe38434a85b198ea6a0ca8c0bf7637bc
commit: bcf194cbc1bd2e0f5184ee61bac818c6b039ce8d [19/40] btrfs: defer I/O c=
ompletion based on the btrfs_raid_bio
:::::: branch date: 2 hours ago
:::::: commit date: 11 hours ago
config: microblaze-randconfig-c004-20220322 (https://download.01.org/0day-c=
i/archive/20220323/202203230147.t3TXzOyp-lkp(a)intel.com/config)
compiler: microblaze-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> fs/btrfs/raid56.c:1445:6-25: atomic_dec_and_test variation before object=
 free at line 1447.

vim +1445 fs/btrfs/raid56.c

53b381b3abeb86 David Woodhouse   2013-01-29  1433  =

bcf194cbc1bd2e Christoph Hellwig 2022-03-17  1434  static void raid56_bio_e=
nd_io(struct bio *bio)
53b381b3abeb86 David Woodhouse   2013-01-29  1435  {
53b381b3abeb86 David Woodhouse   2013-01-29  1436  	struct btrfs_raid_bio *=
rbio =3D bio->bi_private;
53b381b3abeb86 David Woodhouse   2013-01-29  1437  =

4e4cbee93d5613 Christoph Hellwig 2017-06-03  1438  	if (bio->bi_status)
53b381b3abeb86 David Woodhouse   2013-01-29  1439  		fail_bio_stripe(rbio, =
bio);
53b381b3abeb86 David Woodhouse   2013-01-29  1440  	else
53b381b3abeb86 David Woodhouse   2013-01-29  1441  		set_bio_pages_uptodate=
(bio);
53b381b3abeb86 David Woodhouse   2013-01-29  1442  =

53b381b3abeb86 David Woodhouse   2013-01-29  1443  	bio_put(bio);
53b381b3abeb86 David Woodhouse   2013-01-29  1444  =

b89e1b012c7f81 Miao Xie          2014-10-15 @1445  	if (!atomic_dec_and_tes=
t(&rbio->stripes_pending))
53b381b3abeb86 David Woodhouse   2013-01-29  1446  		return;
bcf194cbc1bd2e Christoph Hellwig 2022-03-17 @1447  	btrfs_queue_work(rbio->=
bioc->fs_info->endio_raid56_workers,
bcf194cbc1bd2e Christoph Hellwig 2022-03-17  1448  			 &rbio->end_io_work);
bcf194cbc1bd2e Christoph Hellwig 2022-03-17  1449  }
53b381b3abeb86 David Woodhouse   2013-01-29  1450  =


:::::: The code at line 1445 was first introduced by commit
:::::: b89e1b012c7f81123344058d5f245b844464d30c Btrfs, raid56: don't change=
 bbio and raid_map

:::::: TO: Miao Xie <miaox@cn.fujitsu.com>
:::::: CC: Miao Xie <miaox@cn.fujitsu.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0796020990941805790==--

