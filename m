Content-Type: multipart/mixed; boundary="===============6654862511811206563=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [xlnx:master 59/60] drivers/mtd/spi-nor/spi-nor.c:5455:22: warning: Unused variable: np_spi
Date: Thu, 04 Feb 2021 14:03:01 +0300
Message-ID: <20210204110301.GJ20820@kadam>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6654862511811206563==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/Xilinx/linux-xlnx  master
head:   043f8a226a752a1dd11f7ff64cee6dbe7334d394
commit: c0b33b8ccd38096c815f2dd39746044d0aa079d3 [59/60] staging: xlnxsync:=
 Fix the uapi header license
compiler: nios2-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   drivers/mtd/spi-nor/spi-nor.c:4170:24: warning: Boolean result is used i=
n bitwise operation. Clarify expression with parentheses. [clarifyCondition]
     map_id =3D map_id << 1 | !!(*buf & read_data_mask);

This works but it would be more readable as:

	map_id =3D (map_id << 1) | !!(*buf & read_data_mask);
                          ^
>> drivers/mtd/spi-nor/spi-nor.c:5455:22: warning: Unused variable: np_spi =
[unusedVariable]
    struct device_node *np_spi;
                        ^
   drivers/mtd/spi-nor/spi-nor.c:5456:6: warning: Unused variable: is_dual =
[unusedVariable]
    u32 is_dual;
        ^

Add moar ifdefs!

vim +5455 drivers/mtd/spi-nor/spi-nor.c

