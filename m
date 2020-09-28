Content-Type: multipart/mixed; boundary="===============3678539182379826562=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/mtd/spi-nor/sfdp.c:699:24: warning: Boolean result is used in bitwise operation. Clarify expression with parentheses.
Date: Tue, 29 Sep 2020 00:51:20 +0800
Message-ID: <202009290016.FcidJ6YN%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3678539182379826562==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Tudor Ambarus <tudor.ambarus@microchip.com>
CC: Boris Brezillon <bbrezillon@kernel.org>
CC: Vignesh Raghavendra <vigneshr@ti.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   a1b8638ba1320e6684aa98233c15255eb803fac7
commit: cb481b92d10fdb0027c7f96576b640c28a5e4179 mtd: spi-nor: Move SFDP lo=
gic out of the core
date:   7 months ago
:::::: branch date: 19 hours ago
:::::: commit date: 7 months ago
compiler: hppa-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> drivers/mtd/spi-nor/sfdp.c:699:24: warning: Boolean result is used in bi=
twise operation. Clarify expression with parentheses. [clarifyCondition]
     map_id =3D map_id << 1 | !!(*buf & read_data_mask);
                          ^

vim +699 drivers/mtd/spi-nor/sfdp.c

cb481b92d10fdb0 Tudor Ambarus 2020-03-13  648  =

