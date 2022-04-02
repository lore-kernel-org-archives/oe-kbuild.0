Content-Type: multipart/mixed; boundary="===============1960553559047645640=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: block/holder.c:10:72: warning: Parameter 'bdev' can be declared with const [constParameter]
Date: Sun, 03 Apr 2022 03:44:52 +0800
Message-ID: <202204030348.htSSUVTN-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1960553559047645640==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Christoph Hellwig <hch@lst.de>
CC: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   88e6c0207623874922712e162e25d9dafd39661e
commit: 0dbcfe247f22a6d73302dfa691c48b3c14d31c4c block: look up holders by =
bdev
date:   8 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 8 months ago
compiler: nios2-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> block/holder.c:10:72: warning: Parameter 'bdev' can be declared with con=
st [constParameter]
   static struct bd_holder_disk *bd_find_holder_disk(struct block_device *b=
dev,
                                                                          ^

vim +/bdev +10 block/holder.c

c66fd019713e9c Christoph Hellwig 2021-08-04   9  =

c66fd019713e9c Christoph Hellwig 2021-08-04 @10  static struct bd_holder_di=
sk *bd_find_holder_disk(struct block_device *bdev,
c66fd019713e9c Christoph Hellwig 2021-08-04  11  						  struct gendisk *di=
sk)
c66fd019713e9c Christoph Hellwig 2021-08-04  12  {
c66fd019713e9c Christoph Hellwig 2021-08-04  13  	struct bd_holder_disk *ho=
lder;
c66fd019713e9c Christoph Hellwig 2021-08-04  14  =

0dbcfe247f22a6 Christoph Hellwig 2021-08-04  15  	list_for_each_entry(holde=
r, &disk->slave_bdevs, list)
0dbcfe247f22a6 Christoph Hellwig 2021-08-04  16  		if (holder->bdev =3D=3D =
bdev)
c66fd019713e9c Christoph Hellwig 2021-08-04  17  			return holder;
c66fd019713e9c Christoph Hellwig 2021-08-04  18  	return NULL;
c66fd019713e9c Christoph Hellwig 2021-08-04  19  }
c66fd019713e9c Christoph Hellwig 2021-08-04  20  =


:::::: The code at line 10 was first introduced by commit
:::::: c66fd019713e9cf7d6f1243c378cd177d01fe18a block: make the block holde=
r code optional

:::::: TO: Christoph Hellwig <hch@lst.de>
:::::: CC: Jens Axboe <axboe@kernel.dk>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1960553559047645640==--

