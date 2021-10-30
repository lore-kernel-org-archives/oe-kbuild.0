Content-Type: multipart/mixed; boundary="===============0562821476816735864=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [drm-misc:drm-misc-next 1/6] drivers/gpu/drm/ingenic/ingenic-drm-drv.c:1134 ingenic_drm_bind() error: uninitialized symbol 'dma_hwdesc_phys_f0'.
Date: Sat, 30 Oct 2021 19:13:40 +0800
Message-ID: <202110301933.38nGMgE5-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0562821476816735864==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Paul Cercueil <paul@crapouillou.net>
CC: Christophe Branchereau <cbranchereau@gmail.com>

tree:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
head:   dded00395bdbd45a16d1504a1da77103522b28af
commit: 1bdb542da736e299a3fb291e5905a14dc955b938 [1/6] drm/ingenic: Simplif=
y code by using hwdescs array
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
config: mips-randconfig-m031-20211028 (attached as .config)
compiler: mipsel-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/gpu/drm/ingenic/ingenic-drm-drv.c:1134 ingenic_drm_bind() error: un=
initialized symbol 'dma_hwdesc_phys_f0'.
drivers/gpu/drm/ingenic/ingenic-drm-drv.c:1135 ingenic_drm_bind() error: un=
initialized symbol 'dma_hwdesc_phys_f1'.

vim +/dma_hwdesc_phys_f0 +1134 drivers/gpu/drm/ingenic/ingenic-drm-drv.c

1bdb542da736e2 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2021-10-26   879  =

