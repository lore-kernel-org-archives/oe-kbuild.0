Content-Type: multipart/mixed; boundary="===============7449270541178290782=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/irqchip/irq-gic-v3.c:866:71: warning: Boolean result is used in bitwise operation. Clarify expression with parentheses.
Date: Fri, 02 Oct 2020 10:09:43 +0800
Message-ID: <202010021040.5M2TELMz-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7449270541178290782==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Marc Zyngier <maz@kernel.org>
CC: Zenghui Yu <yuzenghui@huawei.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   60e720931556fc1034d0981460164dcf02697679
commit: b25319d279b63781b972c4966b4082193e69afac irqchip/gic-v3: Detect GIC=
v4.1 supporting RVPEID
date:   8 months ago
:::::: branch date: 29 hours ago
:::::: commit date: 8 months ago
compiler: aarch64-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


vim +866 drivers/irqchip/irq-gic-v3.c

021f653791ad17e Marc Zyngier 2014-06-30  856  =

1a60e1e6439164c Marc Zyngier 2019-07-18  857  static int __gic_update_rdist=
_properties(struct redist_region *region,
0edc23ea2692fe7 Marc Zyngier 2016-12-19  858  					 void __iomem *ptr)
0edc23ea2692fe7 Marc Zyngier 2016-12-19  859  {
0edc23ea2692fe7 Marc Zyngier 2016-12-19  860  	u64 typer =3D gic_read_typer=
(ptr + GICR_TYPER);
b25319d279b6378 Marc Zyngier 2019-12-24  861  =

0edc23ea2692fe7 Marc Zyngier 2016-12-19  862  	gic_data.rdists.has_vlpis &=
=3D !!(typer & GICR_TYPER_VLPIS);
b25319d279b6378 Marc Zyngier 2019-12-24  863  =

b25319d279b6378 Marc Zyngier 2019-12-24  864  	/* RVPEID implies some form =
of DirectLPI, no matter what the doc says... :-/ */
b25319d279b6378 Marc Zyngier 2019-12-24  865  	gic_data.rdists.has_rvpeid &=
=3D !!(typer & GICR_TYPER_RVPEID);
b25319d279b6378 Marc Zyngier 2019-12-24 @866  	gic_data.rdists.has_direct_l=
pi &=3D (!!(typer & GICR_TYPER_DirectLPIS) |
b25319d279b6378 Marc Zyngier 2019-12-24  867  					   gic_data.rdists.has_r=
vpeid);
b25319d279b6378 Marc Zyngier 2019-12-24  868  =

b25319d279b6378 Marc Zyngier 2019-12-24  869  	/* Detect non-sensical confi=
gurations */
b25319d279b6378 Marc Zyngier 2019-12-24  870  	if (WARN_ON_ONCE(gic_data.rd=
ists.has_rvpeid && !gic_data.rdists.has_vlpis)) {
b25319d279b6378 Marc Zyngier 2019-12-24  871  		gic_data.rdists.has_direct_=
lpi =3D false;
b25319d279b6378 Marc Zyngier 2019-12-24  872  		gic_data.rdists.has_vlpis =
=3D false;
b25319d279b6378 Marc Zyngier 2019-12-24  873  		gic_data.rdists.has_rvpeid =
=3D false;
b25319d279b6378 Marc Zyngier 2019-12-24  874  	}
b25319d279b6378 Marc Zyngier 2019-12-24  875  =

5f51f803826e4f4 Marc Zyngier 2019-07-18  876  	gic_data.ppi_nr =3D min(GICR=
_TYPER_NR_PPIS(typer), gic_data.ppi_nr);
0edc23ea2692fe7 Marc Zyngier 2016-12-19  877  =

0edc23ea2692fe7 Marc Zyngier 2016-12-19  878  	return 1;
0edc23ea2692fe7 Marc Zyngier 2016-12-19  879  }
0edc23ea2692fe7 Marc Zyngier 2016-12-19  880  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7449270541178290782==--

