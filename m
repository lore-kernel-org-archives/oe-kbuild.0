Content-Type: multipart/mixed; boundary="===============3172262201878684786=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH alternative 2] block: fix the REQ_OP_SECURE_ERASE handling to not leak erased data
Date: Sat, 19 Mar 2022 06:31:44 +0800
Message-ID: <202203190620.wyBlW8VG-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3172262201878684786==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220316093855.GC7714@lst.de>
References: <20220316093855.GC7714@lst.de>
TO: Christoph Hellwig <hch@lst.de>
TO: axboe(a)kernel.dk
CC: jaegeuk(a)kernel.org
CC: chao(a)kernel.org
CC: ulf.hansson(a)linaro.org
CC: Adrian Hunter <adrian.hunter@intel.com>
CC: Daeho Jeong <daehojeong@google.com>
CC: Eric Biggers <ebiggers@google.com>
CC: linux-block(a)vger.kernel.org
CC: linux-kernel(a)vger.kernel.org
CC: linux-mmc(a)vger.kernel.org

Hi Christoph,

I love your patch! Perhaps something to improve:

[auto build test WARNING on jaegeuk-f2fs/dev-test]
[also build test WARNING on linux/master linus/master v5.17-rc8]
[cannot apply to axboe-block/for-next next-20220318]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Christoph-Hellwig/block-fi=
x-the-REQ_OP_SECURE_ERASE-handling-to-not-leak-erased-data/20220316-174028
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git de=
v-test
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-m001-20220314 (https://download.01.org/0day-ci/ar=
chive/20220319/202203190620.wyBlW8VG-lkp(a)intel.com/config)
compiler: gcc-9 (Ubuntu 9.4.0-1ubuntu1~20.04) 9.4.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
block/blk-lib.c:464 blkdev_issue_secure_erase() warn: should 'len << 9' be =
a 64 bit type?

Old smatch warnings:
block/blk-lib.c:465 blkdev_issue_secure_erase() warn: should 'len << 9' be =
a 64 bit type?

vim +464 block/blk-lib.c

04d790607abc51e Christoph Hellwig 2022-03-16  436  =

04d790607abc51e Christoph Hellwig 2022-03-16  437  int blkdev_issue_secure_=
erase(struct block_device *bdev, sector_t sector,
04d790607abc51e Christoph Hellwig 2022-03-16  438  		sector_t nr_sects, gfp=
_t gfp)
04d790607abc51e Christoph Hellwig 2022-03-16  439  {
04d790607abc51e Christoph Hellwig 2022-03-16  440  	sector_t bs_mask =3D (b=
dev_logical_block_size(bdev) >> 9) - 1;
04d790607abc51e Christoph Hellwig 2022-03-16  441  	unsigned int max_sector=
s =3D
04d790607abc51e Christoph Hellwig 2022-03-16  442  		bdev_get_queue(bdev)->=
limits.max_discard_sectors;
04d790607abc51e Christoph Hellwig 2022-03-16  443  	struct bio *bio =3D NUL=
L;
04d790607abc51e Christoph Hellwig 2022-03-16  444  	struct blk_plug plug;
04d790607abc51e Christoph Hellwig 2022-03-16  445  	int ret =3D 0;
04d790607abc51e Christoph Hellwig 2022-03-16  446  =

04d790607abc51e Christoph Hellwig 2022-03-16  447  	if (max_sectors =3D=3D =
0)
04d790607abc51e Christoph Hellwig 2022-03-16  448  		return -EOPNOTSUPP;
04d790607abc51e Christoph Hellwig 2022-03-16  449  	if ((sector | nr_sects)=
 & bs_mask)
04d790607abc51e Christoph Hellwig 2022-03-16  450  		return -EINVAL;
04d790607abc51e Christoph Hellwig 2022-03-16  451  	if (bdev_read_only(bdev=
))
04d790607abc51e Christoph Hellwig 2022-03-16  452  		return -EPERM;
04d790607abc51e Christoph Hellwig 2022-03-16  453  =

04d790607abc51e Christoph Hellwig 2022-03-16  454  	blk_start_plug(&plug);
04d790607abc51e Christoph Hellwig 2022-03-16  455  	for (;;) {
04d790607abc51e Christoph Hellwig 2022-03-16  456  		unsigned int len =3D m=
in_t(sector_t, nr_sects, max_sectors);
04d790607abc51e Christoph Hellwig 2022-03-16  457  =

04d790607abc51e Christoph Hellwig 2022-03-16  458  		bio =3D blk_next_bio(b=
io, 0, gfp);
04d790607abc51e Christoph Hellwig 2022-03-16  459  		bio_set_dev(bio, bdev);
04d790607abc51e Christoph Hellwig 2022-03-16  460  		bio->bi_opf =3D REQ_OP=
_SECURE_ERASE;
04d790607abc51e Christoph Hellwig 2022-03-16  461  		bio->bi_iter.bi_sector=
 =3D sector;
04d790607abc51e Christoph Hellwig 2022-03-16  462  		bio->bi_iter.bi_size =
=3D len;
04d790607abc51e Christoph Hellwig 2022-03-16  463  =

04d790607abc51e Christoph Hellwig 2022-03-16 @464  		sector +=3D len << SEC=
TOR_SHIFT;

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============3172262201878684786==--

