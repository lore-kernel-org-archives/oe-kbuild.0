Content-Type: multipart/mixed; boundary="===============5358390167331055089=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: block/holder.c:10:72: warning: Parameter 'bdev' can be declared with const [constParameter]
Date: Thu, 14 Jul 2022 02:30:48 +0800
Message-ID: <202207140208.FRDaTv9L-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5358390167331055089==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: block/hol=
der.c:10:72: warning: Parameter 'bdev' can be declared with const [constPar=
ameter]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Christoph Hellwig <hch@lst.de>
CC: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   b047602d579b4fb028128a525f056bbdc890e7f0
commit: 0dbcfe247f22a6d73302dfa691c48b3c14d31c4c block: look up holders by =
bdev
date:   11 months ago
:::::: branch date: 19 hours ago
:::::: commit date: 11 months ago
compiler: arceb-elf-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 0dbcfe247f22a6d73302dfa691c48b3c14d31c4c
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag where applicable
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
--===============5358390167331055089==--

