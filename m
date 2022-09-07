Content-Type: multipart/mixed; boundary="===============4213333072133571112=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: block/bdev.c:543:11: warning: Parameter 'holder' can be declared with const [constParameter]
Date: Thu, 08 Sep 2022 06:07:13 +0800
Message-ID: <202209080605.bMoPAFFE-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4213333072133571112==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check first_new_problem:=
 block/bdev.c:543:11: warning: Parameter 'holder' can be declared with cons=
t [constParameter]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Christoph Hellwig <hch@lst.de>
CC: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   0066f1b0e27556381402db3ff31f85d2a2265858
commit: e4a19f7289f3fa9b2a4e65d0f4b3a7816e8e445b block: don't include blk-m=
q.h in blk.h
date:   9 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 9 months ago
compiler: mipsel-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout e4a19f7289f3fa9b2a4e65d0f4b3a7816e8e445b
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> block/bdev.c:543:11: warning: Parameter 'holder' can be declared with co=
nst [constParameter]
       void *holder)
             ^
   block/bdev.c:605:65: warning: Parameter 'holder' can be declared with co=
nst [constParameter]
   static void bd_clear_claiming(struct block_device *whole, void *holder)
                                                                   ^

vim +/holder +543 block/bdev.c

^1da177e4c3f41 fs/block_dev.c Linus Torvalds  2005-04-16  527  =

1a3cbbc5a5e8a6 fs/block_dev.c Tejun Heo       2010-04-07  528  /**
1a3cbbc5a5e8a6 fs/block_dev.c Tejun Heo       2010-04-07  529   * bd_may_cl=
aim - test whether a block device can be claimed
1a3cbbc5a5e8a6 fs/block_dev.c Tejun Heo       2010-04-07  530   * @bdev: bl=
ock device of interest
1a3cbbc5a5e8a6 fs/block_dev.c Tejun Heo       2010-04-07  531   * @whole: w=
hole block device containing @bdev, may equal @bdev
1a3cbbc5a5e8a6 fs/block_dev.c Tejun Heo       2010-04-07  532   * @holder: =
holder trying to claim @bdev
1a3cbbc5a5e8a6 fs/block_dev.c Tejun Heo       2010-04-07  533   *
25985edcedea63 fs/block_dev.c Lucas De Marchi 2011-03-30  534   * Test whet=
her @bdev can be claimed by @holder.
1a3cbbc5a5e8a6 fs/block_dev.c Tejun Heo       2010-04-07  535   *
1a3cbbc5a5e8a6 fs/block_dev.c Tejun Heo       2010-04-07  536   * CONTEXT:
1a3cbbc5a5e8a6 fs/block_dev.c Tejun Heo       2010-04-07  537   * spin_lock=
(&bdev_lock).
1a3cbbc5a5e8a6 fs/block_dev.c Tejun Heo       2010-04-07  538   *
1a3cbbc5a5e8a6 fs/block_dev.c Tejun Heo       2010-04-07  539   * RETURNS:
1a3cbbc5a5e8a6 fs/block_dev.c Tejun Heo       2010-04-07  540   * %true if =
@bdev can be claimed, %false otherwise.
1a3cbbc5a5e8a6 fs/block_dev.c Tejun Heo       2010-04-07  541   */
1a3cbbc5a5e8a6 fs/block_dev.c Tejun Heo       2010-04-07  542  static bool =
bd_may_claim(struct block_device *bdev, struct block_device *whole,
1a3cbbc5a5e8a6 fs/block_dev.c Tejun Heo       2010-04-07 @543  			 void *ho=
lder)
^1da177e4c3f41 fs/block_dev.c Linus Torvalds  2005-04-16  544  {
^1da177e4c3f41 fs/block_dev.c Linus Torvalds  2005-04-16  545  	if (bdev->b=
d_holder =3D=3D holder)
1a3cbbc5a5e8a6 fs/block_dev.c Tejun Heo       2010-04-07  546  		return tru=
e;	 /* already a holder */
^1da177e4c3f41 fs/block_dev.c Linus Torvalds  2005-04-16  547  	else if (bd=
ev->bd_holder !=3D NULL)
1a3cbbc5a5e8a6 fs/block_dev.c Tejun Heo       2010-04-07  548  		return fal=
se; 	 /* held by someone else */
bcc7f5b4bee8e3 fs/block_dev.c NeilBrown       2016-12-12  549  	else if (wh=
ole =3D=3D bdev)
1a3cbbc5a5e8a6 fs/block_dev.c Tejun Heo       2010-04-07  550  		return tru=
e;  	 /* is a whole device which isn't held */
^1da177e4c3f41 fs/block_dev.c Linus Torvalds  2005-04-16  551  =

e525fd89d380c4 fs/block_dev.c Tejun Heo       2010-11-13  552  	else if (wh=
ole->bd_holder =3D=3D bd_may_claim)
1a3cbbc5a5e8a6 fs/block_dev.c Tejun Heo       2010-04-07  553  		return tru=
e; 	 /* is a partition of a device that is being partitioned */
1a3cbbc5a5e8a6 fs/block_dev.c Tejun Heo       2010-04-07  554  	else if (wh=
ole->bd_holder !=3D NULL)
1a3cbbc5a5e8a6 fs/block_dev.c Tejun Heo       2010-04-07  555  		return fal=
se;	 /* is a partition of a held device */
^1da177e4c3f41 fs/block_dev.c Linus Torvalds  2005-04-16  556  	else
1a3cbbc5a5e8a6 fs/block_dev.c Tejun Heo       2010-04-07  557  		return tru=
e;	 /* is a partition of an un-held device */
1a3cbbc5a5e8a6 fs/block_dev.c Tejun Heo       2010-04-07  558  }
1a3cbbc5a5e8a6 fs/block_dev.c Tejun Heo       2010-04-07  559  =


:::::: The code at line 543 was first introduced by commit
:::::: 1a3cbbc5a5e8a66934aa0947896a4aca6fd77298 block: factor out bd_may_cl=
aim()

:::::: TO: Tejun Heo <tj@kernel.org>
:::::: CC: Jens Axboe <jens.axboe@oracle.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4213333072133571112==--

