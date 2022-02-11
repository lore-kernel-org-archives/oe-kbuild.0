Content-Type: multipart/mixed; boundary="===============5171348946297626879=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [xilinx-xlnx:xlnx_rebase_v5.15 840/923] drivers/mtd/spi-nor/core.c:3317:22: warning: Unused variable: np_spi [unusedVariable]
Date: Fri, 11 Feb 2022 14:02:23 +0800
Message-ID: <202202110913.nziwcJSL-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5171348946297626879==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-arm-kernel(a)lists.infradead.org
TO: Amit Kumar Mahapatra <amit.kumar-mahapatra@xilinx.com>
CC: Michal Simek <monstr@monstr.eu>

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.15
head:   966124532656bc95d781abf57531e4cd4f962237
commit: 2747bc2106aa429773d9a932c799aa6229595148 [840/923] mtd: spi-nor: Ad=
d dual parallel and stacked mode support
:::::: branch date: 18 hours ago
:::::: commit date: 10 days ago
compiler: ia64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/mtd/spi-nor/sfdp.c:727:24: warning: Boolean result is used in bi=
twise operation. Clarify expression with parentheses. [clarifyCondition]
     map_id =3D map_id << 1 | !!(*buf & read_data_mask);
                          ^
>> drivers/mtd/spi-nor/core.c:3317:22: warning: Unused variable: np_spi [un=
usedVariable]
    struct device_node *np_spi;
                        ^
>> drivers/mtd/spi-nor/core.c:3318:6: warning: Unused variable: is_dual [un=
usedVariable]
    u32 is_dual;
        ^

vim +3317 drivers/mtd/spi-nor/core.c

620df2497415a9 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus        2019-08-2=
4  3307  =

