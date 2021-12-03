Content-Type: multipart/mixed; boundary="===============6070431373790828830=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/phy/xilinx/phy-zynqmp.c:941 xpsgtr_get_ref_clocks() warn: 'clk' not released on lines: 941.
Date: Fri, 03 Dec 2021 09:42:33 +0800
Message-ID: <202112030907.dMJz5t75-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6070431373790828830==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Manish Narani <manish.narani@xilinx.com>
CC: Vinod Koul <vkoul@kernel.org>
CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   5f58da2befa58edf3a70b91ed87ed9bf77f1e70e
commit: 67097754afc90a5def9d54c599d0862fe992f5a0 phy: zynqmp: Handle the cl=
ock enable/disable properly
date:   8 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 8 months ago
config: nios2-randconfig-m031-20211202 (https://download.01.org/0day-ci/arc=
hive/20211203/202112030907.dMJz5t75-lkp(a)intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/phy/xilinx/phy-zynqmp.c:941 xpsgtr_get_ref_clocks() warn: 'clk' not=
 released on lines: 941.

vim +/clk +941 drivers/phy/xilinx/phy-zynqmp.c

4a33bea003144e Anurag Kumar Vulisha 2020-06-29  879  =

4a33bea003144e Anurag Kumar Vulisha 2020-06-29  880  /*
4a33bea003144e Anurag Kumar Vulisha 2020-06-29  881   * Probe & Platform Dr=
iver
4a33bea003144e Anurag Kumar Vulisha 2020-06-29  882   */
4a33bea003144e Anurag Kumar Vulisha 2020-06-29  883  =

4a33bea003144e Anurag Kumar Vulisha 2020-06-29  884  static int xpsgtr_get_=
ref_clocks(struct xpsgtr_dev *gtr_dev)
4a33bea003144e Anurag Kumar Vulisha 2020-06-29  885  {
4a33bea003144e Anurag Kumar Vulisha 2020-06-29  886  	unsigned int refclk;
67097754afc90a Manish Narani        2021-03-24  887  	int ret;
4a33bea003144e Anurag Kumar Vulisha 2020-06-29  888  =

4a33bea003144e Anurag Kumar Vulisha 2020-06-29  889  	for (refclk =3D 0; re=
fclk < ARRAY_SIZE(gtr_dev->refclk_sscs); ++refclk) {
4a33bea003144e Anurag Kumar Vulisha 2020-06-29  890  		unsigned long rate;
4a33bea003144e Anurag Kumar Vulisha 2020-06-29  891  		unsigned int i;
4a33bea003144e Anurag Kumar Vulisha 2020-06-29  892  		struct clk *clk;
4a33bea003144e Anurag Kumar Vulisha 2020-06-29  893  		char name[8];
4a33bea003144e Anurag Kumar Vulisha 2020-06-29  894  =

4a33bea003144e Anurag Kumar Vulisha 2020-06-29  895  		snprintf(name, sizeo=
f(name), "ref%u", refclk);
4a33bea003144e Anurag Kumar Vulisha 2020-06-29  896  		clk =3D devm_clk_get=
_optional(gtr_dev->dev, name);
67097754afc90a Manish Narani        2021-03-24  897  		if (IS_ERR(clk)) {
67097754afc90a Manish Narani        2021-03-24  898  			ret =3D dev_err_pro=
be(gtr_dev->dev, PTR_ERR(clk),
3dbbc8e97cb267 Michal Simek         2021-02-04  899  					    "Failed to ge=
t reference clock %u\n",
3dbbc8e97cb267 Michal Simek         2021-02-04  900  					    refclk);
67097754afc90a Manish Narani        2021-03-24  901  			goto err_clk_put;
67097754afc90a Manish Narani        2021-03-24  902  		}
4a33bea003144e Anurag Kumar Vulisha 2020-06-29  903  =

4a33bea003144e Anurag Kumar Vulisha 2020-06-29  904  		if (!clk)
4a33bea003144e Anurag Kumar Vulisha 2020-06-29  905  			continue;
4a33bea003144e Anurag Kumar Vulisha 2020-06-29  906  =

67097754afc90a Manish Narani        2021-03-24  907  		ret =3D clk_prepare_=
enable(clk);
67097754afc90a Manish Narani        2021-03-24  908  		if (ret)
67097754afc90a Manish Narani        2021-03-24  909  			goto err_clk_put;
67097754afc90a Manish Narani        2021-03-24  910  =

67097754afc90a Manish Narani        2021-03-24  911  		gtr_dev->clk[refclk]=
 =3D clk;
67097754afc90a Manish Narani        2021-03-24  912  =

4a33bea003144e Anurag Kumar Vulisha 2020-06-29  913  		/*
4a33bea003144e Anurag Kumar Vulisha 2020-06-29  914  		 * Get the spread sp=
ectrum (SSC) settings for the reference
4a33bea003144e Anurag Kumar Vulisha 2020-06-29  915  		 * clock rate.
4a33bea003144e Anurag Kumar Vulisha 2020-06-29  916  		 */
4a33bea003144e Anurag Kumar Vulisha 2020-06-29  917  		rate =3D clk_get_rat=
e(clk);
4a33bea003144e Anurag Kumar Vulisha 2020-06-29  918  =

4a33bea003144e Anurag Kumar Vulisha 2020-06-29  919  		for (i =3D 0 ; i < A=
RRAY_SIZE(ssc_lookup); i++) {
4a33bea003144e Anurag Kumar Vulisha 2020-06-29  920  			if (rate =3D=3D ssc=
_lookup[i].refclk_rate) {
4a33bea003144e Anurag Kumar Vulisha 2020-06-29  921  				gtr_dev->refclk_ss=
cs[refclk] =3D &ssc_lookup[i];
4a33bea003144e Anurag Kumar Vulisha 2020-06-29  922  				break;
4a33bea003144e Anurag Kumar Vulisha 2020-06-29  923  			}
4a33bea003144e Anurag Kumar Vulisha 2020-06-29  924  		}
4a33bea003144e Anurag Kumar Vulisha 2020-06-29  925  =

4a33bea003144e Anurag Kumar Vulisha 2020-06-29  926  		if (i =3D=3D ARRAY_S=
IZE(ssc_lookup)) {
4a33bea003144e Anurag Kumar Vulisha 2020-06-29  927  			dev_err(gtr_dev->de=
v,
4a33bea003144e Anurag Kumar Vulisha 2020-06-29  928  				"Invalid rate %lu =
for reference clock %u\n",
4a33bea003144e Anurag Kumar Vulisha 2020-06-29  929  				rate, refclk);
67097754afc90a Manish Narani        2021-03-24  930  			ret =3D -EINVAL;
67097754afc90a Manish Narani        2021-03-24  931  			goto err_clk_put;
4a33bea003144e Anurag Kumar Vulisha 2020-06-29  932  		}
4a33bea003144e Anurag Kumar Vulisha 2020-06-29  933  	}
4a33bea003144e Anurag Kumar Vulisha 2020-06-29  934  =

4a33bea003144e Anurag Kumar Vulisha 2020-06-29  935  	return 0;
67097754afc90a Manish Narani        2021-03-24  936  =

67097754afc90a Manish Narani        2021-03-24  937  err_clk_put:
67097754afc90a Manish Narani        2021-03-24  938  	while (refclk--)
67097754afc90a Manish Narani        2021-03-24  939  		clk_disable_unprepar=
e(gtr_dev->clk[refclk]);
67097754afc90a Manish Narani        2021-03-24  940  =

67097754afc90a Manish Narani        2021-03-24 @941  	return ret;
4a33bea003144e Anurag Kumar Vulisha 2020-06-29  942  }
4a33bea003144e Anurag Kumar Vulisha 2020-06-29  943  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6070431373790828830==--

