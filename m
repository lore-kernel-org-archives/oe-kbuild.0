Content-Type: multipart/mixed; boundary="===============0965673924533433594=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/cxl/core/port.c:534 cxl_decoder_add() warn: passing zero to 'PTR_ERR'
Date: Sat, 26 Mar 2022 06:44:24 +0800
Message-ID: <202203260646.jZISqR2k-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0965673924533433594==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Dan Williams <dan.j.williams@intel.com>
CC: Ben Widawsky <ben.widawsky@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   aa5b537b0ecc16992577b013f11112d54c7ce869
commit: 0ff0af18216436d0151af4e410400c7a19ca9437 cxl/core/port: Rename bus.=
c to port.c
date:   6 weeks ago
:::::: branch date: 5 hours ago
:::::: commit date: 6 weeks ago
config: powerpc64-randconfig-m031-20220325 (https://download.01.org/0day-ci=
/archive/20220326/202203260646.jZISqR2k-lkp(a)intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/cxl/core/port.c:534 cxl_decoder_add() warn: passing zero to 'PTR_ER=
R'

vim +/PTR_ERR +534 drivers/cxl/core/port.c

40ba17afdfabb01 drivers/cxl/core.c     Dan Williams 2021-06-09  523  =

48667f676189ecc drivers/cxl/core/bus.c Dan Williams 2021-09-21  524  int cx=
l_decoder_add(struct cxl_decoder *cxld, int *target_map)
40ba17afdfabb01 drivers/cxl/core.c     Dan Williams 2021-06-09  525  {
48667f676189ecc drivers/cxl/core/bus.c Dan Williams 2021-09-21  526  	struc=
t cxl_port *port;
40ba17afdfabb01 drivers/cxl/core.c     Dan Williams 2021-06-09  527  	struc=
t device *dev;
40ba17afdfabb01 drivers/cxl/core.c     Dan Williams 2021-06-09  528  	int r=
c;
40ba17afdfabb01 drivers/cxl/core.c     Dan Williams 2021-06-09  529  =

48667f676189ecc drivers/cxl/core/bus.c Dan Williams 2021-09-21  530  	if (W=
ARN_ON_ONCE(!cxld))
48667f676189ecc drivers/cxl/core/bus.c Dan Williams 2021-09-21  531  		retu=
rn -EINVAL;
a5c25802168993c drivers/cxl/core/bus.c Dan Williams 2021-09-08  532  =

48667f676189ecc drivers/cxl/core/bus.c Dan Williams 2021-09-21  533  	if (W=
ARN_ON_ONCE(IS_ERR(cxld)))
48667f676189ecc drivers/cxl/core/bus.c Dan Williams 2021-09-21 @534  		retu=
rn PTR_ERR(cxld);
40ba17afdfabb01 drivers/cxl/core.c     Dan Williams 2021-06-09  535  =

48667f676189ecc drivers/cxl/core/bus.c Dan Williams 2021-09-21  536  	if (c=
xld->interleave_ways < 1)
48667f676189ecc drivers/cxl/core/bus.c Dan Williams 2021-09-21  537  		retu=
rn -EINVAL;
40ba17afdfabb01 drivers/cxl/core.c     Dan Williams 2021-06-09  538  =

48667f676189ecc drivers/cxl/core/bus.c Dan Williams 2021-09-21  539  	port =
=3D to_cxl_port(cxld->dev.parent);
48667f676189ecc drivers/cxl/core/bus.c Dan Williams 2021-09-21  540  	rc =
=3D decoder_populate_targets(cxld, port, target_map);
40ba17afdfabb01 drivers/cxl/core.c     Dan Williams 2021-06-09  541  	if (r=
c)
48667f676189ecc drivers/cxl/core/bus.c Dan Williams 2021-09-21  542  		retu=
rn rc;
40ba17afdfabb01 drivers/cxl/core.c     Dan Williams 2021-06-09  543  =

48667f676189ecc drivers/cxl/core/bus.c Dan Williams 2021-09-21  544  	dev =
=3D &cxld->dev;
48667f676189ecc drivers/cxl/core/bus.c Dan Williams 2021-09-21  545  	rc =
=3D dev_set_name(dev, "decoder%d.%d", port->id, cxld->id);
40ba17afdfabb01 drivers/cxl/core.c     Dan Williams 2021-06-09  546  	if (r=
c)
48667f676189ecc drivers/cxl/core/bus.c Dan Williams 2021-09-21  547  		retu=
rn rc;
40ba17afdfabb01 drivers/cxl/core.c     Dan Williams 2021-06-09  548  =

48667f676189ecc drivers/cxl/core/bus.c Dan Williams 2021-09-21  549  	retur=
n device_add(dev);
40ba17afdfabb01 drivers/cxl/core.c     Dan Williams 2021-06-09  550  }
affec782742e08a drivers/cxl/core/bus.c Dan Williams 2021-11-12  551  EXPORT=
_SYMBOL_NS_GPL(cxl_decoder_add, CXL);
40ba17afdfabb01 drivers/cxl/core.c     Dan Williams 2021-06-09  552  =


:::::: The code at line 534 was first introduced by commit
:::::: 48667f676189eccfe9b7ac3a31772d55d6da40e5 cxl/core: Split decoder set=
up into alloc + add

:::::: TO: Dan Williams <dan.j.williams@intel.com>
:::::: CC: Dan Williams <dan.j.williams@intel.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0965673924533433594==--