cfc5604c488ccd drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen      2017-04-2=
5  3308  int spi_nor_scan(struct spi_nor *nor, const char *name,
cfc5604c488ccd drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen      2017-04-2=
5  3309  		 const struct spi_nor_hwcaps *hwcaps)
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-2=
4  3310  {
2747bc2106aa42 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2022-01-2=
5  3311  	struct flash_info *info =3D NULL;
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-2=
4  3312  	struct device *dev =3D nor->dev;
1976367173a47f drivers/mtd/spi-nor/spi-nor.c Brian Norris         2015-08-1=
3  3313  	struct mtd_info *mtd =3D &nor->mtd;
9c7d787508be6d drivers/mtd/spi-nor/spi-nor.c Brian Norris         2015-10-3=
0  3314  	struct device_node *np =3D spi_nor_get_flash_node(nor);
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-2=
4  3315  	int ret;
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-2=
4  3316  	int i;
2747bc2106aa42 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2022-01-2=
5 @3317  	struct device_node *np_spi;
2747bc2106aa42 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2022-01-2=
5 @3318  	u32 is_dual;
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-2=
4  3319  =

b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-2=
4  3320  	ret =3D spi_nor_check(nor);
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-2=
4  3321  	if (ret)
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-2=
4  3322  		return ret;
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-2=
4  3323  =

cfc5604c488ccd drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen      2017-04-2=
5  3324  	/* Reset SPI protocol for all commands. */
cfc5604c488ccd drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen      2017-04-2=
5  3325  	nor->reg_proto =3D SNOR_PROTO_1_1_1;
cfc5604c488ccd drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen      2017-04-2=
5  3326  	nor->read_proto =3D SNOR_PROTO_1_1_1;
cfc5604c488ccd drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen      2017-04-2=
5  3327  	nor->write_proto =3D SNOR_PROTO_1_1_1;
cfc5604c488ccd drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen      2017-04-2=
5  3328  =

f173f26a4d543f drivers/mtd/spi-nor/spi-nor.c Vignesh Raghavendra  2019-08-0=
6  3329  	/*
f173f26a4d543f drivers/mtd/spi-nor/spi-nor.c Vignesh Raghavendra  2019-08-0=
6  3330  	 * We need the bounce buffer early to read/write registers when g=
oing
f173f26a4d543f drivers/mtd/spi-nor/spi-nor.c Vignesh Raghavendra  2019-08-0=
6  3331  	 * through the spi-mem layer (buffers have to be DMA-able).
b35b9a10362d20 drivers/mtd/spi-nor/spi-nor.c Boris Brezillon      2019-08-0=
6  3332  	 * For spi-mem drivers, we'll reallocate a new buffer if
b35b9a10362d20 drivers/mtd/spi-nor/spi-nor.c Boris Brezillon      2019-08-0=
6  3333  	 * nor->page_size turns out to be greater than PAGE_SIZE (which
b35b9a10362d20 drivers/mtd/spi-nor/spi-nor.c Boris Brezillon      2019-08-0=
6  3334  	 * shouldn't happen before long since NOR pages are usually less
b35b9a10362d20 drivers/mtd/spi-nor/spi-nor.c Boris Brezillon      2019-08-0=
6  3335  	 * than 1KB) after spi_nor_scan() returns.
f173f26a4d543f drivers/mtd/spi-nor/spi-nor.c Vignesh Raghavendra  2019-08-0=
6  3336  	 */
f173f26a4d543f drivers/mtd/spi-nor/spi-nor.c Vignesh Raghavendra  2019-08-0=
6  3337  	nor->bouncebuf_size =3D PAGE_SIZE;
f173f26a4d543f drivers/mtd/spi-nor/spi-nor.c Vignesh Raghavendra  2019-08-0=
6  3338  	nor->bouncebuf =3D devm_kmalloc(dev, nor->bouncebuf_size,
f173f26a4d543f drivers/mtd/spi-nor/spi-nor.c Vignesh Raghavendra  2019-08-0=
6  3339  				      GFP_KERNEL);
f173f26a4d543f drivers/mtd/spi-nor/spi-nor.c Vignesh Raghavendra  2019-08-0=
6  3340  	if (!nor->bouncebuf)
f173f26a4d543f drivers/mtd/spi-nor/spi-nor.c Vignesh Raghavendra  2019-08-0=
6  3341  		return -ENOMEM;
f173f26a4d543f drivers/mtd/spi-nor/spi-nor.c Vignesh Raghavendra  2019-08-0=
6  3342  =

2747bc2106aa42 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2022-01-2=
5  3343  	info =3D (struct flash_info *)spi_nor_get_flash_info(nor, name);
620df2497415a9 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus        2019-08-2=
4  3344  	if (IS_ERR(info))
620df2497415a9 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus        2019-08-2=
4  3345  		return PTR_ERR(info);
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-2=
4  3346  =

b296379fef7ce9 drivers/mtd/spi-nor/spi-nor.c Boris Brezillon      2018-12-0=
6  3347  	nor->info =3D info;
b296379fef7ce9 drivers/mtd/spi-nor/spi-nor.c Boris Brezillon      2018-12-0=
6  3348  =

dcc935b06f1f29 drivers/mtd/spi-nor/spi-nor.c Zhuohao Lee          2019-08-2=
8  3349  	spi_nor_debugfs_init(nor, info);
dcc935b06f1f29 drivers/mtd/spi-nor/spi-nor.c Zhuohao Lee          2019-08-2=
8  3350  =

b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-2=
4  3351  	mutex_init(&nor->lock);
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-2=
4  3352  =

e99ca98f1d7190 drivers/mtd/spi-nor/spi-nor.c Ricardo Ribalda      2016-12-0=
2  3353  	/*
e99ca98f1d7190 drivers/mtd/spi-nor/spi-nor.c Ricardo Ribalda      2016-12-0=
2  3354  	 * Make sure the XSR_RDY flag is set before calling
e99ca98f1d7190 drivers/mtd/spi-nor/spi-nor.c Ricardo Ribalda      2016-12-0=
2  3355  	 * spi_nor_wait_till_ready(). Xilinx S3AN share MFR
1ac71ec0130cce drivers/mtd/spi-nor/core.c    Tudor Ambarus        2020-04-2=
8  3356  	 * with Atmel SPI NOR.
e99ca98f1d7190 drivers/mtd/spi-nor/spi-nor.c Ricardo Ribalda      2016-12-0=
2  3357  	 */
ad3bba06b63697 drivers/mtd/spi-nor/spi-nor.c Boris Brezillon      2019-07-3=
0  3358  	if (info->flags & SPI_NOR_XSR_RDY)
e99ca98f1d7190 drivers/mtd/spi-nor/spi-nor.c Ricardo Ribalda      2016-12-0=
2  3359  		nor->flags |=3D  SNOR_F_READY_XSR_RDY;
e99ca98f1d7190 drivers/mtd/spi-nor/spi-nor.c Ricardo Ribalda      2016-12-0=
2  3360  =

dff972458acb05 drivers/mtd/spi-nor/spi-nor.c Boris Brezillon      2019-08-2=
4  3361  	if (info->flags & SPI_NOR_HAS_LOCK)
dff972458acb05 drivers/mtd/spi-nor/spi-nor.c Boris Brezillon      2019-08-2=
4  3362  		nor->flags |=3D SNOR_F_HAS_LOCK;
dff972458acb05 drivers/mtd/spi-nor/spi-nor.c Boris Brezillon      2019-08-2=
4  3363  =

2747bc2106aa42 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2022-01-2=
5  3364  	/* sst nor chips use AAI word program */
2747bc2106aa42 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2022-01-2=
5  3365  	if (info->flags & SST_WRITE)
2747bc2106aa42 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2022-01-2=
5  3366  		mtd->_write =3D sst_write;
2747bc2106aa42 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2022-01-2=
5  3367  	else
c53b3f92b405d6 drivers/mtd/spi-nor/core.c    Boris Brezillon      2020-03-1=
3  3368  		mtd->_write =3D spi_nor_write;
c53b3f92b405d6 drivers/mtd/spi-nor/core.c    Boris Brezillon      2020-03-1=
3  3369  =

1c1d8d98e1c706 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus        2019-08-2=
4  3370  	/* Init flash parameters based on flash_info struct and SFDP */
829ec6408dc58d drivers/mtd/spi-nor/core.c    Tudor Ambarus        2020-03-1=
3  3371  	ret =3D spi_nor_init_params(nor);
829ec6408dc58d drivers/mtd/spi-nor/core.c    Tudor Ambarus        2020-03-1=
3  3372  	if (ret)
829ec6408dc58d drivers/mtd/spi-nor/core.c    Tudor Ambarus        2020-03-1=
3  3373  		return ret;
cfc5604c488ccd drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen      2017-04-2=
5  3374  =

32f1b7c8352fd3 drivers/mtd/spi-nor/spi-nor.c Rafa=C5=82 Mi=C5=82ecki       =
 2014-09-28  3375  	if (!mtd->name)
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-2=
4  3376  		mtd->name =3D dev_name(dev);
c9ec3900abf279 drivers/mtd/spi-nor/spi-nor.c Brian Norris         2015-08-1=
3  3377  	mtd->priv =3D nor;
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-2=
4  3378  	mtd->type =3D MTD_NORFLASH;
afd473e8582702 drivers/mtd/spi-nor/core.c    Pratyush Yadav       2020-12-0=
1  3379  	mtd->writesize =3D nor->params->writesize;
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-2=
4  3380  	mtd->flags =3D MTD_CAP_NORFLASH;
829ec6408dc58d drivers/mtd/spi-nor/core.c    Tudor Ambarus        2020-03-1=
3  3381  	mtd->size =3D nor->params->size;
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-2=
4  3382  	mtd->_erase =3D spi_nor_erase;
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-2=
4  3383  	mtd->_read =3D spi_nor_read;
2747bc2106aa42 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2022-01-2=
5  3384  	nor->page_size =3D nor->params->page_size;
2747bc2106aa42 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2022-01-2=
5  3385  #ifdef CONFIG_OF
2747bc2106aa42 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2022-01-2=
5  3386  	np_spi =3D of_get_next_parent(np);
2747bc2106aa42 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2022-01-2=
5  3387  	if (((of_property_match_string(np_spi, "compatible",
2747bc2106aa42 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2022-01-2=
5  3388  				       "xlnx,zynq-qspi-1.0") >=3D 0) ||
2747bc2106aa42 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2022-01-2=
5  3389  		(of_property_match_string(np_spi, "compatible",
2747bc2106aa42 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2022-01-2=
5  3390  				"xlnx,zynqmp-qspi-1.0") >=3D 0)) ||
2747bc2106aa42 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2022-01-2=
5  3391  		(of_property_match_string(np_spi, "compatible",
2747bc2106aa42 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2022-01-2=
5  3392  				"xlnx,versal-qspi-1.0") >=3D 0) ||
2747bc2106aa42 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2022-01-2=
5  3393  		(of_property_match_string(np_spi, "compatible",
2747bc2106aa42 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2022-01-2=
5  3394  				"xlnx,versal-ospi-1.0") >=3D 0)) {
2747bc2106aa42 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2022-01-2=
5  3395  		if (of_property_read_u32(np_spi, "is-dual",
2747bc2106aa42 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2022-01-2=
5  3396  					 &is_dual) < 0) {
2747bc2106aa42 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2022-01-2=
5  3397  			/* Default to single if prop not defined */
2747bc2106aa42 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2022-01-2=
5  3398  			nor->shift =3D 0;
2747bc2106aa42 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2022-01-2=
5  3399  			nor->isstacked =3D 0;
2747bc2106aa42 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2022-01-2=
5  3400  			nor->isparallel =3D 0;
2747bc2106aa42 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2022-01-2=
5  3401  		} else {
2747bc2106aa42 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2022-01-2=
5  3402  			if (is_dual =3D=3D 1) {
2747bc2106aa42 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2022-01-2=
5  3403  				/* dual parallel */
2747bc2106aa42 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2022-01-2=
5  3404  				nor->shift =3D 1;
2747bc2106aa42 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2022-01-2=
5  3405  				info->sector_size <<=3D nor->shift;
2747bc2106aa42 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2022-01-2=
5  3406  				info->page_size <<=3D nor->shift;
2747bc2106aa42 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2022-01-2=
5  3407  				nor->page_size =3D info->page_size;
2747bc2106aa42 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2022-01-2=
5  3408  				mtd->size <<=3D nor->shift;
2747bc2106aa42 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2022-01-2=
5  3409  				nor->isparallel =3D 1;
2747bc2106aa42 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2022-01-2=
5  3410  				nor->isstacked =3D 0;
2747bc2106aa42 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2022-01-2=
5  3411  				nor->spi->master->flags |=3D
2747bc2106aa42 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2022-01-2=
5  3412  						(SPI_MASTER_DATA_STRIPE
2747bc2106aa42 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2022-01-2=
5  3413  						| SPI_MASTER_BOTH_CS);
2747bc2106aa42 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2022-01-2=
5  3414  			} else {
2747bc2106aa42 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2022-01-2=
5  3415  #ifdef CONFIG_SPI_ZYNQ_QSPI_DUAL_STACKED
2747bc2106aa42 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2022-01-2=
5  3416  				/* dual stacked */
2747bc2106aa42 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2022-01-2=
5  3417  				nor->shift =3D 0;
2747bc2106aa42 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2022-01-2=
5  3418  				mtd->size <<=3D 1;
2747bc2106aa42 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2022-01-2=
5  3419  				info->n_sectors <<=3D 1;
2747bc2106aa42 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2022-01-2=
5  3420  				nor->isstacked =3D 1;
2747bc2106aa42 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2022-01-2=
5  3421  				nor->isparallel =3D 0;
2747bc2106aa42 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2022-01-2=
5  3422  #else
2747bc2106aa42 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2022-01-2=
5  3423  				u32 is_stacked;
2747bc2106aa42 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2022-01-2=
5  3424  =

2747bc2106aa42 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2022-01-2=
5  3425  				if (of_property_read_u32(np_spi,
2747bc2106aa42 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2022-01-2=
5  3426  							 "is-stacked",
2747bc2106aa42 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2022-01-2=
5  3427  							 &is_stacked) < 0) {
2747bc2106aa42 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2022-01-2=
5  3428  					is_stacked =3D 0;
2747bc2106aa42 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2022-01-2=
5  3429  				}
2747bc2106aa42 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2022-01-2=
5  3430  				if (is_stacked) {
2747bc2106aa42 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2022-01-2=
5  3431  					/* dual stacked */
2747bc2106aa42 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2022-01-2=
5  3432  					nor->shift =3D 0;
2747bc2106aa42 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2022-01-2=
5  3433  					mtd->size <<=3D 1;
2747bc2106aa42 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2022-01-2=
5  3434  					info->n_sectors <<=3D 1;
2747bc2106aa42 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2022-01-2=
5  3435  					nor->isstacked =3D 1;
2747bc2106aa42 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2022-01-2=
5  3436  					nor->isparallel =3D 0;
2747bc2106aa42 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2022-01-2=
5  3437  				} else {
2747bc2106aa42 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2022-01-2=
5  3438  					/* single */
2747bc2106aa42 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2022-01-2=
5  3439  					nor->shift =3D 0;
2747bc2106aa42 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2022-01-2=
5  3440  					nor->isstacked =3D 0;
2747bc2106aa42 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2022-01-2=
5  3441  					nor->isparallel =3D 0;
2747bc2106aa42 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2022-01-2=
5  3442  				}
2747bc2106aa42 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2022-01-2=
5  3443  #endif
2747bc2106aa42 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2022-01-2=
5  3444  			}
2747bc2106aa42 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2022-01-2=
5  3445  		}
2747bc2106aa42 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2022-01-2=
5  3446  	}
2747bc2106aa42 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2022-01-2=
5  3447  #else
2747bc2106aa42 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2022-01-2=
5  3448  	/* Default to single */
2747bc2106aa42 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2022-01-2=
5  3449  	nor->shift =3D 0;
2747bc2106aa42 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2022-01-2=
5  3450  	nor->isstacked =3D 0;
2747bc2106aa42 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2022-01-2=
5  3451  	nor->isparallel =3D 0;
2747bc2106aa42 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2022-01-2=
5  3452  #endif
2747bc2106aa42 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2022-01-2=
5  3453  =

1b65c43f7078eb drivers/mtd/spi-nor/core.c    Pratyush Yadav       2020-10-0=
5  3454  	mtd->_suspend =3D spi_nor_suspend;
d6084fc83c8249 drivers/mtd/spi-nor/spi-nor.c Kamal Dasu           2017-08-2=
2  3455  	mtd->_resume =3D spi_nor_resume;
be94215be1ab19 drivers/mtd/spi-nor/core.c    Xiang Chen           2021-04-0=
1  3456  	mtd->_get_device =3D spi_nor_get_device;
be94215be1ab19 drivers/mtd/spi-nor/core.c    Xiang Chen           2021-04-0=
1  3457  	mtd->_put_device =3D spi_nor_put_device;
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-2=
4  3458  =

51983b7dcf3a50 drivers/mtd/spi-nor/spi-nor.c Brian Norris         2014-09-1=
0  3459  	if (info->flags & USE_FSR)
51983b7dcf3a50 drivers/mtd/spi-nor/spi-nor.c Brian Norris         2014-09-1=
0  3460  		nor->flags |=3D SNOR_F_USE_FSR;
adf1092fa838e8 drivers/mtd/spi-nor/spi-nor.c Jungseung Lee        2019-12-0=
2  3461  	if (info->flags & SPI_NOR_HAS_TB) {
3dd8012a8eeb37 drivers/mtd/spi-nor/spi-nor.c Brian Norris         2016-01-2=
9  3462  		nor->flags |=3D SNOR_F_HAS_SR_TB;
adf1092fa838e8 drivers/mtd/spi-nor/spi-nor.c Jungseung Lee        2019-12-0=
2  3463  		if (info->flags & SPI_NOR_TB_SR_BIT6)
adf1092fa838e8 drivers/mtd/spi-nor/spi-nor.c Jungseung Lee        2019-12-0=
2  3464  			nor->flags |=3D SNOR_F_HAS_SR_TB_BIT6;
adf1092fa838e8 drivers/mtd/spi-nor/spi-nor.c Jungseung Lee        2019-12-0=
2  3465  	}
adf1092fa838e8 drivers/mtd/spi-nor/spi-nor.c Jungseung Lee        2019-12-0=
2  3466  =

2f5ad7f0f3e167 drivers/mtd/spi-nor/spi-nor.c mar.krzeminski       2017-01-0=
6  3467  	if (info->flags & NO_CHIP_ERASE)
2f5ad7f0f3e167 drivers/mtd/spi-nor/spi-nor.c mar.krzeminski       2017-01-0=
6  3468  		nor->flags |=3D SNOR_F_NO_OP_CHIP_ERASE;
c4b3eacc1dfef5 drivers/mtd/spi-nor/spi-nor.c Alexander Sverdlin   2017-07-1=
7  3469  	if (info->flags & USE_CLSR)
c4b3eacc1dfef5 drivers/mtd/spi-nor/spi-nor.c Alexander Sverdlin   2017-07-1=
7  3470  		nor->flags |=3D SNOR_F_USE_CLSR;
31ad3eff093cf2 drivers/mtd/spi-nor/core.c    Michael Walle        2020-12-0=
3  3471  	if (info->flags & SPI_NOR_SWP_IS_VOLATILE)
31ad3eff093cf2 drivers/mtd/spi-nor/core.c    Michael Walle        2020-12-0=
3  3472  		nor->flags |=3D SNOR_F_SWP_IS_VOLATILE;
c14deddec1fbd8 drivers/mtd/spi-nor/spi-nor.c grmoore(a)altera.com   2014-04=
-29  3473  =

05635c14a292de drivers/mtd/spi-nor/core.c    Jungseung Lee        2020-03-1=
8  3474  	if (info->flags & SPI_NOR_4BIT_BP) {
05635c14a292de drivers/mtd/spi-nor/core.c    Jungseung Lee        2020-03-1=
8  3475  		nor->flags |=3D SNOR_F_HAS_4BIT_BP;
05635c14a292de drivers/mtd/spi-nor/core.c    Jungseung Lee        2020-03-1=
8  3476  		if (info->flags & SPI_NOR_BP3_SR_BIT6)
05635c14a292de drivers/mtd/spi-nor/core.c    Jungseung Lee        2020-03-1=
8  3477  			nor->flags |=3D SNOR_F_HAS_SR_BP3_BIT6;
05635c14a292de drivers/mtd/spi-nor/core.c    Jungseung Lee        2020-03-1=
8  3478  	}
05635c14a292de drivers/mtd/spi-nor/core.c    Jungseung Lee        2020-03-1=
8  3479  =

b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-2=
4  3480  	if (info->flags & SPI_NOR_NO_ERASE)
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-2=
4  3481  		mtd->flags |=3D MTD_NO_ERASE;
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-2=
4  3482  =

b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-2=
4  3483  	mtd->dev.parent =3D dev;
2747bc2106aa42 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2022-01-2=
5  3484  	nor->jedec_id =3D info->id[0];
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-2=
4  3485  	mtd->writebufsize =3D nor->page_size;
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-2=
4  3486  =

bb276262e88dae drivers/mtd/spi-nor/spi-nor.c Brian Norris         2018-07-2=
7  3487  	if (of_property_read_bool(np, "broken-flash-reset"))
bb276262e88dae drivers/mtd/spi-nor/spi-nor.c Brian Norris         2018-07-2=
7  3488  		nor->flags |=3D SNOR_F_BROKEN_RESET;
bb276262e88dae drivers/mtd/spi-nor/spi-nor.c Brian Norris         2018-07-2=
7  3489  =

cfc5604c488ccd drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen      2017-04-2=
5  3490  	/*
cfc5604c488ccd drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen      2017-04-2=
5  3491  	 * Configure the SPI memory:
cfc5604c488ccd drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen      2017-04-2=
5  3492  	 * - select op codes for (Fast) Read, Page Program and Sector Era=
se.
cfc5604c488ccd drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen      2017-04-2=
5  3493  	 * - set the number of dummy cycles (mode cycles + wait states).
cfc5604c488ccd drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen      2017-04-2=
5  3494  	 * - set the SPI protocols for register and memory accesses.
cfc5604c488ccd drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen      2017-04-2=
5  3495  	 */
1e35a56781b4b5 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus        2019-08-2=
3  3496  	ret =3D spi_nor_setup(nor, hwcaps);
cfc5604c488ccd drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen      2017-04-2=
5  3497  	if (ret)
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-2=
4  3498  		return ret;
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-2=
4  3499  =

92094ebc385ef5 drivers/mtd/spi-nor/spi-nor.c Boris Brezillon      2019-08-2=
4  3500  	if (info->flags & SPI_NOR_4B_OPCODES)
548ed6847f5303 drivers/mtd/spi-nor/spi-nor.c Boris Brezillon      2018-12-0=
6  3501  		nor->flags |=3D SNOR_F_4B_OPCODES;
548ed6847f5303 drivers/mtd/spi-nor/spi-nor.c Boris Brezillon      2018-12-0=
6  3502  =

c6908077b194e4 drivers/mtd/spi-nor/core.c    Tudor Ambarus        2020-10-0=
5  3503  	if (info->flags & SPI_NOR_IO_MODE_EN_VOLATILE)
c6908077b194e4 drivers/mtd/spi-nor/core.c    Tudor Ambarus        2020-10-0=
5  3504  		nor->flags |=3D SNOR_F_IO_MODE_EN_VOLATILE;
c6908077b194e4 drivers/mtd/spi-nor/core.c    Tudor Ambarus        2020-10-0=
5  3505  =

696ce50f4e9377 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus        2019-08-2=
4  3506  	ret =3D spi_nor_set_addr_width(nor);
696ce50f4e9377 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus        2019-08-2=
4  3507  	if (ret)
696ce50f4e9377 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus        2019-08-2=
4  3508  		return ret;
c67cbb839da9cc drivers/mtd/spi-nor/spi-nor.c Brian Norris         2015-11-1=
0  3509  =

c4c795105f2924 drivers/mtd/spi-nor/core.c    Tudor Ambarus        2021-03-2=
2  3510  	spi_nor_register_locking_ops(nor);
c4c795105f2924 drivers/mtd/spi-nor/core.c    Tudor Ambarus        2021-03-2=
2  3511  =

46dde01f6bab35 drivers/mtd/spi-nor/spi-nor.c Kamal Dasu           2017-08-2=
2  3512  	/* Send all the required SPI flash commands to initialize device =
*/
46dde01f6bab35 drivers/mtd/spi-nor/spi-nor.c Kamal Dasu           2017-08-2=
2  3513  	ret =3D spi_nor_init(nor);
46dde01f6bab35 drivers/mtd/spi-nor/spi-nor.c Kamal Dasu           2017-08-2=
2  3514  	if (ret)
46dde01f6bab35 drivers/mtd/spi-nor/spi-nor.c Kamal Dasu           2017-08-2=
2  3515  		return ret;
46dde01f6bab35 drivers/mtd/spi-nor/spi-nor.c Kamal Dasu           2017-08-2=
2  3516  =

069089acf88b22 drivers/mtd/spi-nor/core.c    Michael Walle        2021-03-2=
2  3517  	/* Configure OTP parameters and ops */
069089acf88b22 drivers/mtd/spi-nor/core.c    Michael Walle        2021-03-2=
2  3518  	spi_nor_otp_init(nor);
069089acf88b22 drivers/mtd/spi-nor/core.c    Michael Walle        2021-03-2=
2  3519  =

06bb6f5a69dfc5 drivers/mtd/spi-nor/spi-nor.c Rafa=C5=82 Mi=C5=82ecki       =
 2015-08-10  3520  	dev_info(dev, "%s (%lld Kbytes)\n", info->name,
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-2=
4  3521  			(long long)mtd->size >> 10);
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-2=
4  3522  =

b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-2=
4  3523  	dev_dbg(dev,
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-2=
4  3524  		"mtd .name =3D %s, .size =3D 0x%llx (%lldMiB), "
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-2=
4  3525  		".erasesize =3D 0x%.8x (%uKiB) .numeraseregions =3D %d\n",
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-2=
4  3526  		mtd->name, (long long)mtd->size, (long long)(mtd->size >> 20),
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-2=
4  3527  		mtd->erasesize, mtd->erasesize / 1024, mtd->numeraseregions);
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-2=
4  3528  =

b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-2=
4  3529  	if (mtd->numeraseregions)
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-2=
4  3530  		for (i =3D 0; i < mtd->numeraseregions; i++)
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-2=
4  3531  			dev_dbg(dev,
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-2=
4  3532  				"mtd.eraseregions[%d] =3D { .offset =3D 0x%llx, "
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-2=
4  3533  				".erasesize =3D 0x%.8x (%uKiB), "
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-2=
4  3534  				".numblocks =3D %d }\n",
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-2=
4  3535  				i, (long long)mtd->eraseregions[i].offset,
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-2=
4  3536  				mtd->eraseregions[i].erasesize,
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-2=
4  3537  				mtd->eraseregions[i].erasesize / 1024,
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-2=
4  3538  				mtd->eraseregions[i].numblocks);
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-2=
4  3539  	return 0;
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-2=
4  3540  }
b61834b0d0ed50 drivers/mtd/spi-nor/spi-nor.c Brian Norris         2014-04-0=
8  3541  EXPORT_SYMBOL_GPL(spi_nor_scan);
b199489d37b21c drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-2=
4  3542  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5171348946297626879==--