cfc5604c488ccd Cyrille Pitchen         2017-04-25  5445  int spi_nor_scan(s=
truct spi_nor *nor, const char *name,
cfc5604c488ccd Cyrille Pitchen         2017-04-25  5446  		 const struct sp=
i_nor_hwcaps *hwcaps)
b199489d37b21c Huang Shijie            2014-02-24  5447  {
4a15e396e500a0 Amit Kumar Mahapatra    2020-01-19  5448  	struct flash_info=
 *info =3D NULL;
b199489d37b21c Huang Shijie            2014-02-24  5449  	struct device *de=
v =3D nor->dev;
1976367173a47f Brian Norris            2015-08-13  5450  	struct mtd_info *=
mtd =3D &nor->mtd;
9c7d787508be6d Brian Norris            2015-10-30  5451  	struct device_nod=
e *np =3D spi_nor_get_flash_node(nor);
1e35a56781b4b5 Tudor Ambarus           2019-08-23  5452  	struct spi_nor_fl=
ash_parameter *params =3D &nor->params;
b199489d37b21c Huang Shijie            2014-02-24  5453  	int ret;
b199489d37b21c Huang Shijie            2014-02-24  5454  	int i;
4a15e396e500a0 Amit Kumar Mahapatra    2020-01-19 @5455  	struct device_nod=
e *np_spi;
4a15e396e500a0 Amit Kumar Mahapatra    2020-01-19  5456  	u32 is_dual;
b199489d37b21c Huang Shijie            2014-02-24  5457  =

b199489d37b21c Huang Shijie            2014-02-24  5458  	ret =3D spi_nor_c=
heck(nor);
b199489d37b21c Huang Shijie            2014-02-24  5459  	if (ret)
b199489d37b21c Huang Shijie            2014-02-24  5460  		return ret;
b199489d37b21c Huang Shijie            2014-02-24  5461  =

cfc5604c488ccd Cyrille Pitchen         2017-04-25  5462  	/* Reset SPI prot=
ocol for all commands. */
cfc5604c488ccd Cyrille Pitchen         2017-04-25  5463  	nor->reg_proto =
=3D SNOR_PROTO_1_1_1;
cfc5604c488ccd Cyrille Pitchen         2017-04-25  5464  	nor->read_proto =
=3D SNOR_PROTO_1_1_1;
cfc5604c488ccd Cyrille Pitchen         2017-04-25  5465  	nor->write_proto =
=3D SNOR_PROTO_1_1_1;
cfc5604c488ccd Cyrille Pitchen         2017-04-25  5466  =

f173f26a4d543f Vignesh Raghavendra     2019-08-06  5467  	/*
f173f26a4d543f Vignesh Raghavendra     2019-08-06  5468  	 * We need the bo=
unce buffer early to read/write registers when going
f173f26a4d543f Vignesh Raghavendra     2019-08-06  5469  	 * through the sp=
i-mem layer (buffers have to be DMA-able).
b35b9a10362d20 Boris Brezillon         2019-08-06  5470  	 * For spi-mem dr=
ivers, we'll reallocate a new buffer if
b35b9a10362d20 Boris Brezillon         2019-08-06  5471  	 * nor->page_size=
 turns out to be greater than PAGE_SIZE (which
b35b9a10362d20 Boris Brezillon         2019-08-06  5472  	 * shouldn't happ=
en before long since NOR pages are usually less
b35b9a10362d20 Boris Brezillon         2019-08-06  5473  	 * than 1KB) afte=
r spi_nor_scan() returns.
f173f26a4d543f Vignesh Raghavendra     2019-08-06  5474  	 */
f173f26a4d543f Vignesh Raghavendra     2019-08-06  5475  	nor->bouncebuf_si=
ze =3D PAGE_SIZE;
f173f26a4d543f Vignesh Raghavendra     2019-08-06  5476  	nor->bouncebuf =
=3D devm_kmalloc(dev, nor->bouncebuf_size,
f173f26a4d543f Vignesh Raghavendra     2019-08-06  5477  				      GFP_KERN=
EL);
f173f26a4d543f Vignesh Raghavendra     2019-08-06  5478  	if (!nor->bounceb=
uf)
f173f26a4d543f Vignesh Raghavendra     2019-08-06  5479  		return -ENOMEM;
f173f26a4d543f Vignesh Raghavendra     2019-08-06  5480  =

620df2497415a9 Tudor Ambarus           2019-08-24  5481  	info =3D spi_nor_=
get_flash_info(nor, name);
620df2497415a9 Tudor Ambarus           2019-08-24  5482  	if (IS_ERR(info))
620df2497415a9 Tudor Ambarus           2019-08-24  5483  		return PTR_ERR(i=
nfo);
b199489d37b21c Huang Shijie            2014-02-24  5484  =

b296379fef7ce9 Boris Brezillon         2018-12-06  5485  	nor->info =3D inf=
o;
b296379fef7ce9 Boris Brezillon         2018-12-06  5486  =

dcc935b06f1f29 Zhuohao Lee             2019-08-28  5487  	spi_nor_debugfs_i=
nit(nor, info);
dcc935b06f1f29 Zhuohao Lee             2019-08-28  5488  =

b199489d37b21c Huang Shijie            2014-02-24  5489  	mutex_init(&nor->=
lock);
b199489d37b21c Huang Shijie            2014-02-24  5490  =

e99ca98f1d7190 Ricardo Ribalda Delgado 2016-12-02  5491  	/*
e99ca98f1d7190 Ricardo Ribalda Delgado 2016-12-02  5492  	 * Make sure the =
XSR_RDY flag is set before calling
e99ca98f1d7190 Ricardo Ribalda Delgado 2016-12-02  5493  	 * spi_nor_wait_t=
ill_ready(). Xilinx S3AN share MFR
e99ca98f1d7190 Ricardo Ribalda Delgado 2016-12-02  5494  	 * with Atmel spi=
-nor
e99ca98f1d7190 Ricardo Ribalda Delgado 2016-12-02  5495  	 */
ad3bba06b63697 Boris Brezillon         2019-07-30  5496  	if (info->flags &=
 SPI_NOR_XSR_RDY)
e99ca98f1d7190 Ricardo Ribalda Delgado 2016-12-02  5497  		nor->flags |=3D =
 SNOR_F_READY_XSR_RDY;
e99ca98f1d7190 Ricardo Ribalda Delgado 2016-12-02  5498  =

dff972458acb05 Boris Brezillon         2019-08-24  5499  	if (info->flags &=
 SPI_NOR_HAS_LOCK)
dff972458acb05 Boris Brezillon         2019-08-24  5500  		nor->flags |=3D =
SNOR_F_HAS_LOCK;
dff972458acb05 Boris Brezillon         2019-08-24  5501  =

bc9834d82ffb13 Sai Krishna Potthuri    2019-12-26  5502  	if ((u16)JEDEC_MF=
R(nor->info) !=3D SNOR_MFR_MICRON)
bc9834d82ffb13 Sai Krishna Potthuri    2019-12-26  5503  		nor->flags |=3D =
SNOR_F_BROKEN_OCTAL_DDR;
bc9834d82ffb13 Sai Krishna Potthuri    2019-12-26  5504  =

191f5c2ed4b6fa Tudor Ambarus           2019-06-10  5505  	/*
191f5c2ed4b6fa Tudor Ambarus           2019-06-10  5506  	 * Atmel, SST, In=
tel/Numonyx, and others serial NOR tend to power up
191f5c2ed4b6fa Tudor Ambarus           2019-06-10  5507  	 * with the softw=
are protection bits set.
191f5c2ed4b6fa Tudor Ambarus           2019-06-10  5508  	 */
191f5c2ed4b6fa Tudor Ambarus           2019-06-10  5509  	if (JEDEC_MFR(nor=
->info) =3D=3D SNOR_MFR_ATMEL ||
191f5c2ed4b6fa Tudor Ambarus           2019-06-10  5510  	    JEDEC_MFR(nor=
->info) =3D=3D SNOR_MFR_INTEL ||
191f5c2ed4b6fa Tudor Ambarus           2019-06-10  5511  	    JEDEC_MFR(nor=
->info) =3D=3D SNOR_MFR_SST ||
4a15e396e500a0 Amit Kumar Mahapatra    2020-01-19  5512  	    nor->info->fl=
ags & SPI_NOR_HAS_LOCK) {
4a15e396e500a0 Amit Kumar Mahapatra    2020-01-19  5513  		write_enable(nor=
);
4a15e396e500a0 Amit Kumar Mahapatra    2020-01-19  5514  		write_sr(nor, 0);
4a15e396e500a0 Amit Kumar Mahapatra    2020-01-19  5515  		if (info->flags =
& SST_GLOBAL_PROT_UNLK) {
4a15e396e500a0 Amit Kumar Mahapatra    2020-01-19  5516  			write_enable(no=
r);
abd3edf0a1c724 Amit Kumar Mahapatra    2020-02-17  5517  			if (nor->spimem=
) {
abd3edf0a1c724 Amit Kumar Mahapatra    2020-02-17  5518  				struct spi_mem=
_op op =3D
abd3edf0a1c724 Amit Kumar Mahapatra    2020-02-17  5519  					SPI_MEM_OP(SP=
I_MEM_OP_CMD(GLOBAL_BLKPROT_UNLK, 1),
abd3edf0a1c724 Amit Kumar Mahapatra    2020-02-17  5520  						   SPI_MEM_O=
P_NO_ADDR,
abd3edf0a1c724 Amit Kumar Mahapatra    2020-02-17  5521  						   SPI_MEM_O=
P_NO_DUMMY,
abd3edf0a1c724 Amit Kumar Mahapatra    2020-02-17  5522  						   SPI_MEM_O=
P_NO_DATA);
abd3edf0a1c724 Amit Kumar Mahapatra    2020-02-17  5523  =

abd3edf0a1c724 Amit Kumar Mahapatra    2020-02-17  5524  				spi_mem_exec_o=
p(nor->spimem, &op);
abd3edf0a1c724 Amit Kumar Mahapatra    2020-02-17  5525  			} else {
4a15e396e500a0 Amit Kumar Mahapatra    2020-01-19  5526  				/* Unlock glob=
al write protection bits */
4a15e396e500a0 Amit Kumar Mahapatra    2020-01-19  5527  				nor->write_reg=
(nor, GLOBAL_BLKPROT_UNLK, NULL, 0);
4a15e396e500a0 Amit Kumar Mahapatra    2020-01-19  5528  			}
abd3edf0a1c724 Amit Kumar Mahapatra    2020-02-17  5529  		}
4a15e396e500a0 Amit Kumar Mahapatra    2020-01-19  5530  		spi_nor_wait_til=
l_ready(nor);
4a15e396e500a0 Amit Kumar Mahapatra    2020-01-19  5531  	}
191f5c2ed4b6fa Tudor Ambarus           2019-06-10  5532  =

1c1d8d98e1c706 Tudor Ambarus           2019-08-24  5533  	/* Init flash par=
ameters based on flash_info struct and SFDP */
1c1d8d98e1c706 Tudor Ambarus           2019-08-24  5534  	spi_nor_init_para=
ms(nor);
cfc5604c488ccd Cyrille Pitchen         2017-04-25  5535  =

32f1b7c8352fd3 Rafa=C5=82 Mi=C5=82ecki           2014-09-28  5536  	if (!mt=
d->name)
b199489d37b21c Huang Shijie            2014-02-24  5537  		mtd->name =3D de=
v_name(dev);
c9ec3900abf279 Brian Norris            2015-08-13  5538  	mtd->priv =3D nor;
b199489d37b21c Huang Shijie            2014-02-24  5539  	mtd->type =3D MTD=
_NORFLASH;
b199489d37b21c Huang Shijie            2014-02-24  5540  	mtd->writesize =
=3D 1;
b199489d37b21c Huang Shijie            2014-02-24  5541  	mtd->flags =3D MT=
D_CAP_NORFLASH;
1e35a56781b4b5 Tudor Ambarus           2019-08-23  5542  	mtd->size =3D par=
ams->size;
b199489d37b21c Huang Shijie            2014-02-24  5543  	mtd->_erase =3D s=
pi_nor_erase;
b199489d37b21c Huang Shijie            2014-02-24  5544  	mtd->_read =3D sp=
i_nor_read;
4a15e396e500a0 Amit Kumar Mahapatra    2020-01-19  5545  	nor->page_size =
=3D params->page_size;
4a15e396e500a0 Amit Kumar Mahapatra    2020-01-19  5546  #ifdef CONFIG_OF
4a15e396e500a0 Amit Kumar Mahapatra    2020-01-19  5547  	np_spi =3D of_get=
_next_parent(np);
e48e22ba9df304 Amit Kumar Mahapatra    2020-01-19  5548  	if (((of_property=
_match_string(np_spi, "compatible",
e48e22ba9df304 Amit Kumar Mahapatra    2020-01-19  5549  				       "xlnx,z=
ynq-qspi-1.0") >=3D 0) ||
e48e22ba9df304 Amit Kumar Mahapatra    2020-01-19  5550  		(of_property_mat=
ch_string(np_spi, "compatible",
e48e22ba9df304 Amit Kumar Mahapatra    2020-01-19  5551  				"xlnx,zynqmp-q=
spi-1.0") >=3D 0)) ||
e48e22ba9df304 Amit Kumar Mahapatra    2020-01-19  5552  		(of_property_mat=
ch_string(np_spi, "compatible",
e48e22ba9df304 Amit Kumar Mahapatra    2020-01-19  5553  				"xlnx,versal-q=
spi-1.0") >=3D 0)) {
4a15e396e500a0 Amit Kumar Mahapatra    2020-01-19  5554  		if (of_property_=
read_u32(np_spi, "is-dual",
4a15e396e500a0 Amit Kumar Mahapatra    2020-01-19  5555  					 &is_dual) < =
0) {
4a15e396e500a0 Amit Kumar Mahapatra    2020-01-19  5556  			/* Default to s=
ingle if prop not defined */
4a15e396e500a0 Amit Kumar Mahapatra    2020-01-19  5557  			nor->shift =3D =
0;
4a15e396e500a0 Amit Kumar Mahapatra    2020-01-19  5558  			nor->isstacked =
=3D 0;
4a15e396e500a0 Amit Kumar Mahapatra    2020-01-19  5559  			nor->isparallel=
 =3D 0;
4a15e396e500a0 Amit Kumar Mahapatra    2020-01-19  5560  		} else {
4a15e396e500a0 Amit Kumar Mahapatra    2020-01-19  5561  			if (is_dual =3D=
=3D 1) {
4a15e396e500a0 Amit Kumar Mahapatra    2020-01-19  5562  				/* dual parall=
el */
4a15e396e500a0 Amit Kumar Mahapatra    2020-01-19  5563  				nor->shift =3D=
 1;
4a15e396e500a0 Amit Kumar Mahapatra    2020-01-19  5564  				info->sector_s=
ize <<=3D nor->shift;
4a15e396e500a0 Amit Kumar Mahapatra    2020-01-19  5565  				info->page_siz=
e <<=3D nor->shift;
4a15e396e500a0 Amit Kumar Mahapatra    2020-01-19  5566  				mtd->size <<=
=3D nor->shift;
4a15e396e500a0 Amit Kumar Mahapatra    2020-01-19  5567  				nor->isparalle=
l =3D 1;
4a15e396e500a0 Amit Kumar Mahapatra    2020-01-19  5568  				nor->isstacked=
 =3D 0;
4a15e396e500a0 Amit Kumar Mahapatra    2020-01-19  5569  				nor->spi->mast=
er->flags |=3D
e48e22ba9df304 Amit Kumar Mahapatra    2020-01-19  5570  						(SPI_MASTER_=
DATA_STRIPE
e48e22ba9df304 Amit Kumar Mahapatra    2020-01-19  5571  						| SPI_MASTER=
_BOTH_CS);
4a15e396e500a0 Amit Kumar Mahapatra    2020-01-19  5572  			} else {
4a15e396e500a0 Amit Kumar Mahapatra    2020-01-19  5573  #ifdef CONFIG_SPI_=
ZYNQ_QSPI_DUAL_STACKED
4a15e396e500a0 Amit Kumar Mahapatra    2020-01-19  5574  				/* dual stacke=
d */
4a15e396e500a0 Amit Kumar Mahapatra    2020-01-19  5575  				nor->shift =3D=
 0;
4a15e396e500a0 Amit Kumar Mahapatra    2020-01-19  5576  				mtd->size <<=
=3D 1;
4a15e396e500a0 Amit Kumar Mahapatra    2020-01-19  5577  				info->n_sector=
s <<=3D 1;
4a15e396e500a0 Amit Kumar Mahapatra    2020-01-19  5578  				nor->isstacked=
 =3D 1;
4a15e396e500a0 Amit Kumar Mahapatra    2020-01-19  5579  				nor->isparalle=
l =3D 0;
4a15e396e500a0 Amit Kumar Mahapatra    2020-01-19  5580  #else
4a15e396e500a0 Amit Kumar Mahapatra    2020-01-19  5581  				u32 is_stacked;
4a15e396e500a0 Amit Kumar Mahapatra    2020-01-19  5582  =

4a15e396e500a0 Amit Kumar Mahapatra    2020-01-19  5583  				if (of_propert=
y_read_u32(np_spi,
4a15e396e500a0 Amit Kumar Mahapatra    2020-01-19  5584  							 "is-stacke=
d",
4a15e396e500a0 Amit Kumar Mahapatra    2020-01-19  5585  							 &is_stacke=
d) < 0) {
4a15e396e500a0 Amit Kumar Mahapatra    2020-01-19  5586  					is_stacked =
=3D 0;
4a15e396e500a0 Amit Kumar Mahapatra    2020-01-19  5587  				}
4a15e396e500a0 Amit Kumar Mahapatra    2020-01-19  5588  				if (is_stacked=
) {
4a15e396e500a0 Amit Kumar Mahapatra    2020-01-19  5589  					/* dual stack=
ed */
4a15e396e500a0 Amit Kumar Mahapatra    2020-01-19  5590  					nor->shift =
=3D 0;
4a15e396e500a0 Amit Kumar Mahapatra    2020-01-19  5591  					mtd->size <<=
=3D 1;
4a15e396e500a0 Amit Kumar Mahapatra    2020-01-19  5592  					info->n_secto=
rs <<=3D 1;
4a15e396e500a0 Amit Kumar Mahapatra    2020-01-19  5593  					nor->isstacke=
d =3D 1;
4a15e396e500a0 Amit Kumar Mahapatra    2020-01-19  5594  					nor->isparall=
el =3D 0;
4a15e396e500a0 Amit Kumar Mahapatra    2020-01-19  5595  				} else {
4a15e396e500a0 Amit Kumar Mahapatra    2020-01-19  5596  					/* single */
4a15e396e500a0 Amit Kumar Mahapatra    2020-01-19  5597  					nor->shift =
=3D 0;
4a15e396e500a0 Amit Kumar Mahapatra    2020-01-19  5598  					nor->isstacke=
d =3D 0;
4a15e396e500a0 Amit Kumar Mahapatra    2020-01-19  5599  					nor->isparall=
el =3D 0;
4a15e396e500a0 Amit Kumar Mahapatra    2020-01-19  5600  				}
4a15e396e500a0 Amit Kumar Mahapatra    2020-01-19  5601  #endif
4a15e396e500a0 Amit Kumar Mahapatra    2020-01-19  5602  			}
4a15e396e500a0 Amit Kumar Mahapatra    2020-01-19  5603  		}
4a15e396e500a0 Amit Kumar Mahapatra    2020-01-19  5604  	}
4a15e396e500a0 Amit Kumar Mahapatra    2020-01-19  5605  #else
4a15e396e500a0 Amit Kumar Mahapatra    2020-01-19  5606  	/* Default to sin=
gle */
4a15e396e500a0 Amit Kumar Mahapatra    2020-01-19  5607  	nor->shift =3D 0;
4a15e396e500a0 Amit Kumar Mahapatra    2020-01-19  5608  	nor->isstacked =
=3D 0;
4a15e396e500a0 Amit Kumar Mahapatra    2020-01-19  5609  	nor->isparallel =
=3D 0;
4a15e396e500a0 Amit Kumar Mahapatra    2020-01-19  5610  #endif
d6084fc83c8249 Kamal Dasu              2017-08-22  5611  	mtd->_resume =3D =
spi_nor_resume;
b199489d37b21c Huang Shijie            2014-02-24  5612  =

dff972458acb05 Boris Brezillon         2019-08-24  5613  	if (nor->params.l=
ocking_ops) {
b199489d37b21c Huang Shijie            2014-02-24  5614  		mtd->_lock =3D s=
pi_nor_lock;
b199489d37b21c Huang Shijie            2014-02-24  5615  		mtd->_unlock =3D=
 spi_nor_unlock;
5bf0e69b67a560 Brian Norris            2015-09-01  5616  		mtd->_is_locked =
=3D spi_nor_is_locked;
b199489d37b21c Huang Shijie            2014-02-24  5617  	}
b199489d37b21c Huang Shijie            2014-02-24  5618  =

b199489d37b21c Huang Shijie            2014-02-24  5619  	/* sst nor chips =
use AAI word program */
b199489d37b21c Huang Shijie            2014-02-24  5620  	if (info->flags &=
 SST_WRITE)
b199489d37b21c Huang Shijie            2014-02-24  5621  		mtd->_write =3D =
sst_write;
b199489d37b21c Huang Shijie            2014-02-24  5622  	else
b199489d37b21c Huang Shijie            2014-02-24  5623  		mtd->_write =3D =
spi_nor_write;
b199489d37b21c Huang Shijie            2014-02-24  5624  =

51983b7dcf3a50 Brian Norris            2014-09-10  5625  	if (info->flags &=
 USE_FSR)
51983b7dcf3a50 Brian Norris            2014-09-10  5626  		nor->flags |=3D =
SNOR_F_USE_FSR;
3dd8012a8eeb37 Brian Norris            2016-01-29  5627  	if (info->flags &=
 SPI_NOR_HAS_TB)
3dd8012a8eeb37 Brian Norris            2016-01-29  5628  		nor->flags |=3D =
SNOR_F_HAS_SR_TB;
2f5ad7f0f3e167 mar.krzeminski          2017-01-06  5629  	if (info->flags &=
 NO_CHIP_ERASE)
2f5ad7f0f3e167 mar.krzeminski          2017-01-06  5630  		nor->flags |=3D =
SNOR_F_NO_OP_CHIP_ERASE;
c4b3eacc1dfef5 Alexander Sverdlin      2017-07-17  5631  	if (info->flags &=
 USE_CLSR)
c4b3eacc1dfef5 Alexander Sverdlin      2017-07-17  5632  		nor->flags |=3D =
SNOR_F_USE_CLSR;
c14deddec1fbd8 grmoore(a)altera.com      2014-04-29  5633  =

b199489d37b21c Huang Shijie            2014-02-24  5634  	if (info->flags &=
 SPI_NOR_NO_ERASE)
b199489d37b21c Huang Shijie            2014-02-24  5635  		mtd->flags |=3D =
MTD_NO_ERASE;
b199489d37b21c Huang Shijie            2014-02-24  5636  =

b199489d37b21c Huang Shijie            2014-02-24  5637  	mtd->dev.parent =
=3D dev;
4a15e396e500a0 Amit Kumar Mahapatra    2020-01-19  5638  	nor->jedec_id =3D=
 info->id[0];
b199489d37b21c Huang Shijie            2014-02-24  5639  	mtd->writebufsize=
 =3D nor->page_size;
b199489d37b21c Huang Shijie            2014-02-24  5640  =

bb276262e88dae Brian Norris            2018-07-27  5641  	if (of_property_r=
ead_bool(np, "broken-flash-reset"))
bb276262e88dae Brian Norris            2018-07-27  5642  		nor->flags |=3D =
SNOR_F_BROKEN_RESET;
bb276262e88dae Brian Norris            2018-07-27  5643  =

cfc5604c488ccd Cyrille Pitchen         2017-04-25  5644  	/*
cfc5604c488ccd Cyrille Pitchen         2017-04-25  5645  	 * Configure the =
SPI memory:
cfc5604c488ccd Cyrille Pitchen         2017-04-25  5646  	 * - select op co=
des for (Fast) Read, Page Program and Sector Erase.
cfc5604c488ccd Cyrille Pitchen         2017-04-25  5647  	 * - set the numb=
er of dummy cycles (mode cycles + wait states).
cfc5604c488ccd Cyrille Pitchen         2017-04-25  5648  	 * - set the SPI =
protocols for register and memory accesses.
cfc5604c488ccd Cyrille Pitchen         2017-04-25  5649  	 */
1e35a56781b4b5 Tudor Ambarus           2019-08-23  5650  	ret =3D spi_nor_s=
etup(nor, hwcaps);
cfc5604c488ccd Cyrille Pitchen         2017-04-25  5651  	if (ret)
b199489d37b21c Huang Shijie            2014-02-24  5652  		return ret;
b199489d37b21c Huang Shijie            2014-02-24  5653  =

92094ebc385ef5 Boris Brezillon         2019-08-24  5654  	if (info->flags &=
 SPI_NOR_4B_OPCODES)
548ed6847f5303 Boris Brezillon         2018-12-06  5655  		nor->flags |=3D =
SNOR_F_4B_OPCODES;
548ed6847f5303 Boris Brezillon         2018-12-06  5656  =

696ce50f4e9377 Tudor Ambarus           2019-08-24  5657  	ret =3D spi_nor_s=
et_addr_width(nor);
696ce50f4e9377 Tudor Ambarus           2019-08-24  5658  	if (ret)
696ce50f4e9377 Tudor Ambarus           2019-08-24  5659  		return ret;
c67cbb839da9cc Brian Norris            2015-11-10  5660  =

46dde01f6bab35 Kamal Dasu              2017-08-22  5661  	/* Send all the r=
equired SPI flash commands to initialize device */
46dde01f6bab35 Kamal Dasu              2017-08-22  5662  	ret =3D spi_nor_i=
nit(nor);
46dde01f6bab35 Kamal Dasu              2017-08-22  5663  	if (ret)
46dde01f6bab35 Kamal Dasu              2017-08-22  5664  		return ret;
46dde01f6bab35 Kamal Dasu              2017-08-22  5665  =

06bb6f5a69dfc5 Rafa=C5=82 Mi=C5=82ecki           2015-08-10  5666  	dev_inf=
o(dev, "%s (%lld Kbytes)\n", info->name,
b199489d37b21c Huang Shijie            2014-02-24  5667  			(long long)mtd-=
>size >> 10);
b199489d37b21c Huang Shijie            2014-02-24  5668  =

b199489d37b21c Huang Shijie            2014-02-24  5669  	dev_dbg(dev,
b199489d37b21c Huang Shijie            2014-02-24  5670  		"mtd .name =3D %=
s, .size =3D 0x%llx (%lldMiB), "
b199489d37b21c Huang Shijie            2014-02-24  5671  		".erasesize =3D =
0x%.8x (%uKiB) .numeraseregions =3D %d\n",
b199489d37b21c Huang Shijie            2014-02-24  5672  		mtd->name, (long=
 long)mtd->size, (long long)(mtd->size >> 20),
b199489d37b21c Huang Shijie            2014-02-24  5673  		mtd->erasesize, =
mtd->erasesize / 1024, mtd->numeraseregions);
b199489d37b21c Huang Shijie            2014-02-24  5674  =

bc9834d82ffb13 Sai Krishna Potthuri    2019-12-26  5675  	if (hwcaps->mask =
& (SNOR_HWCAPS_READ_8_8_8 | SNOR_HWCAPS_PP_8_8_8)) {
bc9834d82ffb13 Sai Krishna Potthuri    2019-12-26  5676  		if (!(nor->flags=
 & SNOR_F_BROKEN_OCTAL_DDR)) {
bc9834d82ffb13 Sai Krishna Potthuri    2019-12-26  5677  			ret =3D spi_nor=
_switch_micron_octal_ddr(nor);
bc9834d82ffb13 Sai Krishna Potthuri    2019-12-26  5678  			if (ret)
bc9834d82ffb13 Sai Krishna Potthuri    2019-12-26  5679  				return ret;
bc9834d82ffb13 Sai Krishna Potthuri    2019-12-26  5680  		}
bc9834d82ffb13 Sai Krishna Potthuri    2019-12-26  5681  	}
bc9834d82ffb13 Sai Krishna Potthuri    2019-12-26  5682  =

b199489d37b21c Huang Shijie            2014-02-24  5683  	if (mtd->numerase=
regions)
b199489d37b21c Huang Shijie            2014-02-24  5684  		for (i =3D 0; i =
< mtd->numeraseregions; i++)
b199489d37b21c Huang Shijie            2014-02-24  5685  			dev_dbg(dev,
b199489d37b21c Huang Shijie            2014-02-24  5686  				"mtd.eraseregi=
ons[%d] =3D { .offset =3D 0x%llx, "
b199489d37b21c Huang Shijie            2014-02-24  5687  				".erasesize =
=3D 0x%.8x (%uKiB), "
b199489d37b21c Huang Shijie            2014-02-24  5688  				".numblocks =
=3D %d }\n",
b199489d37b21c Huang Shijie            2014-02-24  5689  				i, (long long)=
mtd->eraseregions[i].offset,
b199489d37b21c Huang Shijie            2014-02-24  5690  				mtd->eraseregi=
ons[i].erasesize,
b199489d37b21c Huang Shijie            2014-02-24  5691  				mtd->eraseregi=
ons[i].erasesize / 1024,
b199489d37b21c Huang Shijie            2014-02-24  5692  				mtd->eraseregi=
ons[i].numblocks);
b199489d37b21c Huang Shijie            2014-02-24  5693  	return 0;
b199489d37b21c Huang Shijie            2014-02-24  5694  }

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org =

_______________________________________________
kbuild mailing list -- kbuild(a)lists.01.org
To unsubscribe send an email to kbuild-leave(a)lists.01.org
--===============6654862511811206563==--

