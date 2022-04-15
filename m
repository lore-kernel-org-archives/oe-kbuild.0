Content-Type: multipart/mixed; boundary="===============2222871973284382495=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: block/holder.c:10:72: warning: Parameter 'bdev' can be declared with const [constParameter]
Date: Fri, 15 Apr 2022 23:23:12 +0800
Message-ID: <202204152333.1wHVf4EU-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2222871973284382495==
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
head:   028192fea1de083f4f12bfb1eb7c4d7beb5c8ecd
commit: 0dbcfe247f22a6d73302dfa691c48b3c14d31c4c block: look up holders by =
bdev
date:   8 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 8 months ago
compiler: powerpc-linux-gcc (GCC) 11.2.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 0dbcfe247f22a6d73302dfa691c48b3c14d31c4c
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> block/holder.c:10:72: warning: Parameter 'bdev' can be declared with con=
st [constParameter]
   static struct bd_holder_disk *bd_find_holder_disk(struct block_device *b=
dev,
                                                                          ^

vim +/bdev +10 block/holder.c

c66fd019713e9cf Christoph Hellwig 2021-08-04   9  =

c66fd019713e9cf Christoph Hellwig 2021-08-04 @10  static struct bd_holder_d=
isk *bd_find_holder_disk(struct block_device *bdev,
c66fd019713e9cf Christoph Hellwig 2021-08-04  11  						  struct gendisk *d=
isk)
c66fd019713e9cf Christoph Hellwig 2021-08-04  12  {
c66fd019713e9cf Christoph Hellwig 2021-08-04  13  	struct bd_holder_disk *h=
older;
c66fd019713e9cf Christoph Hellwig 2021-08-04  14  =

0dbcfe247f22a6d Christoph Hellwig 2021-08-04  15  	list_for_each_entry(hold=
er, &disk->slave_bdevs, list)
0dbcfe247f22a6d Christoph Hellwig 2021-08-04  16  		if (holder->bdev =3D=3D=
 bdev)
c66fd019713e9cf Christoph Hellwig 2021-08-04  17  			return holder;
c66fd019713e9cf Christoph Hellwig 2021-08-04  18  	return NULL;
c66fd019713e9cf Christoph Hellwig 2021-08-04  19  }
c66fd019713e9cf Christoph Hellwig 2021-08-04  20  =


:::::: The code at line 10 was first introduced by commit
:::::: c66fd019713e9cf7d6f1243c378cd177d01fe18a block: make the block holde=
r code optional

:::::: TO: Christoph Hellwig <hch@lst.de>
:::::: CC: Jens Axboe <axboe@kernel.dk>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2222871973284382495==--

