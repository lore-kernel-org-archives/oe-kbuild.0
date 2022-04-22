Content-Type: multipart/mixed; boundary="===============4617025834829130701=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [hch-misc:btrfs-bio-cleanup-part3 8/11] fs/btrfs/raid56.c:1569:5-24: atomic_dec_and_test variation before object free at line 1570.
Date: Fri, 22 Apr 2022 18:16:28 +0800
Message-ID: <202204221824.DDRHdDjK-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4617025834829130701==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: Christoph Hellwig <hch@lst.de>

tree:   git://git.infradead.org/users/hch/misc.git btrfs-bio-cleanup-part3
head:   621cdb6aa35404cf997473fcc74261760c196744
commit: 12454b5a1f9a0386689b28a04a1029d4a5a717ad [8/11] btrfs: defer I/O co=
mpletion based on the btrfs_raid_bio
:::::: branch date: 4 hours ago
:::::: commit date: 4 hours ago
config: i386-randconfig-c021 (https://download.01.org/0day-ci/archive/20220=
422/202204221824.DDRHdDjK-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-20) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> fs/btrfs/raid56.c:1569:5-24: atomic_dec_and_test variation before object=
 free at line 1570.

vim +1569 fs/btrfs/raid56.c

53b381b3abeb86 David Woodhouse   2013-01-29  1557  =

12454b5a1f9a03 Christoph Hellwig 2022-04-22  1558  static void raid56_bio_e=
nd_io(struct bio *bio)
53b381b3abeb86 David Woodhouse   2013-01-29  1559  {
53b381b3abeb86 David Woodhouse   2013-01-29  1560  	struct btrfs_raid_bio *=
rbio =3D bio->bi_private;
53b381b3abeb86 David Woodhouse   2013-01-29  1561  =

4e4cbee93d5613 Christoph Hellwig 2017-06-03  1562  	if (bio->bi_status)
53b381b3abeb86 David Woodhouse   2013-01-29  1563  		fail_bio_stripe(rbio, =
bio);
53b381b3abeb86 David Woodhouse   2013-01-29  1564  	else
e45c3ccf4fd389 Qu Wenruo         2022-04-01  1565  		set_bio_pages_uptodate=
(rbio, bio);
53b381b3abeb86 David Woodhouse   2013-01-29  1566  =

53b381b3abeb86 David Woodhouse   2013-01-29  1567  	bio_put(bio);
53b381b3abeb86 David Woodhouse   2013-01-29  1568  =

12454b5a1f9a03 Christoph Hellwig 2022-04-22 @1569  	if (atomic_dec_and_test=
(&rbio->stripes_pending))
12454b5a1f9a03 Christoph Hellwig 2022-04-22 @1570  		queue_work(rbio->bioc-=
>fs_info->endio_raid56_workers,
12454b5a1f9a03 Christoph Hellwig 2022-04-22  1571  			   &rbio->end_io_work=
);
12454b5a1f9a03 Christoph Hellwig 2022-04-22  1572  }
53b381b3abeb86 David Woodhouse   2013-01-29  1573  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4617025834829130701==--

