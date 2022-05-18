Content-Type: multipart/mixed; boundary="===============2825685216059490522=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [RFC ONLY 4/8] btrfs: add boilerplate code to insert raid extent
Date: Wed, 18 May 2022 08:54:08 +0800
Message-ID: <202205180858.FMv6zofy-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2825685216059490522==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <35ea1d22a55d8dd30bc9f9dfcd4a48890bf7feaf.1652711187.git.johan=
nes.thumshirn@wdc.com>
References: <35ea1d22a55d8dd30bc9f9dfcd4a48890bf7feaf.1652711187.git.johann=
es.thumshirn@wdc.com>
TO: Johannes Thumshirn <johannes.thumshirn@wdc.com>

Hi Johannes,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on kdave/for-next]
[also build test WARNING on v5.18-rc7 next-20220517]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Johannes-Thumshirn/b=
trfs-introduce-raid-stripe-tree/20220516-223524
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux.git for=
-next
:::::: branch date: 34 hours ago
:::::: commit date: 34 hours ago
config: i386-randconfig-c001-20220516 (https://download.01.org/0day-ci/arch=
ive/20220518/202205180858.FMv6zofy-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-20) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> fs/btrfs/volumes.c:6675:5-24: atomic_dec_and_test variation before objec=
t free at line 6697.

vim +6675 fs/btrfs/volumes.c

8408c716d7a4ddd Miao Xie           2014-06-19  6634  =

