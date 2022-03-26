Content-Type: multipart/mixed; boundary="===============2894348207184560559=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [xilinx-xlnx:xlnx_rebase_v5.15_LTS 72/1029] drivers/mtd/spi-nor/core.c:1891 spi_nor_read_id() error: we previously assumed 'nor->spimem' could be null (see line 1873)
Date: Sat, 26 Mar 2022 09:29:54 +0800
Message-ID: <202203260951.2woxTIAO-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2894348207184560559==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-arm-kernel(a)lists.infradead.org
TO: Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>
CC: Michal Simek <monstr@monstr.eu>
CC: Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.15_LTS
head:   1870e0fa79a9d58c6748c34550f3ccea0b515933
commit: 87a0aa695a2dbabc2d1a24acbb421529ea53c59e [72/1029] spi: spi-cadence=
-quadspi: Add support for DDR PHY mode
:::::: branch date: 35 hours ago
:::::: commit date: 8 weeks ago
config: nios2-randconfig-m031-20220324 (https://download.01.org/0day-ci/arc=
hive/20220326/202203260951.2woxTIAO-lkp(a)intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/mtd/spi-nor/core.c:1891 spi_nor_read_id() error: we previously assu=
med 'nor->spimem' could be null (see line 1873)

Old smatch warnings:
arch/nios2/include/asm/thread_info.h:71 current_thread_info() error: uninit=
ialized symbol 'sp'.
drivers/mtd/spi-nor/core.c:1544 spi_nor_init_erase_cmd_list() warn: passing=
 a valid pointer to 'PTR_ERR'
drivers/mtd/spi-nor/core.c:1558 spi_nor_init_erase_cmd_list() warn: passing=
 a valid pointer to 'PTR_ERR'

vim +1891 drivers/mtd/spi-nor/core.c

9ec4bbcb2044ea1 drivers/mtd/spi-nor/core.c    Boris Brezillon      2020-03-=
13  1865  =

06bb6f5a69dfc53 drivers/mtd/spi-nor/spi-nor.c Rafa=C5=82 Mi=C5=82ecki      =
  2015-08-10  1866  static const struct flash_info *spi_nor_read_id(struct =
spi_nor *nor)
b199489d37b21c5 drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-=
24  1867  {
9ec4bbcb2044ea1 drivers/mtd/spi-nor/core.c    Boris Brezillon      2020-03-=
13  1868  	const struct flash_info *info;
f173f26a4d543fa drivers/mtd/spi-nor/spi-nor.c Vignesh Raghavendra  2019-08-=
06  1869  	u8 *id =3D nor->bouncebuf;
2dcbfe365b13032 drivers/mtd/spi-nor/spi-nor.c Jonathan Neusch=C3=A4fer  202=
0-02-23  1870  	unsigned int i;
2dcbfe365b13032 drivers/mtd/spi-nor/spi-nor.c Jonathan Neusch=C3=A4fer  202=
0-02-23  1871  	int ret;
b199489d37b21c5 drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-=
24  1872  =

b35b9a10362d203 drivers/mtd/spi-nor/spi-nor.c Boris Brezillon      2019-08-=
06 @1873  	if (nor->spimem) {
b35b9a10362d203 drivers/mtd/spi-nor/spi-nor.c Boris Brezillon      2019-08-=
06  1874  		struct spi_mem_op op =3D
b35b9a10362d203 drivers/mtd/spi-nor/spi-nor.c Boris Brezillon      2019-08-=
06  1875  			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_RDID, 1),
b35b9a10362d203 drivers/mtd/spi-nor/spi-nor.c Boris Brezillon      2019-08-=
06  1876  				   SPI_MEM_OP_NO_ADDR,
b35b9a10362d203 drivers/mtd/spi-nor/spi-nor.c Boris Brezillon      2019-08-=
06  1877  				   SPI_MEM_OP_NO_DUMMY,
b35b9a10362d203 drivers/mtd/spi-nor/spi-nor.c Boris Brezillon      2019-08-=
06  1878  				   SPI_MEM_OP_DATA_IN(SPI_NOR_MAX_ID_LEN, id, 1));
b35b9a10362d203 drivers/mtd/spi-nor/spi-nor.c Boris Brezillon      2019-08-=
06  1879  =

2dcbfe365b13032 drivers/mtd/spi-nor/spi-nor.c Jonathan Neusch=C3=A4fer  202=
0-02-23  1880  		ret =3D spi_mem_exec_op(nor->spimem, &op);
b35b9a10362d203 drivers/mtd/spi-nor/spi-nor.c Boris Brezillon      2019-08-=
06  1881  	} else {
2dcbfe365b13032 drivers/mtd/spi-nor/spi-nor.c Jonathan Neusch=C3=A4fer  202=
0-02-23  1882  		ret =3D nor->controller_ops->read_reg(nor, SPINOR_OP_RDID,=
 id,
b35b9a10362d203 drivers/mtd/spi-nor/spi-nor.c Boris Brezillon      2019-08-=
06  1883  						    SPI_NOR_MAX_ID_LEN);
b35b9a10362d203 drivers/mtd/spi-nor/spi-nor.c Boris Brezillon      2019-08-=
06  1884  	}
2dcbfe365b13032 drivers/mtd/spi-nor/spi-nor.c Jonathan Neusch=C3=A4fer  202=
0-02-23  1885  	if (ret) {
2dcbfe365b13032 drivers/mtd/spi-nor/spi-nor.c Jonathan Neusch=C3=A4fer  202=
0-02-23  1886  		dev_dbg(nor->dev, "error %d reading JEDEC ID\n", ret);
2dcbfe365b13032 drivers/mtd/spi-nor/spi-nor.c Jonathan Neusch=C3=A4fer  202=
0-02-23  1887  		return ERR_PTR(ret);
b199489d37b21c5 drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-=
24  1888  	}
b199489d37b21c5 drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-=
24  1889  =

