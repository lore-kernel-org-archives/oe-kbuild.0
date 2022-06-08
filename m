Content-Type: multipart/mixed; boundary="===============3735626428706124350=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [kdave-btrfs-devel:misc-next 47/71] fs/btrfs/raid56.c:1502:5-24: atomic_dec_and_test variation before object free at line 1503.
Date: Wed, 08 Jun 2022 09:09:21 +0800
Message-ID: <202206080945.WrIdHzB3-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3735626428706124350==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Christoph Hellwig <hch@lst.de>
CC: David Sterba <dsterba@suse.com>

tree:   https://github.com/kdave/btrfs-devel.git misc-next
head:   e2a46f3f73fd5aac0241242d535905286a947113
commit: 94fa5c9a0e7e708aac2464c31b6fa062dff0871e [47/71] btrfs: defer I/O c=
ompletion based on the btrfs_raid_bio
:::::: branch date: 9 hours ago
:::::: commit date: 35 hours ago
config: i386-randconfig-c021 (https://download.01.org/0day-ci/archive/20220=
608/202206080945.WrIdHzB3-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-1) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> fs/btrfs/raid56.c:1502:5-24: atomic_dec_and_test variation before object=
 free at line 1503.

vim +1502 fs/btrfs/raid56.c

53b381b3abeb86 David Woodhouse   2013-01-29  1490  =

94fa5c9a0e7e70 Christoph Hellwig 2022-05-26  1491  static void raid56_bio_e=
nd_io(struct bio *bio)
53b381b3abeb86 David Woodhouse   2013-01-29  1492  {
53b381b3abeb86 David Woodhouse   2013-01-29  1493  	struct btrfs_raid_bio *=
rbio =3D bio->bi_private;
53b381b3abeb86 David Woodhouse   2013-01-29  1494  =

4e4cbee93d5613 Christoph Hellwig 2017-06-03  1495  	if (bio->bi_status)
53b381b3abeb86 David Woodhouse   2013-01-29  1496  		fail_bio_stripe(rbio, =
bio);
53b381b3abeb86 David Woodhouse   2013-01-29  1497  	else
5fdb7afc6f94d5 Qu Wenruo         2022-04-01  1498  		set_bio_pages_uptodate=
(rbio, bio);
53b381b3abeb86 David Woodhouse   2013-01-29  1499  =

53b381b3abeb86 David Woodhouse   2013-01-29  1500  	bio_put(bio);
53b381b3abeb86 David Woodhouse   2013-01-29  1501  =

94fa5c9a0e7e70 Christoph Hellwig 2022-05-26 @1502  	if (atomic_dec_and_test=
(&rbio->stripes_pending))
94fa5c9a0e7e70 Christoph Hellwig 2022-05-26 @1503  		queue_work(rbio->bioc-=
>fs_info->endio_raid56_workers,
94fa5c9a0e7e70 Christoph Hellwig 2022-05-26  1504  			   &rbio->end_io_work=
);
94fa5c9a0e7e70 Christoph Hellwig 2022-05-26  1505  }
53b381b3abeb86 David Woodhouse   2013-01-29  1506  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3735626428706124350==--

