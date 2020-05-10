Content-Type: multipart/mixed; boundary="===============5318921190994333447=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: drivers/iommu/ipmmu-vmsa.c:736:1-7: ERROR: missing put_device; call of_find_device_by_node on line 730, but without a corresponding object release within this function.
Date: Mon, 11 May 2020 01:45:26 +0800
Message-ID: <202005110120.xNXZYrKa%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5318921190994333447==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Joerg Roedel <jroedel@suse.de>
CC: "Jean-Philippe Brucker" <jean-philippe@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   e99332e7b4cda6e60f5b5916cf9943a79dbef902
commit: be568d6d5a5bebfcfe8789ee9560d0acf1b30d51 iommu/renesas: Use accesso=
r functions for iommu private data
date:   6 weeks ago
:::::: branch date: 17 hours ago
:::::: commit date: 6 weeks ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


coccinelle warnings: (new ones prefixed by >>)

>> drivers/iommu/ipmmu-vmsa.c:736:1-7: ERROR: missing put_device; call of_f=
ind_device_by_node on line 730, but without a corresponding object release =
within this function.

# https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3Dbe568d6d5a5bebfcfe8789ee9560d0acf1b30d51
git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torval=
ds/linux.git
git remote update linus
git checkout be568d6d5a5bebfcfe8789ee9560d0acf1b30d51
vim +736 drivers/iommu/ipmmu-vmsa.c

d25a2a16f0889d Laurent Pinchart 2014-04-02  724  =

7b2d59611fef21 Magnus Damm      2017-07-17  725  static int ipmmu_init_plat=
form_device(struct device *dev,
7b2d59611fef21 Magnus Damm      2017-07-17  726  				      struct of_phandl=
e_args *args)
d25a2a16f0889d Laurent Pinchart 2014-04-02  727  {
7b2d59611fef21 Magnus Damm      2017-07-17  728  	struct platform_device *i=
pmmu_pdev;
bb590c9011a7c4 Laurent Pinchart 2015-01-24  729  =

7b2d59611fef21 Magnus Damm      2017-07-17 @730  	ipmmu_pdev =3D of_find_de=
vice_by_node(args->np);
7b2d59611fef21 Magnus Damm      2017-07-17  731  	if (!ipmmu_pdev)
bb590c9011a7c4 Laurent Pinchart 2015-01-24  732  		return -ENODEV;
bb590c9011a7c4 Laurent Pinchart 2015-01-24  733  =

be568d6d5a5beb Joerg Roedel     2020-03-26  734  	dev_iommu_priv_set(dev, p=
latform_get_drvdata(ipmmu_pdev));
383fef5f4b56d8 Magnus Damm      2017-05-17  735  =

383fef5f4b56d8 Magnus Damm      2017-05-17 @736  	return 0;
58b8e8bf409236 Magnus Damm      2017-10-16  737  }
58b8e8bf409236 Magnus Damm      2017-10-16  738  =


:::::: The code at line 736 was first introduced by commit
:::::: 383fef5f4b56d8dc05cac12dc04262c8175331b1 iommu/ipmmu-vmsa: Break out=
 utlb parsing code

:::::: TO: Magnus Damm <damm+renesas@opensource.se>
:::::: CC: Joerg Roedel <jroedel@suse.de>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5318921190994333447==--

