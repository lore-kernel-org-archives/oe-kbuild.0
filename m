Content-Type: multipart/mixed; boundary="===============7013623060678723018=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/cxl/core/port.c:748 cxl_decoder_add_locked() warn: passing zero to 'PTR_ERR'
Date: Mon, 13 Jun 2022 04:36:36 +0800
Message-ID: <202206130455.EAe0gkw6-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7013623060678723018==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Dan Williams <dan.j.williams@intel.com>
CC: Ben Widawsky <ben.widawsky@intel.com>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   7a68065eb9cd194cf03f135c9211eeb2d5c4c0a0
commit: d17d0540a0dbf109210f7b57a37571e2978da0fa cxl/core/hdm: Add CXL stan=
dard decoder enumeration to the core
date:   4 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 4 months ago
config: powerpc64-randconfig-m031-20220611 (https://download.01.org/0day-ci=
/archive/20220613/202206130455.EAe0gkw6-lkp(a)intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/cxl/core/port.c:748 cxl_decoder_add_locked() warn: passing zero to =
'PTR_ERR'

Old smatch warnings:
drivers/cxl/core/port.c:796 cxl_decoder_add() warn: passing zero to 'PTR_ER=
R'

vim +/PTR_ERR +748 drivers/cxl/core/port.c

d54c1bbe2d34e3 drivers/cxl/core/port.c Ben Widawsky 2022-01-31  718  =

d54c1bbe2d34e3 drivers/cxl/core/port.c Ben Widawsky 2022-01-31  719  /**
d17d0540a0dbf1 drivers/cxl/core/port.c Dan Williams 2022-02-01  720   * cxl=
_decoder_add_locked - Add a decoder with targets
d54c1bbe2d34e3 drivers/cxl/core/port.c Ben Widawsky 2022-01-31  721   * @cx=
ld: The cxl decoder allocated by cxl_decoder_alloc()
d54c1bbe2d34e3 drivers/cxl/core/port.c Ben Widawsky 2022-01-31  722   * @ta=
rget_map: A list of downstream ports that this decoder can direct memory
d54c1bbe2d34e3 drivers/cxl/core/port.c Ben Widawsky 2022-01-31  723   *    =
          traffic to. These numbers should correspond with the port number
d54c1bbe2d34e3 drivers/cxl/core/port.c Ben Widawsky 2022-01-31  724   *    =
          in the PCIe Link Capabilities structure.
d54c1bbe2d34e3 drivers/cxl/core/port.c Ben Widawsky 2022-01-31  725   *
d54c1bbe2d34e3 drivers/cxl/core/port.c Ben Widawsky 2022-01-31  726   * Cer=
tain types of decoders may not have any targets. The main example of this
d54c1bbe2d34e3 drivers/cxl/core/port.c Ben Widawsky 2022-01-31  727   * is =
an endpoint device. A more awkward example is a hostbridge whose root
d54c1bbe2d34e3 drivers/cxl/core/port.c Ben Widawsky 2022-01-31  728   * por=
ts get hot added (technically possible, though unlikely).
d54c1bbe2d34e3 drivers/cxl/core/port.c Ben Widawsky 2022-01-31  729   *
d17d0540a0dbf1 drivers/cxl/core/port.c Dan Williams 2022-02-01  730   * Thi=
s is the locked variant of cxl_decoder_add().
d17d0540a0dbf1 drivers/cxl/core/port.c Dan Williams 2022-02-01  731   *
d17d0540a0dbf1 drivers/cxl/core/port.c Dan Williams 2022-02-01  732   * Con=
text: Process context. Expects the device lock of the port that owns the
d17d0540a0dbf1 drivers/cxl/core/port.c Dan Williams 2022-02-01  733   *	   =
 @cxld to be held.
d54c1bbe2d34e3 drivers/cxl/core/port.c Ben Widawsky 2022-01-31  734   *
d54c1bbe2d34e3 drivers/cxl/core/port.c Ben Widawsky 2022-01-31  735   * Ret=
urn: Negative error code if the decoder wasn't properly configured; else
d54c1bbe2d34e3 drivers/cxl/core/port.c Ben Widawsky 2022-01-31  736   *	   =
returns 0.
d54c1bbe2d34e3 drivers/cxl/core/port.c Ben Widawsky 2022-01-31  737   */
d17d0540a0dbf1 drivers/cxl/core/port.c Dan Williams 2022-02-01  738  int cx=
l_decoder_add_locked(struct cxl_decoder *cxld, int *target_map)
40ba17afdfabb0 drivers/cxl/core.c      Dan Williams 2021-06-09  739  {
48667f676189ec drivers/cxl/core/bus.c  Dan Williams 2021-09-21  740  	struc=
t cxl_port *port;
40ba17afdfabb0 drivers/cxl/core.c      Dan Williams 2021-06-09  741  	struc=
t device *dev;
40ba17afdfabb0 drivers/cxl/core.c      Dan Williams 2021-06-09  742  	int r=
c;
40ba17afdfabb0 drivers/cxl/core.c      Dan Williams 2021-06-09  743  =

48667f676189ec drivers/cxl/core/bus.c  Dan Williams 2021-09-21  744  	if (W=
ARN_ON_ONCE(!cxld))
48667f676189ec drivers/cxl/core/bus.c  Dan Williams 2021-09-21  745  		retu=
rn -EINVAL;
a5c25802168993 drivers/cxl/core/bus.c  Dan Williams 2021-09-08  746  =

48667f676189ec drivers/cxl/core/bus.c  Dan Williams 2021-09-21  747  	if (W=
ARN_ON_ONCE(IS_ERR(cxld)))
48667f676189ec drivers/cxl/core/bus.c  Dan Williams 2021-09-21 @748  		retu=
rn PTR_ERR(cxld);
40ba17afdfabb0 drivers/cxl/core.c      Dan Williams 2021-06-09  749  =

48667f676189ec drivers/cxl/core/bus.c  Dan Williams 2021-09-21  750  	if (c=
xld->interleave_ways < 1)
48667f676189ec drivers/cxl/core/bus.c  Dan Williams 2021-09-21  751  		retu=
rn -EINVAL;
40ba17afdfabb0 drivers/cxl/core.c      Dan Williams 2021-06-09  752  =

48667f676189ec drivers/cxl/core/bus.c  Dan Williams 2021-09-21  753  	port =
=3D to_cxl_port(cxld->dev.parent);
48667f676189ec drivers/cxl/core/bus.c  Dan Williams 2021-09-21  754  	rc =
=3D decoder_populate_targets(cxld, port, target_map);
40ba17afdfabb0 drivers/cxl/core.c      Dan Williams 2021-06-09  755  	if (r=
c)
48667f676189ec drivers/cxl/core/bus.c  Dan Williams 2021-09-21  756  		retu=
rn rc;
40ba17afdfabb0 drivers/cxl/core.c      Dan Williams 2021-06-09  757  =

48667f676189ec drivers/cxl/core/bus.c  Dan Williams 2021-09-21  758  	dev =
=3D &cxld->dev;
48667f676189ec drivers/cxl/core/bus.c  Dan Williams 2021-09-21  759  	rc =
=3D dev_set_name(dev, "decoder%d.%d", port->id, cxld->id);
40ba17afdfabb0 drivers/cxl/core.c      Dan Williams 2021-06-09  760  	if (r=
c)
48667f676189ec drivers/cxl/core/bus.c  Dan Williams 2021-09-21  761  		retu=
rn rc;
40ba17afdfabb0 drivers/cxl/core.c      Dan Williams 2021-06-09  762  =

608135db1b7901 drivers/cxl/core/port.c Ben Widawsky 2022-01-23  763  	/*
608135db1b7901 drivers/cxl/core/port.c Ben Widawsky 2022-01-23  764  	 * Pl=
atform decoder resources should show up with a reasonable name. All
608135db1b7901 drivers/cxl/core/port.c Ben Widawsky 2022-01-23  765  	 * ot=
her resources are just sub ranges within the main decoder resource.
608135db1b7901 drivers/cxl/core/port.c Ben Widawsky 2022-01-23  766  	 */
608135db1b7901 drivers/cxl/core/port.c Ben Widawsky 2022-01-23  767  	if (i=
s_root_decoder(dev))
608135db1b7901 drivers/cxl/core/port.c Ben Widawsky 2022-01-23  768  		cxld=
->platform_res.name =3D dev_name(dev);
608135db1b7901 drivers/cxl/core/port.c Ben Widawsky 2022-01-23  769  =

48667f676189ec drivers/cxl/core/bus.c  Dan Williams 2021-09-21  770  	retur=
n device_add(dev);
40ba17afdfabb0 drivers/cxl/core.c      Dan Williams 2021-06-09  771  }
d17d0540a0dbf1 drivers/cxl/core/port.c Dan Williams 2022-02-01  772  EXPORT=
_SYMBOL_NS_GPL(cxl_decoder_add_locked, CXL);
d17d0540a0dbf1 drivers/cxl/core/port.c Dan Williams 2022-02-01  773  =


:::::: The code at line 748 was first introduced by commit
:::::: 48667f676189eccfe9b7ac3a31772d55d6da40e5 cxl/core: Split decoder set=
up into alloc + add

:::::: TO: Dan Williams <dan.j.williams@intel.com>
:::::: CC: Dan Williams <dan.j.williams@intel.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7013623060678723018==--