cb481b92d10fdb0 Tudor Ambarus 2020-03-13  649  /**
cb481b92d10fdb0 Tudor Ambarus 2020-03-13  650   * spi_nor_get_map_in_use() =
- get the configuration map in use
cb481b92d10fdb0 Tudor Ambarus 2020-03-13  651   * @nor:	pointer to a 'struc=
t spi_nor'
cb481b92d10fdb0 Tudor Ambarus 2020-03-13  652   * @smpt:	pointer to the sec=
tor map parameter table
cb481b92d10fdb0 Tudor Ambarus 2020-03-13  653   * @smpt_len:	sector map par=
ameter table length
cb481b92d10fdb0 Tudor Ambarus 2020-03-13  654   *
cb481b92d10fdb0 Tudor Ambarus 2020-03-13  655   * Return: pointer to the ma=
p in use, ERR_PTR(-errno) otherwise.
cb481b92d10fdb0 Tudor Ambarus 2020-03-13  656   */
cb481b92d10fdb0 Tudor Ambarus 2020-03-13  657  static const u32 *spi_nor_ge=
t_map_in_use(struct spi_nor *nor, const u32 *smpt,
cb481b92d10fdb0 Tudor Ambarus 2020-03-13  658  					 u8 smpt_len)
cb481b92d10fdb0 Tudor Ambarus 2020-03-13  659  {
cb481b92d10fdb0 Tudor Ambarus 2020-03-13  660  	const u32 *ret;
cb481b92d10fdb0 Tudor Ambarus 2020-03-13  661  	u8 *buf;
cb481b92d10fdb0 Tudor Ambarus 2020-03-13  662  	u32 addr;
cb481b92d10fdb0 Tudor Ambarus 2020-03-13  663  	int err;
cb481b92d10fdb0 Tudor Ambarus 2020-03-13  664  	u8 i;
cb481b92d10fdb0 Tudor Ambarus 2020-03-13  665  	u8 addr_width, read_opcode,=
 read_dummy;
cb481b92d10fdb0 Tudor Ambarus 2020-03-13  666  	u8 read_data_mask, map_id;
cb481b92d10fdb0 Tudor Ambarus 2020-03-13  667  =

cb481b92d10fdb0 Tudor Ambarus 2020-03-13  668  	/* Use a kmalloc'ed bounce =
buffer to guarantee it is DMA-able. */
cb481b92d10fdb0 Tudor Ambarus 2020-03-13  669  	buf =3D kmalloc(sizeof(*buf=
), GFP_KERNEL);
cb481b92d10fdb0 Tudor Ambarus 2020-03-13  670  	if (!buf)
cb481b92d10fdb0 Tudor Ambarus 2020-03-13  671  		return ERR_PTR(-ENOMEM);
cb481b92d10fdb0 Tudor Ambarus 2020-03-13  672  =

cb481b92d10fdb0 Tudor Ambarus 2020-03-13  673  	addr_width =3D nor->addr_wi=
dth;
cb481b92d10fdb0 Tudor Ambarus 2020-03-13  674  	read_dummy =3D nor->read_du=
mmy;
cb481b92d10fdb0 Tudor Ambarus 2020-03-13  675  	read_opcode =3D nor->read_o=
pcode;
cb481b92d10fdb0 Tudor Ambarus 2020-03-13  676  =

cb481b92d10fdb0 Tudor Ambarus 2020-03-13  677  	map_id =3D 0;
cb481b92d10fdb0 Tudor Ambarus 2020-03-13  678  	/* Determine if there are a=
ny optional Detection Command Descriptors */
cb481b92d10fdb0 Tudor Ambarus 2020-03-13  679  	for (i =3D 0; i < smpt_len;=
 i +=3D 2) {
cb481b92d10fdb0 Tudor Ambarus 2020-03-13  680  		if (smpt[i] & SMPT_DESC_TY=
PE_MAP)
cb481b92d10fdb0 Tudor Ambarus 2020-03-13  681  			break;
cb481b92d10fdb0 Tudor Ambarus 2020-03-13  682  =

cb481b92d10fdb0 Tudor Ambarus 2020-03-13  683  		read_data_mask =3D SMPT_CM=
D_READ_DATA(smpt[i]);
cb481b92d10fdb0 Tudor Ambarus 2020-03-13  684  		nor->addr_width =3D spi_no=
r_smpt_addr_width(nor, smpt[i]);
cb481b92d10fdb0 Tudor Ambarus 2020-03-13  685  		nor->read_dummy =3D spi_no=
r_smpt_read_dummy(nor, smpt[i]);
cb481b92d10fdb0 Tudor Ambarus 2020-03-13  686  		nor->read_opcode =3D SMPT_=
CMD_OPCODE(smpt[i]);
cb481b92d10fdb0 Tudor Ambarus 2020-03-13  687  		addr =3D smpt[i + 1];
cb481b92d10fdb0 Tudor Ambarus 2020-03-13  688  =

cb481b92d10fdb0 Tudor Ambarus 2020-03-13  689  		err =3D spi_nor_read_raw(n=
or, addr, 1, buf);
cb481b92d10fdb0 Tudor Ambarus 2020-03-13  690  		if (err) {
cb481b92d10fdb0 Tudor Ambarus 2020-03-13  691  			ret =3D ERR_PTR(err);
cb481b92d10fdb0 Tudor Ambarus 2020-03-13  692  			goto out;
cb481b92d10fdb0 Tudor Ambarus 2020-03-13  693  		}
cb481b92d10fdb0 Tudor Ambarus 2020-03-13  694  =

cb481b92d10fdb0 Tudor Ambarus 2020-03-13  695  		/*
cb481b92d10fdb0 Tudor Ambarus 2020-03-13  696  		 * Build an index value th=
at is used to select the Sector Map
cb481b92d10fdb0 Tudor Ambarus 2020-03-13  697  		 * Configuration that is c=
urrently in use.
cb481b92d10fdb0 Tudor Ambarus 2020-03-13  698  		 */
cb481b92d10fdb0 Tudor Ambarus 2020-03-13 @699  		map_id =3D map_id << 1 | !=
!(*buf & read_data_mask);
cb481b92d10fdb0 Tudor Ambarus 2020-03-13  700  	}
cb481b92d10fdb0 Tudor Ambarus 2020-03-13  701  =

cb481b92d10fdb0 Tudor Ambarus 2020-03-13  702  	/*
cb481b92d10fdb0 Tudor Ambarus 2020-03-13  703  	 * If command descriptors a=
re provided, they always precede map
cb481b92d10fdb0 Tudor Ambarus 2020-03-13  704  	 * descriptors in the table=
. There is no need to start the iteration
cb481b92d10fdb0 Tudor Ambarus 2020-03-13  705  	 * over smpt array all over=
 again.
cb481b92d10fdb0 Tudor Ambarus 2020-03-13  706  	 *
cb481b92d10fdb0 Tudor Ambarus 2020-03-13  707  	 * Find the matching config=
uration map.
cb481b92d10fdb0 Tudor Ambarus 2020-03-13  708  	 */
cb481b92d10fdb0 Tudor Ambarus 2020-03-13  709  	ret =3D ERR_PTR(-EINVAL);
cb481b92d10fdb0 Tudor Ambarus 2020-03-13  710  	while (i < smpt_len) {
cb481b92d10fdb0 Tudor Ambarus 2020-03-13  711  		if (SMPT_MAP_ID(smpt[i]) =
=3D=3D map_id) {
cb481b92d10fdb0 Tudor Ambarus 2020-03-13  712  			ret =3D smpt + i;
cb481b92d10fdb0 Tudor Ambarus 2020-03-13  713  			break;
cb481b92d10fdb0 Tudor Ambarus 2020-03-13  714  		}
cb481b92d10fdb0 Tudor Ambarus 2020-03-13  715  =

cb481b92d10fdb0 Tudor Ambarus 2020-03-13  716  		/*
cb481b92d10fdb0 Tudor Ambarus 2020-03-13  717  		 * If there are no more co=
nfiguration map descriptors and no
cb481b92d10fdb0 Tudor Ambarus 2020-03-13  718  		 * configuration ID matche=
d the configuration identifier, the
cb481b92d10fdb0 Tudor Ambarus 2020-03-13  719  		 * sector address map is u=
nknown.
cb481b92d10fdb0 Tudor Ambarus 2020-03-13  720  		 */
cb481b92d10fdb0 Tudor Ambarus 2020-03-13  721  		if (smpt[i] & SMPT_DESC_EN=
D)
cb481b92d10fdb0 Tudor Ambarus 2020-03-13  722  			break;
cb481b92d10fdb0 Tudor Ambarus 2020-03-13  723  =

cb481b92d10fdb0 Tudor Ambarus 2020-03-13  724  		/* increment the table ind=
ex to the next map */
cb481b92d10fdb0 Tudor Ambarus 2020-03-13  725  		i +=3D SMPT_MAP_REGION_COU=
NT(smpt[i]) + 1;
cb481b92d10fdb0 Tudor Ambarus 2020-03-13  726  	}
cb481b92d10fdb0 Tudor Ambarus 2020-03-13  727  =

cb481b92d10fdb0 Tudor Ambarus 2020-03-13  728  	/* fall through */
cb481b92d10fdb0 Tudor Ambarus 2020-03-13  729  out:
cb481b92d10fdb0 Tudor Ambarus 2020-03-13  730  	kfree(buf);
cb481b92d10fdb0 Tudor Ambarus 2020-03-13  731  	nor->addr_width =3D addr_wi=
dth;
cb481b92d10fdb0 Tudor Ambarus 2020-03-13  732  	nor->read_dummy =3D read_du=
mmy;
cb481b92d10fdb0 Tudor Ambarus 2020-03-13  733  	nor->read_opcode =3D read_o=
pcode;
cb481b92d10fdb0 Tudor Ambarus 2020-03-13  734  	return ret;
cb481b92d10fdb0 Tudor Ambarus 2020-03-13  735  }
cb481b92d10fdb0 Tudor Ambarus 2020-03-13  736  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3678539182379826562==--

