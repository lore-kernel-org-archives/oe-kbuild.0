Content-Type: multipart/mixed; boundary="===============3312150655947595146=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [RFC PATCH V3 2/2] scsi: core: don't limit per-LUN queue depth for SSD
Date: Wed, 09 Oct 2019 11:29:06 +0300
Message-ID: <20191009082321.GA13048@kadam>
In-Reply-To: <20191008100945.24951-3-ming.lei@redhat.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3312150655947595146==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Ming,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on scsi/for-next]
[cannot apply to v5.4-rc2 next-20191009]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Ming-Lei/scsi-core-avoid-h=
ost-wide-host_busy-counter-for-scsi_mq/20191009-015827
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi.git for-n=
ext

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/scsi/scsi_lib.c:1293 scsi_dev_queue_ready() error: uninitialized sy=
mbol 'busy'.

# https://github.com/0day-ci/linux/commit/74eb6c22dc70e395b333c9ca579855cd8=
8db8845
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout 74eb6c22dc70e395b333c9ca579855cd88db8845
vim +/busy +1293 drivers/scsi/scsi_lib.c

^1da177e4c3f41 Linus Torvalds    2005-04-16  1284  static inline int scsi_d=
ev_queue_ready(struct request_queue *q,
^1da177e4c3f41 Linus Torvalds    2005-04-16  1285  				  struct scsi_device=
 *sdev)
^1da177e4c3f41 Linus Torvalds    2005-04-16  1286  {
71e75c97f97a96 Christoph Hellwig 2014-04-11  1287  	unsigned int busy;

Needs to be busy =3D 0;

74eb6c22dc70e3 Ming Lei          2019-10-08  1288  	bool bypass =3D blk_que=
ue_nonrot(sdev->request_queue);
71e75c97f97a96 Christoph Hellwig 2014-04-11  1289  =

74eb6c22dc70e3 Ming Lei          2019-10-08  1290  	if (!bypass)
71e75c97f97a96 Christoph Hellwig 2014-04-11  1291  		busy =3D atomic_inc_re=
turn(&sdev->device_busy) - 1;
                                                                ^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
cd9070c9c512ff Christoph Hellwig 2014-01-23  1292  	if (atomic_read(&sdev->=
device_blocked)) {
71e75c97f97a96 Christoph Hellwig 2014-04-11 @1293  		if (busy)
                                                                    ^^^^
71e75c97f97a96 Christoph Hellwig 2014-04-11  1294  			goto out_dec;
71e75c97f97a96 Christoph Hellwig 2014-04-11  1295  =

^1da177e4c3f41 Linus Torvalds    2005-04-16  1296  		/*
^1da177e4c3f41 Linus Torvalds    2005-04-16  1297  		 * unblock after devic=
e_blocked iterates to zero
^1da177e4c3f41 Linus Torvalds    2005-04-16  1298  		 */
f664a3cc17b7d0 Jens Axboe        2018-11-01  1299  		if (atomic_dec_return(=
&sdev->device_blocked) > 0)
71e75c97f97a96 Christoph Hellwig 2014-04-11  1300  			goto out_dec;
71e75c97f97a96 Christoph Hellwig 2014-04-11  1301  		SCSI_LOG_MLQUEUE(3, sd=
ev_printk(KERN_INFO, sdev,
71e75c97f97a96 Christoph Hellwig 2014-04-11  1302  				   "unblocking devic=
e at zero depth\n"));
^1da177e4c3f41 Linus Torvalds    2005-04-16  1303  	}
71e75c97f97a96 Christoph Hellwig 2014-04-11  1304  =

74eb6c22dc70e3 Ming Lei          2019-10-08  1305  	if (bypass)
74eb6c22dc70e3 Ming Lei          2019-10-08  1306  		return 1;
74eb6c22dc70e3 Ming Lei          2019-10-08  1307  =

71e75c97f97a96 Christoph Hellwig 2014-04-11  1308  	if (busy >=3D sdev->que=
ue_depth)
71e75c97f97a96 Christoph Hellwig 2014-04-11  1309  		goto out_dec;

---
0-DAY kernel test infrastructure                Open Source Technology Cent=
er
https://lists.01.org/pipermail/kbuild-all                   Intel Corporati=
on
--===============3312150655947595146==--