3b5b005ef7d9e2 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-08-27   880  static int ingenic_drm_bind(struct device *dev, bool has_=
components)
fc1acf317b0108 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-07-16   881  {
fc1acf317b0108 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-07-16   882  	struct platform_device *pdev =3D to_platform_device(dev);
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03   883  	const struct jz_soc_info *soc_info;
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03   884  	struct ingenic_drm *priv;
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03   885  	struct clk *parent_clk;
7b4957684e5d81 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2021-01-24   886  	struct drm_plane *primary;
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03   887  	struct drm_bridge *bridge;
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03   888  	struct drm_panel *panel;
c369cb27c267fe drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-07-16   889  	struct drm_encoder *encoder;
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03   890  	struct drm_device *drm;
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03   891  	void __iomem *base;
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03   892  	long parent_rate;
c369cb27c267fe drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-07-16   893  	unsigned int i, clone_mask =3D 0;
174d8e52a60f19 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-09-26   894  	dma_addr_t dma_hwdesc_phys_f0, dma_hwdesc_phys_f1;
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03   895  	int ret, irq;
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03   896  =

90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03   897  	soc_info =3D of_device_get_match_data(dev);
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03   898  	if (!soc_info) {
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03   899  		dev_err(dev, "Missing platform data\n");
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03   900  		return -EINVAL;
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03   901  	}
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03   902  =

1677d31c226683 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-09-26   903  	if (IS_ENABLED(CONFIG_OF_RESERVED_MEM)) {
1677d31c226683 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-09-26   904  		ret =3D of_reserved_mem_device_init(dev);
1677d31c226683 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-09-26   905  =

1677d31c226683 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-09-26   906  		if (ret && ret !=3D -ENODEV)
1677d31c226683 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-09-26   907  			dev_warn(dev, "Failed to get reserved memory: %d\n", r=
et);
1677d31c226683 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-09-26   908  =

1677d31c226683 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-09-26   909  		if (!ret) {
1677d31c226683 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-09-26   910  			ret =3D devm_add_action_or_reset(dev, ingenic_drm_rele=
ase_rmem, dev);
1677d31c226683 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-09-26   911  			if (ret)
1677d31c226683 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-09-26   912  				return ret;
1677d31c226683 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-09-26   913  		}
1677d31c226683 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-09-26   914  	}
1677d31c226683 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-09-26   915  =

37d8d81f019ac1 drivers/gpu/drm/ingenic/ingenic-drm.c     Daniel Vetter     =
2020-04-15   916  	priv =3D devm_drm_dev_alloc(dev, &ingenic_drm_driver_dat=
a,
37d8d81f019ac1 drivers/gpu/drm/ingenic/ingenic-drm.c     Daniel Vetter     =
2020-04-15   917  				  struct ingenic_drm, drm);
37d8d81f019ac1 drivers/gpu/drm/ingenic/ingenic-drm.c     Daniel Vetter     =
2020-04-15   918  	if (IS_ERR(priv))
37d8d81f019ac1 drivers/gpu/drm/ingenic/ingenic-drm.c     Daniel Vetter     =
2020-04-15   919  		return PTR_ERR(priv);
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03   920  =

a7c909b7c037fa drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-12-10   921  	priv->soc_info =3D soc_info;
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03   922  	priv->dev =3D dev;
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03   923  	drm =3D &priv->drm;
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03   924  =

90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03   925  	platform_set_drvdata(pdev, priv);
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03   926  =

fe1cc102a381a9 drivers/gpu/drm/ingenic/ingenic-drm.c     Daniel Vetter     =
2020-03-23   927  	ret =3D drmm_mode_config_init(drm);
fe1cc102a381a9 drivers/gpu/drm/ingenic/ingenic-drm.c     Daniel Vetter     =
2020-03-23   928  	if (ret)
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03   929  		return ret;
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03   930  =

90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03   931  	drm->mode_config.min_width =3D 0;
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03   932  	drm->mode_config.min_height =3D 0;
a7c909b7c037fa drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-12-10   933  	drm->mode_config.max_width =3D soc_info->max_width;
96ea0ae692fe38 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-12-10   934  	drm->mode_config.max_height =3D 4095;
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03   935  	drm->mode_config.funcs =3D &ingenic_drm_mode_config_func=
s;
3c9bea4ef32bdc drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-07-16   936  	drm->mode_config.helper_private =3D &ingenic_drm_mode_co=
nfig_helpers;
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03   937  =

ffa8aa00e9e589 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-27   938  	base =3D devm_platform_ioremap_resource(pdev, 0);
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03   939  	if (IS_ERR(base)) {
1f7596f4ad9b7f drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-07-16   940  		dev_err(dev, "Failed to get memory resource\n");
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03   941  		return PTR_ERR(base);
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03   942  	}
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03   943  =

90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03   944  	priv->map =3D devm_regmap_init_mmio(dev, base,
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03   945  					  &ingenic_drm_regmap_config);
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03   946  	if (IS_ERR(priv->map)) {
1f7596f4ad9b7f drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-07-16   947  		dev_err(dev, "Failed to create regmap\n");
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03   948  		return PTR_ERR(priv->map);
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03   949  	}
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03   950  =

90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03   951  	irq =3D platform_get_irq(pdev, 0);
71c45008e2b0d6 drivers/gpu/drm/ingenic/ingenic-drm.c     Markus Elfring    =
2020-04-05   952  	if (irq < 0)
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03   953  		return irq;
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03   954  =

90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03   955  	if (soc_info->needs_dev_clk) {
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03   956  		priv->lcd_clk =3D devm_clk_get(dev, "lcd");
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03   957  		if (IS_ERR(priv->lcd_clk)) {
1f7596f4ad9b7f drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-07-16   958  			dev_err(dev, "Failed to get lcd clock\n");
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03   959  			return PTR_ERR(priv->lcd_clk);
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03   960  		}
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03   961  	}
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03   962  =

90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03   963  	priv->pix_clk =3D devm_clk_get(dev, "lcd_pclk");
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03   964  	if (IS_ERR(priv->pix_clk)) {
1f7596f4ad9b7f drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-07-16   965  		dev_err(dev, "Failed to get pixel clock\n");
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03   966  		return PTR_ERR(priv->pix_clk);
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03   967  	}
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03   968  =

174d8e52a60f19 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-09-26   969  	priv->dma_hwdescs =3D dmam_alloc_coherent(dev,
174d8e52a60f19 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-09-26   970  						sizeof(*priv->dma_hwdescs),
174d8e52a60f19 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-09-26   971  						&priv->dma_hwdescs_phys,
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03   972  						GFP_KERNEL);
174d8e52a60f19 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-09-26   973  	if (!priv->dma_hwdescs)
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03   974  		return -ENOMEM;
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03   975  =

174d8e52a60f19 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-09-26   976  	/* Configure DMA hwdesc for foreground0 plane */
1bdb542da736e2 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2021-10-26   977  	ingenic_drm_configure_hwdesc_plane(priv, 0);
3c9bea4ef32bdc drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-07-16   978  =

174d8e52a60f19 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-09-26   979  	/* Configure DMA hwdesc for foreground1 plane */
1bdb542da736e2 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2021-10-26   980  	ingenic_drm_configure_hwdesc_plane(priv, 1);
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03   981  =

686d4b4b99afe7 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-09-27   982  	/* Configure DMA hwdesc for palette */
1bdb542da736e2 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2021-10-26   983  	ingenic_drm_configure_hwdesc_palette(priv);
686d4b4b99afe7 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-09-27   984  =

7b4957684e5d81 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2021-01-24   985  	primary =3D priv->soc_info->has_osd ? &priv->f1 : &priv-=
>f0;
3c9bea4ef32bdc drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-07-16   986  =

7b4957684e5d81 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2021-01-24   987  	drm_plane_helper_add(primary, &ingenic_drm_plane_helper_=
funcs);
7b4957684e5d81 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2021-01-24   988  =

7b4957684e5d81 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2021-01-24   989  	ret =3D drm_universal_plane_init(drm, primary, 1,
3c9bea4ef32bdc drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-07-16   990  				       &ingenic_drm_primary_plane_funcs,
3d705fb0dc43a9 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-09-26   991  				       priv->soc_info->formats_f1,
3d705fb0dc43a9 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-09-26   992  				       priv->soc_info->num_formats_f1,
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03   993  				       NULL, DRM_PLANE_TYPE_PRIMARY, NULL);
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03   994  	if (ret) {
fc1acf317b0108 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-07-16   995  		dev_err(dev, "Failed to register plane: %i\n", ret);
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03   996  		return ret;
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03   997  	}
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03   998  =

4a791cb6d34f42 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2021-05-23   999  	if (soc_info->map_noncoherent)
4a791cb6d34f42 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2021-05-23  1000  		drm_plane_enable_fb_damage_clips(&priv->f1);
4a791cb6d34f42 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2021-05-23  1001  =

90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03  1002  	drm_crtc_helper_add(&priv->crtc, &ingenic_drm_crtc_helpe=
r_funcs);
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03  1003  =

7b4957684e5d81 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2021-01-24  1004  	ret =3D drm_crtc_init_with_planes(drm, &priv->crtc, prim=
ary,
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03  1005  					NULL, &ingenic_drm_crtc_funcs, NULL);
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03  1006  	if (ret) {
1f7596f4ad9b7f drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-07-16  1007  		dev_err(dev, "Failed to init CRTC: %i\n", ret);
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03  1008  		return ret;
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03  1009  	}
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03  1010  =

686d4b4b99afe7 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-09-27  1011  	drm_crtc_enable_color_mgmt(&priv->crtc, 0, false,
686d4b4b99afe7 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-09-27  1012  				   ARRAY_SIZE(priv->dma_hwdescs->palette));
686d4b4b99afe7 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-09-27  1013  =

3c9bea4ef32bdc drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-07-16  1014  	if (soc_info->has_osd) {
3c9bea4ef32bdc drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-07-16  1015  		drm_plane_helper_add(&priv->f0,
3c9bea4ef32bdc drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-07-16  1016  				     &ingenic_drm_plane_helper_funcs);
3c9bea4ef32bdc drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-07-16  1017  =

3c9bea4ef32bdc drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-07-16  1018  		ret =3D drm_universal_plane_init(drm, &priv->f0, 1,
3c9bea4ef32bdc drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-07-16  1019  					       &ingenic_drm_primary_plane_funcs,
3d705fb0dc43a9 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-09-26  1020  					       priv->soc_info->formats_f0,
3d705fb0dc43a9 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-09-26  1021  					       priv->soc_info->num_formats_f0,
3c9bea4ef32bdc drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-07-16  1022  					       NULL, DRM_PLANE_TYPE_OVERLAY,
3c9bea4ef32bdc drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-07-16  1023  					       NULL);
3c9bea4ef32bdc drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-07-16  1024  		if (ret) {
3c9bea4ef32bdc drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-07-16  1025  			dev_err(dev, "Failed to register overlay plane: %i\n",
3c9bea4ef32bdc drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-07-16  1026  				ret);
3c9bea4ef32bdc drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-07-16  1027  			return ret;
3c9bea4ef32bdc drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-07-16  1028  		}
fc1acf317b0108 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-07-16  1029  =

4a791cb6d34f42 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2021-05-23  1030  		if (soc_info->map_noncoherent)
4a791cb6d34f42 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2021-05-23  1031  			drm_plane_enable_fb_damage_clips(&priv->f0);
4a791cb6d34f42 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2021-05-23  1032  =

3b5b005ef7d9e2 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-08-27  1033  		if (IS_ENABLED(CONFIG_DRM_INGENIC_IPU) && has_component=
s) {
fc1acf317b0108 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-07-16  1034  			ret =3D component_bind_all(dev, drm);
fc1acf317b0108 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-07-16  1035  			if (ret) {
fc1acf317b0108 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-07-16  1036  				if (ret !=3D -EPROBE_DEFER)
fc1acf317b0108 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-07-16  1037  					dev_err(dev, "Failed to bind components: %i\n", ret);
fc1acf317b0108 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-07-16  1038  				return ret;
fc1acf317b0108 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-07-16  1039  			}
fc1acf317b0108 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-07-16  1040  =

fc1acf317b0108 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-07-16  1041  			ret =3D devm_add_action_or_reset(dev, ingenic_drm_unbi=
nd_all, priv);
fc1acf317b0108 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-07-16  1042  			if (ret)
fc1acf317b0108 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-07-16  1043  				return ret;
fc1acf317b0108 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-07-16  1044  =

fc1acf317b0108 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-07-16  1045  			priv->ipu_plane =3D drm_plane_from_index(drm, 2);
fc1acf317b0108 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-07-16  1046  			if (!priv->ipu_plane) {
fc1acf317b0108 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-07-16  1047  				dev_err(dev, "Failed to retrieve IPU plane\n");
fc1acf317b0108 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-07-16  1048  				return -EINVAL;
fc1acf317b0108 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-07-16  1049  			}
fc1acf317b0108 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-07-16  1050  		}
3c9bea4ef32bdc drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-07-16  1051  	}
3c9bea4ef32bdc drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-07-16  1052  =

c369cb27c267fe drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-07-16  1053  	for (i =3D 0; ; i++) {
c369cb27c267fe drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-07-16  1054  		ret =3D drm_of_find_panel_or_bridge(dev->of_node, 0, i,=
 &panel, &bridge);
c369cb27c267fe drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-07-16  1055  		if (ret) {
c369cb27c267fe drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-07-16  1056  			if (ret =3D=3D -ENODEV)
c369cb27c267fe drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-07-16  1057  				break; /* we're done */
c369cb27c267fe drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-07-16  1058  			if (ret !=3D -EPROBE_DEFER)
c369cb27c267fe drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-07-16  1059  				dev_err(dev, "Failed to get bridge handle\n");
c369cb27c267fe drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-07-16  1060  			return ret;
c369cb27c267fe drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-07-16  1061  		}
c369cb27c267fe drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-07-16  1062  =

c369cb27c267fe drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-07-16  1063  		if (panel)
c369cb27c267fe drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-07-16  1064  			bridge =3D devm_drm_panel_bridge_add_typed(dev, panel,
c369cb27c267fe drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-07-16  1065  								 DRM_MODE_CONNECTOR_DPI);
c369cb27c267fe drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-07-16  1066  =

e488b1023a4a4e drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2021-03-27  1067  		encoder =3D drmm_plain_encoder_alloc(drm, NULL, DRM_MOD=
E_ENCODER_DPI, NULL);
e488b1023a4a4e drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2021-03-27  1068  		if (IS_ERR(encoder)) {
e488b1023a4a4e drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2021-03-27  1069  			ret =3D PTR_ERR(encoder);
e488b1023a4a4e drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2021-03-27  1070  			dev_err(dev, "Failed to init encoder: %d\n", ret);
e488b1023a4a4e drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2021-03-27  1071  			return ret;
e488b1023a4a4e drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2021-03-27  1072  		}
c369cb27c267fe drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-07-16  1073  =

c369cb27c267fe drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-07-16  1074  		encoder->possible_crtcs =3D 1;
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03  1075  =

c369cb27c267fe drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-07-16  1076  		drm_encoder_helper_add(encoder, &ingenic_drm_encoder_he=
lper_funcs);
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03  1077  =

c369cb27c267fe drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-07-16  1078  		ret =3D drm_bridge_attach(encoder, bridge, NULL, 0);
fb8d617f8fd64f drivers/gpu/drm/ingenic/ingenic-drm-drv.c Laurent Pinchart  =
2021-03-23  1079  		if (ret)
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03  1080  			return ret;
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03  1081  	}
c369cb27c267fe drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-07-16  1082  =

c369cb27c267fe drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-07-16  1083  	drm_for_each_encoder(encoder, drm) {
c369cb27c267fe drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-07-16  1084  		clone_mask |=3D BIT(drm_encoder_index(encoder));
c369cb27c267fe drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-07-16  1085  	}
c369cb27c267fe drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-07-16  1086  =

c369cb27c267fe drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-07-16  1087  	drm_for_each_encoder(encoder, drm) {
c369cb27c267fe drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-07-16  1088  		encoder->possible_clones =3D clone_mask;
c369cb27c267fe drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-07-16  1089  	}
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03  1090  =

613ba71619cfe0 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Thomas Zimmermann =
2021-07-15  1091  	ret =3D devm_request_irq(dev, irq, ingenic_drm_irq_handl=
er, 0, drm->driver->name, drm);
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03  1092  	if (ret) {
1f7596f4ad9b7f drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-07-16  1093  		dev_err(dev, "Unable to install IRQ handler\n");
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03  1094  		return ret;
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03  1095  	}
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03  1096  =

90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03  1097  	ret =3D drm_vblank_init(drm, 1);
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03  1098  	if (ret) {
1f7596f4ad9b7f drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-07-16  1099  		dev_err(dev, "Failed calling drm_vblank_init()\n");
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03  1100  		return ret;
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03  1101  	}
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03  1102  =

90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03  1103  	drm_mode_config_reset(drm);
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03  1104  =

90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03  1105  	ret =3D clk_prepare_enable(priv->pix_clk);
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03  1106  	if (ret) {
1f7596f4ad9b7f drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-07-16  1107  		dev_err(dev, "Unable to start pixel clock\n");
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03  1108  		return ret;
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03  1109  	}
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03  1110  =

90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03  1111  	if (priv->lcd_clk) {
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03  1112  		parent_clk =3D clk_get_parent(priv->lcd_clk);
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03  1113  		parent_rate =3D clk_get_rate(parent_clk);
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03  1114  =

90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03  1115  		/* LCD Device clock must be 3x the pixel clock for STN =
panels,
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03  1116  		 * or 1.5x the pixel clock for TFT panels. To avoid hav=
ing to
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03  1117  		 * check for the LCD device clock everytime we do a mod=
e change,
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03  1118  		 * we set the LCD device clock to the highest rate poss=
ible.
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03  1119  		 */
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03  1120  		ret =3D clk_set_rate(priv->lcd_clk, parent_rate);
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03  1121  		if (ret) {
1f7596f4ad9b7f drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-07-16  1122  			dev_err(dev, "Unable to set LCD clock rate\n");
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03  1123  			goto err_pixclk_disable;
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03  1124  		}
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03  1125  =

90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03  1126  		ret =3D clk_prepare_enable(priv->lcd_clk);
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03  1127  		if (ret) {
1f7596f4ad9b7f drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-07-16  1128  			dev_err(dev, "Unable to start lcd clock\n");
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03  1129  			goto err_pixclk_disable;
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03  1130  		}
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03  1131  	}
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03  1132  =

e5507d2c01362b drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-07-16  1133  	/* Set address of our DMA descriptor chain */
174d8e52a60f19 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-09-26 @1134  	regmap_write(priv->map, JZ_REG_LCD_DA0, dma_hwdesc_phys_=
f0);
174d8e52a60f19 drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-09-26 @1135  	regmap_write(priv->map, JZ_REG_LCD_DA1, dma_hwdesc_phys_=
f1);
3c9bea4ef32bdc drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-07-16  1136  =

3c9bea4ef32bdc drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-07-16  1137  	/* Enable OSD if available */
3c9bea4ef32bdc drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-07-16  1138  	if (soc_info->has_osd)
3c9bea4ef32bdc drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-07-16  1139  		regmap_write(priv->map, JZ_REG_LCD_OSDC, JZ_LCD_OSDC_OS=
DEN);
e5507d2c01362b drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-07-16  1140  =

33700f6f7d9f6b drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-09-26  1141  	mutex_init(&priv->clk_mutex);
33700f6f7d9f6b drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-09-26  1142  	priv->clock_nb.notifier_call =3D ingenic_drm_update_pixc=
lk;
33700f6f7d9f6b drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-09-26  1143  =

33700f6f7d9f6b drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-09-26  1144  	parent_clk =3D clk_get_parent(priv->pix_clk);
33700f6f7d9f6b drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-09-26  1145  	ret =3D clk_notifier_register(parent_clk, &priv->clock_n=
b);
33700f6f7d9f6b drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-09-26  1146  	if (ret) {
33700f6f7d9f6b drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-09-26  1147  		dev_err(dev, "Unable to register clock notifier\n");
33700f6f7d9f6b drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-09-26  1148  		goto err_devclk_disable;
33700f6f7d9f6b drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-09-26  1149  	}
33700f6f7d9f6b drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-09-26  1150  =

90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03  1151  	ret =3D drm_dev_register(drm, 0);
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03  1152  	if (ret) {
1f7596f4ad9b7f drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-07-16  1153  		dev_err(dev, "Failed to register DRM driver\n");
33700f6f7d9f6b drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-09-26  1154  		goto err_clk_notifier_unregister;
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03  1155  	}
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03  1156  =

38d356c7fe7fd4 drivers/gpu/drm/ingenic/ingenic-drm.c     Thomas Zimmermann =
2020-04-08  1157  	drm_fbdev_generic_setup(drm, 32);
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03  1158  =

90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03  1159  	return 0;
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03  1160  =

33700f6f7d9f6b drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-09-26  1161  err_clk_notifier_unregister:
33700f6f7d9f6b drivers/gpu/drm/ingenic/ingenic-drm-drv.c Paul Cercueil     =
2020-09-26  1162  	clk_notifier_unregister(parent_clk, &priv->clock_nb);
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03  1163  err_devclk_disable:
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03  1164  	if (priv->lcd_clk)
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03  1165  		clk_disable_unprepare(priv->lcd_clk);
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03  1166  err_pixclk_disable:
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03  1167  	clk_disable_unprepare(priv->pix_clk);
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03  1168  	return ret;
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03  1169  }
90b86fcc47b4d1 drivers/gpu/drm/ingenic/ingenic-drm.c     Paul Cercueil     =
2019-06-03  1170  =


:::::: The code at line 1134 was first introduced by commit
:::::: 174d8e52a60f196cfbdec299688cf14f124c8b67 drm/ingenic: Alloc F0 and F=
1 DMA descriptors at once

:::::: TO: Paul Cercueil <paul@crapouillou.net>
:::::: CC: Paul Cercueil <paul@crapouillou.net>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============0562821476816735864==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
Bryk1YMvAgA=
--===============0562821476816735864==--

