Content-Type: multipart/mixed; boundary="===============0278544999695166206=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [kbingham-rcar:kbingham/vsp/v3u-5.16 17/33] drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c:641:6: warning: Unused variable: ret [unusedVariable]
Date: Mon, 06 Dec 2021 01:48:23 +0800
Message-ID: <202112060148.ktFMJBbZ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0278544999695166206==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kbingham/rcar.git k=
bingham/vsp/v3u-5.16
head:   3f9acc04945582172a99910f5a264347f6ddb0a9
commit: adffb421fe4941afa0e9af6eaa5564e2166a4ba5 [17/33] drm: rcar-du: mipi=
-dsi: Use devm_drm_of_get_bridge helper
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
compiler: arc-elf-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c:641:6: warning: Unused variable:=
 ret [unusedVariable]
    int ret;
        ^

vim +641 drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c

e7d888bbc365be LUU HOAI       2020-02-25  626  =

e7d888bbc365be LUU HOAI       2020-02-25  627  /* -------------------------=
----------------------------------------------------
e7d888bbc365be LUU HOAI       2020-02-25  628   * Clock Setting
e7d888bbc365be LUU HOAI       2020-02-25  629   */
e7d888bbc365be LUU HOAI       2020-02-25  630  =

e7d888bbc365be LUU HOAI       2020-02-25  631  =

e7d888bbc365be LUU HOAI       2020-02-25  632  /* -------------------------=
----------------------------------------------------
e7d888bbc365be LUU HOAI       2020-02-25  633   * Host setting
e7d888bbc365be LUU HOAI       2020-02-25  634   */
e7d888bbc365be LUU HOAI       2020-02-25  635  =

e7d888bbc365be LUU HOAI       2020-02-25  636  static int rcar_mipi_dsi_hos=
t_attach(struct mipi_dsi_host *host,
e7d888bbc365be LUU HOAI       2020-02-25  637  					struct mipi_dsi_device =
*device)
e7d888bbc365be LUU HOAI       2020-02-25  638  {
e7d888bbc365be LUU HOAI       2020-02-25  639  	struct rcar_mipi_dsi *dsi =
=3D host_to_rcar_mipi_dsi(host);
adffb421fe4941 Kieran Bingham 2021-11-30  640  	struct device *dev =3D dsi-=
>dev;
e1579d24bd6f85 Kieran Bingham 2021-11-25 @641  	int ret;
e7d888bbc365be LUU HOAI       2020-02-25  642  =

e7d888bbc365be LUU HOAI       2020-02-25  643  	if (device->lanes > dsi->nu=
m_data_lanes)
e7d888bbc365be LUU HOAI       2020-02-25  644  		return -EINVAL;
e7d888bbc365be LUU HOAI       2020-02-25  645  =

e7d888bbc365be LUU HOAI       2020-02-25  646  	dsi->lanes =3D device->lane=
s;
e7d888bbc365be LUU HOAI       2020-02-25  647  	dsi->format =3D device->for=
mat;
e7d888bbc365be LUU HOAI       2020-02-25  648  =

adffb421fe4941 Kieran Bingham 2021-11-30  649  	dsi->next_bridge =3D devm_d=
rm_of_get_bridge(dev, dev->of_node, 1, 0);
adffb421fe4941 Kieran Bingham 2021-11-30  650  	if (IS_ERR(dsi->next_bridge=
))
e1579d24bd6f85 Kieran Bingham 2021-11-25  651  		return PTR_ERR(dsi->next_b=
ridge);
e1579d24bd6f85 Kieran Bingham 2021-11-25  652  =

e1579d24bd6f85 Kieran Bingham 2021-11-25  653  	/* Initialize the DRM bridg=
e. */
e1579d24bd6f85 Kieran Bingham 2021-11-25  654  	dsi->bridge.funcs =3D &rcar=
_mipi_dsi_bridge_ops;
e1579d24bd6f85 Kieran Bingham 2021-11-25  655  	dsi->bridge.of_node =3D dsi=
->dev->of_node;
e1579d24bd6f85 Kieran Bingham 2021-11-25  656  	drm_bridge_add(&dsi->bridge=
);
e1579d24bd6f85 Kieran Bingham 2021-11-25  657  =

e7d888bbc365be LUU HOAI       2020-02-25  658  	return 0;
e7d888bbc365be LUU HOAI       2020-02-25  659  }
e7d888bbc365be LUU HOAI       2020-02-25  660  =


:::::: The code at line 641 was first introduced by commit
:::::: e1579d24bd6f85abc964af4637e471dd8f373e87 drm: rcar-du: mipi-dsi: Sup=
port bridge probe ordering

:::::: TO: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
:::::: CC: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0278544999695166206==--

