Content-Type: multipart/mixed; boundary="===============4216608528839739248=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] fs: Fix page cache inconsistency when mixing buffered and AIO DIO for bdev
Date: Sat, 07 May 2022 03:56:50 +0800
Message-ID: <202205070314.rXjpPg15-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4216608528839739248==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220506135709.46872-1-lchen@localhost.localdomain>
References: <20220506135709.46872-1-lchen@localhost.localdomain>
TO: Liang Chen <liangchen.linux@gmail.com>
TO: linux-fsdevel(a)vger.kernel.org
CC: hch(a)infradead.org
CC: jmoyer(a)redhat.com
CC: jack(a)suse.cz
CC: lczerner(a)redhat.com
CC: Liang Chen <liangchen.linux@gmail.com>

Hi Liang,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on axboe-block/for-next]
[also build test WARNING on v5.18-rc5 next-20220506]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Liang-Chen/fs-Fix-pa=
ge-cache-inconsistency-when-mixing-buffered-and-AIO-DIO-for-bdev/20220506-2=
15958
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.g=
it for-next
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago
config: i386-randconfig-c001 (https://download.01.org/0day-ci/archive/20220=
507/202205070314.rXjpPg15-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-20) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> block/fops.c:177:5-24: atomic_dec_and_test variation before object free =
at line 185.

vim +177 block/fops.c

2b2bda510e6c93 Liang Chen        2022-05-06  168  =

cd82cca7ebfe9c Christoph Hellwig 2021-09-07  169  static void blkdev_bio_en=
d_io(struct bio *bio)
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  170  {
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  171  	struct blkdev_dio *dio =
=3D bio->bi_private;
09ce8744253a03 Jens Axboe        2021-10-14  172  	bool should_dirty =3D di=
o->flags & DIO_SHOULD_DIRTY;
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  173  =

cd82cca7ebfe9c Christoph Hellwig 2021-09-07  174  	if (bio->bi_status && !d=
io->bio.bi_status)
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  175  		dio->bio.bi_status =3D =
bio->bi_status;
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  176  =

e71aa913e26543 Pavel Begunkov    2021-10-27 @177  	if (atomic_dec_and_test(=
&dio->ref)) {
09ce8744253a03 Jens Axboe        2021-10-14  178  		if (!(dio->flags & DIO_=
IS_SYNC)) {
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  179  			struct kiocb *iocb =3D=
 dio->iocb;
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  180  			ssize_t ret;
2b2bda510e6c93 Liang Chen        2022-05-06  181  			struct inode *inode =
=3D bdev_file_inode(iocb->ki_filp);
2b2bda510e6c93 Liang Chen        2022-05-06  182  =

2b2bda510e6c93 Liang Chen        2022-05-06  183  			if (iocb->ki_flags & I=
OCB_WRITE){
2b2bda510e6c93 Liang Chen        2022-05-06  184  				INIT_WORK(&dio->compl=
ete_work, blkdev_aio_complete_work);
2b2bda510e6c93 Liang Chen        2022-05-06 @185  				queue_work(inode->i_s=
b->s_dio_done_wq,
2b2bda510e6c93 Liang Chen        2022-05-06  186  						&dio->complete_work=
);
2b2bda510e6c93 Liang Chen        2022-05-06  187  				goto out;
2b2bda510e6c93 Liang Chen        2022-05-06  188  			}
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  189  =

3e08773c3841e9 Christoph Hellwig 2021-10-12  190  			WRITE_ONCE(iocb->priva=
te, NULL);
3e08773c3841e9 Christoph Hellwig 2021-10-12  191  =

cd82cca7ebfe9c Christoph Hellwig 2021-09-07  192  			if (likely(!dio->bio.b=
i_status)) {
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  193  				ret =3D dio->size;
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  194  				iocb->ki_pos +=3D ret;
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  195  			} else {
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  196  				ret =3D blk_status_to=
_errno(dio->bio.bi_status);
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  197  			}
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  198  =

6b19b766e8f077 Jens Axboe        2021-10-21  199  			dio->iocb->ki_complete=
(iocb, ret);
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  200  			bio_put(&dio->bio);
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  201  		} else {
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  202  			struct task_struct *wa=
iter =3D dio->waiter;
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  203  =

cd82cca7ebfe9c Christoph Hellwig 2021-09-07  204  			WRITE_ONCE(dio->waiter=
, NULL);
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  205  			blk_wake_io_task(waite=
r);
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  206  		}
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  207  	}
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  208  =

2b2bda510e6c93 Liang Chen        2022-05-06  209  out:
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  210  	if (should_dirty) {
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  211  		bio_check_pages_dirty(b=
io);
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  212  	} else {
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  213  		bio_release_pages(bio, =
false);
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  214  		bio_put(bio);
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  215  	}
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  216  }
cd82cca7ebfe9c Christoph Hellwig 2021-09-07  217  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4216608528839739248==--