4246a0b63bd8f56 Christoph Hellwig  2015-07-20  6635  static void btrfs_end_=
bio(struct bio *bio)
8790d502e4401a4 Chris Mason        2008-04-03  6636  {
4c6646117912397 Qu Wenruo          2021-09-15  6637  	struct btrfs_io_conte=
xt *bioc =3D bio->bi_private;
7d2b4daa6737996 Chris Mason        2008-08-05  6638  	int is_orig_bio =3D 0;
8790d502e4401a4 Chris Mason        2008-04-03  6639  =

4e4cbee93d56137 Christoph Hellwig  2017-06-03  6640  	if (bio->bi_status) {
4c6646117912397 Qu Wenruo          2021-09-15  6641  		atomic_inc(&bioc->er=
ror);
4e4cbee93d56137 Christoph Hellwig  2017-06-03  6642  		if (bio->bi_status =
=3D=3D BLK_STS_IOERR ||
4e4cbee93d56137 Christoph Hellwig  2017-06-03  6643  		    bio->bi_status =
=3D=3D BLK_STS_TARGET) {
c3a3b19baceee1c Qu Wenruo          2021-09-15  6644  			struct btrfs_device=
 *dev =3D btrfs_bio(bio)->device;
442a4f6308e694e Stefan Behrens     2012-05-25  6645  =

3eee86c8fd9a9cd Nikolay Borisov    2020-07-02  6646  			ASSERT(dev->bdev);
cfe94440d174044 Naohiro Aota       2021-02-04  6647  			if (btrfs_op(bio) =
=3D=3D BTRFS_MAP_WRITE)
1cb34c8ecd46239 Anand Jain         2017-10-21  6648  				btrfs_dev_stat_inc=
_and_print(dev,
442a4f6308e694e Stefan Behrens     2012-05-25  6649  						BTRFS_DEV_STAT_W=
RITE_ERRS);
0cc068e6ee59c1f David Sterba       2019-03-07  6650  			else if (!(bio->bi_=
opf & REQ_RAHEAD))
1cb34c8ecd46239 Anand Jain         2017-10-21  6651  				btrfs_dev_stat_inc=
_and_print(dev,
442a4f6308e694e Stefan Behrens     2012-05-25  6652  						BTRFS_DEV_STAT_R=
EAD_ERRS);
70fd76140a6cb63 Christoph Hellwig  2016-11-01  6653  			if (bio->bi_opf & R=
EQ_PREFLUSH)
1cb34c8ecd46239 Anand Jain         2017-10-21  6654  				btrfs_dev_stat_inc=
_and_print(dev,
442a4f6308e694e Stefan Behrens     2012-05-25  6655  						BTRFS_DEV_STAT_F=
LUSH_ERRS);
442a4f6308e694e Stefan Behrens     2012-05-25  6656  		}
442a4f6308e694e Stefan Behrens     2012-05-25  6657  	}
8790d502e4401a4 Chris Mason        2008-04-03  6658  =

9f3dc6ab67cbdb8 Johannes Thumshirn 2022-05-16  6659  	if (bio_op(bio) =3D=
=3D REQ_OP_ZONE_APPEND) {
9f3dc6ab67cbdb8 Johannes Thumshirn 2022-05-16  6660  		int i;
9f3dc6ab67cbdb8 Johannes Thumshirn 2022-05-16  6661  =

9f3dc6ab67cbdb8 Johannes Thumshirn 2022-05-16  6662  		for (i =3D 0; i < bi=
oc->num_stripes; i++) {
9f3dc6ab67cbdb8 Johannes Thumshirn 2022-05-16  6663  			if (bioc->stripes[i=
].dev->bdev !=3D bio->bi_bdev)
9f3dc6ab67cbdb8 Johannes Thumshirn 2022-05-16  6664  				continue;
9f3dc6ab67cbdb8 Johannes Thumshirn 2022-05-16  6665  			bioc->stripes[i].ph=
ysical =3D bio->bi_iter.bi_sector << SECTOR_SHIFT;
9f3dc6ab67cbdb8 Johannes Thumshirn 2022-05-16  6666  		}
9f3dc6ab67cbdb8 Johannes Thumshirn 2022-05-16  6667  	}
9f3dc6ab67cbdb8 Johannes Thumshirn 2022-05-16  6668  =

9f3dc6ab67cbdb8 Johannes Thumshirn 2022-05-16  6669  =

4c6646117912397 Qu Wenruo          2021-09-15  6670  	if (bio =3D=3D bioc->=
orig_bio)
7d2b4daa6737996 Chris Mason        2008-08-05  6671  		is_orig_bio =3D 1;
7d2b4daa6737996 Chris Mason        2008-08-05  6672  =

4c6646117912397 Qu Wenruo          2021-09-15  6673  	btrfs_bio_counter_dec=
(bioc->fs_info);
c404e0dc2c843b1 Miao Xie           2014-01-30  6674  =

4c6646117912397 Qu Wenruo          2021-09-15 @6675  	if (atomic_dec_and_te=
st(&bioc->stripes_pending)) {
7d2b4daa6737996 Chris Mason        2008-08-05  6676  		if (!is_orig_bio) {
7d2b4daa6737996 Chris Mason        2008-08-05  6677  			bio_put(bio);
4c6646117912397 Qu Wenruo          2021-09-15  6678  			bio =3D bioc->orig_=
bio;
7d2b4daa6737996 Chris Mason        2008-08-05  6679  		}
c7b22bb19a24fef Muthu Kumar        2014-01-08  6680  =

c3a3b19baceee1c Qu Wenruo          2021-09-15  6681  		btrfs_bio(bio)->mirr=
or_num =3D bioc->mirror_num;
a236aed14ccb066 Chris Mason        2008-04-29  6682  		/* only send an erro=
r to the higher layers if it is
53b381b3abeb86f David Woodhouse    2013-01-29  6683  		 * beyond the tolera=
nce of the btrfs bio
a236aed14ccb066 Chris Mason        2008-04-29  6684  		 */
4c6646117912397 Qu Wenruo          2021-09-15  6685  		if (atomic_read(&bio=
c->error) > bioc->max_errors) {
4e4cbee93d56137 Christoph Hellwig  2017-06-03  6686  			bio->bi_status =3D =
BLK_STS_IOERR;
5dbc8fca8ef5d71 Chris Mason        2011-12-09  6687  		} else {
1259ab75c62462b Chris Mason        2008-05-12  6688  			/*
1259ab75c62462b Chris Mason        2008-05-12  6689  			 * this bio is actu=
ally up to date, we didn't
1259ab75c62462b Chris Mason        2008-05-12  6690  			 * go over the max =
number of errors
1259ab75c62462b Chris Mason        2008-05-12  6691  			 */
2dbe0c77186c691 Anand Jain         2017-10-14  6692  			bio->bi_status =3D =
BLK_STS_OK;
9f3dc6ab67cbdb8 Johannes Thumshirn 2022-05-16  6693  =

9f3dc6ab67cbdb8 Johannes Thumshirn 2022-05-16  6694  			if (btrfs_op(bio) =
=3D=3D BTRFS_MAP_WRITE &&
9f3dc6ab67cbdb8 Johannes Thumshirn 2022-05-16  6695  			    btrfs_need_stri=
pe_tree_update(bioc)) {
9f3dc6ab67cbdb8 Johannes Thumshirn 2022-05-16  6696  				btrfs_get_bioc(bio=
c);
9f3dc6ab67cbdb8 Johannes Thumshirn 2022-05-16 @6697  				schedule_work(&bio=
c->stripe_update_work);
9f3dc6ab67cbdb8 Johannes Thumshirn 2022-05-16  6698  			}
1259ab75c62462b Chris Mason        2008-05-12  6699  		}
c55f13964008bfe Miao Xie           2014-06-19  6700  =

4c6646117912397 Qu Wenruo          2021-09-15  6701  		btrfs_end_bioc(bioc,=
 bio);
7d2b4daa6737996 Chris Mason        2008-08-05  6702  	} else if (!is_orig_b=
io) {
8790d502e4401a4 Chris Mason        2008-04-03  6703  		bio_put(bio);
8790d502e4401a4 Chris Mason        2008-04-03  6704  	}
8790d502e4401a4 Chris Mason        2008-04-03  6705  }
8790d502e4401a4 Chris Mason        2008-04-03  6706  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2825685216059490522==--

