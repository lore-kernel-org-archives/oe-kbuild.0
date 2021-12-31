Content-Type: multipart/mixed; boundary="===============6943840763507917950=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 8/9] scsi_debug: change store from vmalloc to sgl
Date: Sat, 01 Jan 2022 06:43:41 +0800
Message-ID: <202201010609.ZMDBG5yX-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6943840763507917950==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20211231020829.29147-9-dgilbert@interlog.com>
References: <20211231020829.29147-9-dgilbert@interlog.com>
TO: Douglas Gilbert <dgilbert@interlog.com>

Hi Douglas,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on jejb-scsi/for-next]
[also build test WARNING on mkp-scsi/for-next v5.16-rc7 next-20211224]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Douglas-Gilbert/scsi_debug=
-collection-of-additions/20211231-101808
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi.git for-n=
ext
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
config: x86_64-randconfig-m001-20211230 (https://download.01.org/0day-ci/ar=
chive/20220101/202201010609.ZMDBG5yX-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/scsi/scsi_debug.c:3352 prot_verify_read() warn: returning -1 instea=
d of -ENOMEM is sloppy

vim +3352 drivers/scsi/scsi_debug.c

bb8c063c6afcd9 Akinobu Mita       2013-09-18  3335  =

87c715dcde633f Douglas Gilbert    2020-04-21  3336  static int prot_verify_=
read(struct scsi_cmnd *scp, sector_t start_sec,
bb8c063c6afcd9 Akinobu Mita       2013-09-18  3337  			    unsigned int sec=
tors, u32 ei_lba)
bb8c063c6afcd9 Akinobu Mita       2013-09-18  3338  {
f7be677227a537 Martin K. Petersen 2021-06-08  3339  	int ret =3D 0;
bb8c063c6afcd9 Akinobu Mita       2013-09-18  3340  	unsigned int i;
49adea5162df30 Douglas Gilbert    2021-12-30  3341  	const u32 lb_size =3D =
sdebug_sector_size;
bb8c063c6afcd9 Akinobu Mita       2013-09-18  3342  	sector_t sector;
49adea5162df30 Douglas Gilbert    2021-12-30  3343  	u64 lba, lba_start, bl=
ock, rem, sgl_i;
87c715dcde633f Douglas Gilbert    2020-04-21  3344  	struct sdeb_store_info=
 *sip =3D devip2sip((struct sdebug_dev_info *)
b6ff8ca733500a Douglas Gilbert    2020-05-12  3345  						scp->device->host=
data, true);
87c715dcde633f Douglas Gilbert    2020-04-21  3346  	struct t10_pi_tuple *s=
dt;
49adea5162df30 Douglas Gilbert    2021-12-30  3347  	struct scatterlist *st=
ore_sgl;
49adea5162df30 Douglas Gilbert    2021-12-30  3348  	u8 *arr;
49adea5162df30 Douglas Gilbert    2021-12-30  3349  =

49adea5162df30 Douglas Gilbert    2021-12-30  3350  	arr =3D kzalloc(lb_siz=
e, GFP_ATOMIC);
49adea5162df30 Douglas Gilbert    2021-12-30  3351  	if (!arr)
49adea5162df30 Douglas Gilbert    2021-12-30 @3352  		return -1;	/* mkp, is=
 this correct? */
bb8c063c6afcd9 Akinobu Mita       2013-09-18  3353  =

c45eabec08776d Akinobu Mita       2014-02-26  3354  	for (i =3D 0; i < sect=
ors; i++, ei_lba++) {
bb8c063c6afcd9 Akinobu Mita       2013-09-18  3355  		sector =3D start_sec =
+ i;
49adea5162df30 Douglas Gilbert    2021-12-30  3356  		lba =3D sector;
87c715dcde633f Douglas Gilbert    2020-04-21  3357  		sdt =3D dif_store(sip=
, sector);
bb8c063c6afcd9 Akinobu Mita       2013-09-18  3358  =

51d648af589221 Akinobu Mita       2013-09-18  3359  		if (sdt->app_tag =3D=
=3D cpu_to_be16(0xffff))
bb8c063c6afcd9 Akinobu Mita       2013-09-18  3360  			continue;
bb8c063c6afcd9 Akinobu Mita       2013-09-18  3361  =

f7be677227a537 Martin K. Petersen 2021-06-08  3362  		/*
f7be677227a537 Martin K. Petersen 2021-06-08  3363  		 * Because scsi_debug=
 acts as both initiator and
f7be677227a537 Martin K. Petersen 2021-06-08  3364  		 * target we proceed =
to verify the PI even if
f7be677227a537 Martin K. Petersen 2021-06-08  3365  		 * RDPROTECT=3D3. Thi=
s is done so the "initiator" knows
f7be677227a537 Martin K. Petersen 2021-06-08  3366  		 * which type of erro=
r to return. Otherwise we would
f7be677227a537 Martin K. Petersen 2021-06-08  3367  		 * have to iterate ov=
er the PI twice.
f7be677227a537 Martin K. Petersen 2021-06-08  3368  		 */
f7be677227a537 Martin K. Petersen 2021-06-08  3369  		if (scp->cmnd[1] >> 5=
) { /* RDPROTECT */
49adea5162df30 Douglas Gilbert    2021-12-30  3370  			block =3D do_div(lba=
, sdebug_store_sectors);
49adea5162df30 Douglas Gilbert    2021-12-30  3371  			lba_start =3D block =
* lb_size;
49adea5162df30 Douglas Gilbert    2021-12-30  3372  			sgl_i =3D lba_start =
>> sip->elem_pow2;
49adea5162df30 Douglas Gilbert    2021-12-30  3373  			rem =3D lba_start - =
(sgl_i ? (sgl_i << sip->elem_pow2) : 0);
49adea5162df30 Douglas Gilbert    2021-12-30  3374  			store_sgl =3D sip->s=
gl + sgl_i;
49adea5162df30 Douglas Gilbert    2021-12-30  3375  =

49adea5162df30 Douglas Gilbert    2021-12-30  3376  			ret =3D sg_copy_buff=
er(store_sgl, sip->n_elem - sgl_i, arr, lb_size, rem, true);
49adea5162df30 Douglas Gilbert    2021-12-30  3377  =

49adea5162df30 Douglas Gilbert    2021-12-30  3378  			ret =3D dif_verify(s=
dt, arr, sector, ei_lba);
49adea5162df30 Douglas Gilbert    2021-12-30  3379  =

bb8c063c6afcd9 Akinobu Mita       2013-09-18  3380  			if (ret) {
bb8c063c6afcd9 Akinobu Mita       2013-09-18  3381  				dif_errors++;
49adea5162df30 Douglas Gilbert    2021-12-30  3382  				goto fini;
f7be677227a537 Martin K. Petersen 2021-06-08  3383  			}
bb8c063c6afcd9 Akinobu Mita       2013-09-18  3384  		}
bb8c063c6afcd9 Akinobu Mita       2013-09-18  3385  	}
c6a44287417de1 Martin K. Petersen 2009-01-04  3386  =

87c715dcde633f Douglas Gilbert    2020-04-21  3387  	dif_copy_prot(scp, sta=
rt_sec, sectors, true);
c6a44287417de1 Martin K. Petersen 2009-01-04  3388  	dix_reads++;
c6a44287417de1 Martin K. Petersen 2009-01-04  3389  =

49adea5162df30 Douglas Gilbert    2021-12-30  3390  fini:
49adea5162df30 Douglas Gilbert    2021-12-30  3391  	kfree(arr);
f7be677227a537 Martin K. Petersen 2021-06-08  3392  	return ret;
c6a44287417de1 Martin K. Petersen 2009-01-04  3393  }
c6a44287417de1 Martin K. Petersen 2009-01-04  3394  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6943840763507917950==--