87a0aa695a2dbab drivers/mtd/spi-nor/core.c    Sai Krishna Potthuri 2021-12-=
09  1890  	for (i =3D 0; i < SPI_NOR_MAX_ID_LEN; i++)
87a0aa695a2dbab drivers/mtd/spi-nor/core.c    Sai Krishna Potthuri 2021-12-=
09 @1891  		nor->spimem->device_id[i] =3D id[i];
87a0aa695a2dbab drivers/mtd/spi-nor/core.c    Sai Krishna Potthuri 2021-12-=
09  1892  =

9ec4bbcb2044ea1 drivers/mtd/spi-nor/core.c    Boris Brezillon      2020-03-=
13  1893  	for (i =3D 0; i < ARRAY_SIZE(manufacturers); i++) {
9ec4bbcb2044ea1 drivers/mtd/spi-nor/core.c    Boris Brezillon      2020-03-=
13  1894  		info =3D spi_nor_search_part_by_id(manufacturers[i]->parts,
9ec4bbcb2044ea1 drivers/mtd/spi-nor/core.c    Boris Brezillon      2020-03-=
13  1895  						 manufacturers[i]->nparts,
9ec4bbcb2044ea1 drivers/mtd/spi-nor/core.c    Boris Brezillon      2020-03-=
13  1896  						 id);
9ec4bbcb2044ea1 drivers/mtd/spi-nor/core.c    Boris Brezillon      2020-03-=
13  1897  		if (info) {
9ec4bbcb2044ea1 drivers/mtd/spi-nor/core.c    Boris Brezillon      2020-03-=
13  1898  			nor->manufacturer =3D manufacturers[i];
9ec4bbcb2044ea1 drivers/mtd/spi-nor/core.c    Boris Brezillon      2020-03-=
13  1899  			return info;
b199489d37b21c5 drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-=
24  1900  		}
9ec4bbcb2044ea1 drivers/mtd/spi-nor/core.c    Boris Brezillon      2020-03-=
13  1901  	}
9ec4bbcb2044ea1 drivers/mtd/spi-nor/core.c    Boris Brezillon      2020-03-=
13  1902  =

3ddc8adbbc76832 drivers/mtd/spi-nor/spi-nor.c Geert Uytterhoeven   2019-03-=
12  1903  	dev_err(nor->dev, "unrecognized JEDEC id bytes: %*ph\n",
3ddc8adbbc76832 drivers/mtd/spi-nor/spi-nor.c Geert Uytterhoeven   2019-03-=
12  1904  		SPI_NOR_MAX_ID_LEN, id);
b199489d37b21c5 drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-=
24  1905  	return ERR_PTR(-ENODEV);
b199489d37b21c5 drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-=
24  1906  }
b199489d37b21c5 drivers/mtd/spi-nor/spi-nor.c Huang Shijie         2014-02-=
24  1907  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2894348207184560559==--

