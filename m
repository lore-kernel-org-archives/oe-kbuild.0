Content-Type: multipart/mixed; boundary="===============1343021252220996485=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [xilinx-xlnx:xlnx_rebase_v5.15_LTS 977/1029] drivers/mtd/spi-nor/swp.c:55 spi_nor_get_min_prot_length_sr() warn: should 'sector_size << (bp_slots_needed - bp_slots)' be a 64 bit type?
Date: Sat, 26 Mar 2022 12:06:20 +0800
Message-ID: <202203261214.DGCMTIyM-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1343021252220996485==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-arm-kernel(a)lists.infradead.org
TO: Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>
CC: Michal Simek <monstr@monstr.eu>

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.15_LTS
head:   1870e0fa79a9d58c6748c34550f3ccea0b515933
commit: e5219f94d0c1bb784c28acf47d5aec8860f079d6 [977/1029] mtd: spi-nor: A=
void updating the flash_info struct in dual and stacked modes
:::::: branch date: 2 days ago
:::::: commit date: 2 weeks ago
config: nios2-randconfig-m031-20220324 (https://download.01.org/0day-ci/arc=
hive/20220326/202203261214.DGCMTIyM-lkp(a)intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/mtd/spi-nor/swp.c:55 spi_nor_get_min_prot_length_sr() warn: should =
'sector_size << (bp_slots_needed - bp_slots)' be a 64 bit type?

vim +55 drivers/mtd/spi-nor/swp.c

c4c795105f2924c Tudor Ambarus        2021-03-22  35  =

c4c795105f2924c Tudor Ambarus        2021-03-22  36  static u64 spi_nor_get=
_min_prot_length_sr(struct spi_nor *nor)
c4c795105f2924c Tudor Ambarus        2021-03-22  37  {
c4c795105f2924c Tudor Ambarus        2021-03-22  38  	unsigned int bp_slots=
, bp_slots_needed;
c4c795105f2924c Tudor Ambarus        2021-03-22  39  	u8 mask =3D spi_nor_g=
et_sr_bp_mask(nor);
e5219f94d0c1bb7 Sai Krishna Potthuri 2022-03-08  40  	u32 n_sectors =3D nor=
->info->n_sectors;
e5219f94d0c1bb7 Sai Krishna Potthuri 2022-03-08  41  	u32 sector_size =3D n=
or->info->sector_size;
e5219f94d0c1bb7 Sai Krishna Potthuri 2022-03-08  42  =

e5219f94d0c1bb7 Sai Krishna Potthuri 2022-03-08  43  	if (nor->isstacked)
e5219f94d0c1bb7 Sai Krishna Potthuri 2022-03-08  44  		n_sectors <<=3D 1;
e5219f94d0c1bb7 Sai Krishna Potthuri 2022-03-08  45  =

e5219f94d0c1bb7 Sai Krishna Potthuri 2022-03-08  46  	if (nor->isparallel)
e5219f94d0c1bb7 Sai Krishna Potthuri 2022-03-08  47  		sector_size <<=3D 1;
c4c795105f2924c Tudor Ambarus        2021-03-22  48  =

c4c795105f2924c Tudor Ambarus        2021-03-22  49  	/* Reserved one for "=
protect none" and one for "protect all". */
c4c795105f2924c Tudor Ambarus        2021-03-22  50  	bp_slots =3D (1 << hw=
eight8(mask)) - 2;
e5219f94d0c1bb7 Sai Krishna Potthuri 2022-03-08  51  	bp_slots_needed =3D i=
log2(n_sectors);
c4c795105f2924c Tudor Ambarus        2021-03-22  52  =

c4c795105f2924c Tudor Ambarus        2021-03-22  53  	if (bp_slots_needed >=
 bp_slots)
e5219f94d0c1bb7 Sai Krishna Potthuri 2022-03-08  54  		return sector_size <<
c4c795105f2924c Tudor Ambarus        2021-03-22 @55  			(bp_slots_needed - =
bp_slots);
c4c795105f2924c Tudor Ambarus        2021-03-22  56  	else
e5219f94d0c1bb7 Sai Krishna Potthuri 2022-03-08  57  		return sector_size;
c4c795105f2924c Tudor Ambarus        2021-03-22  58  }
c4c795105f2924c Tudor Ambarus        2021-03-22  59  =


:::::: The code@line 55 was first introduced by commit
:::::: c4c795105f2924c80752c30ffd3c7029a8e0ef28 mtd: spi-nor: Move Software=
 Write Protection logic out of the core

:::::: TO: Tudor Ambarus <tudor.ambarus@microchip.com>
:::::: CC: Tudor Ambarus <tudor.ambarus@microchip.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1343021252220996485==--

