Content-Type: multipart/mixed; boundary="===============2272448312050797436=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: drivers/gpu/drm/mxsfb/mxsfb_drv.c:304 mxsfb_load() error: we previously assumed 'mxsfb->panel' could be null (see line 262)
Date: Wed, 16 Oct 2019 15:33:40 +0300
Message-ID: <20191016123340.GI21344@kadam>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2272448312050797436==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

[ Sorry for the resend.  I forgot to set the From header to me.  -dan ]

tree:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
head:   f61714cd5bd3610794c1eb76fc96a7041b76a3a4
commit: d02340436695cbf6920ae1aaaed8afdc8635468d drm/mxsfb: Update mxsfb to=
 support a bridge

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/gpu/drm/mxsfb/mxsfb_drv.c:304 mxsfb_load() error: we previously ass=
umed 'mxsfb->panel' could be null (see line 262)

git remote add drm-drm-misc git://anongit.freedesktop.org/drm/drm-misc
git remote update drm-drm-misc
git checkout d02340436695cbf6920ae1aaaed8afdc8635468d
vim +304 drivers/gpu/drm/mxsfb/mxsfb_drv.c

45d59d704080cc Marek Vasut     2016-08-18  194  static int mxsfb_load(struc=
t drm_device *drm, unsigned long flags)
45d59d704080cc Marek Vasut     2016-08-18  195  {
45d59d704080cc Marek Vasut     2016-08-18  196  	struct platform_device *pd=
ev =3D to_platform_device(drm->dev);
45d59d704080cc Marek Vasut     2016-08-18  197  	struct mxsfb_drm_private *=
mxsfb;
45d59d704080cc Marek Vasut     2016-08-18  198  	struct resource *res;
45d59d704080cc Marek Vasut     2016-08-18  199  	int ret;
45d59d704080cc Marek Vasut     2016-08-18  200  =

45d59d704080cc Marek Vasut     2016-08-18  201  	mxsfb =3D devm_kzalloc(&pd=
ev->dev, sizeof(*mxsfb), GFP_KERNEL);
45d59d704080cc Marek Vasut     2016-08-18  202  	if (!mxsfb)
45d59d704080cc Marek Vasut     2016-08-18  203  		return -ENOMEM;
45d59d704080cc Marek Vasut     2016-08-18  204  =

45d59d704080cc Marek Vasut     2016-08-18  205  	drm->dev_private =3D mxsfb;
45d59d704080cc Marek Vasut     2016-08-18  206  	mxsfb->devdata =3D &mxsfb_=
devdata[pdev->id_entry->driver_data];
45d59d704080cc Marek Vasut     2016-08-18  207  =

45d59d704080cc Marek Vasut     2016-08-18  208  	res =3D platform_get_resou=
rce(pdev, IORESOURCE_MEM, 0);
45d59d704080cc Marek Vasut     2016-08-18  209  	mxsfb->base =3D devm_iorem=
ap_resource(drm->dev, res);
45d59d704080cc Marek Vasut     2016-08-18  210  	if (IS_ERR(mxsfb->base))
45d59d704080cc Marek Vasut     2016-08-18  211  		return PTR_ERR(mxsfb->bas=
e);
45d59d704080cc Marek Vasut     2016-08-18  212  =

45d59d704080cc Marek Vasut     2016-08-18  213  	mxsfb->clk =3D devm_clk_ge=
t(drm->dev, NULL);
45d59d704080cc Marek Vasut     2016-08-18  214  	if (IS_ERR(mxsfb->clk))
45d59d704080cc Marek Vasut     2016-08-18  215  		return PTR_ERR(mxsfb->clk=
);
45d59d704080cc Marek Vasut     2016-08-18  216  =

45d59d704080cc Marek Vasut     2016-08-18  217  	mxsfb->clk_axi =3D devm_cl=
k_get(drm->dev, "axi");
45d59d704080cc Marek Vasut     2016-08-18  218  	if (IS_ERR(mxsfb->clk_axi))
45d59d704080cc Marek Vasut     2016-08-18  219  		mxsfb->clk_axi =3D NULL;
45d59d704080cc Marek Vasut     2016-08-18  220  =

45d59d704080cc Marek Vasut     2016-08-18  221  	mxsfb->clk_disp_axi =3D de=
vm_clk_get(drm->dev, "disp_axi");
45d59d704080cc Marek Vasut     2016-08-18  222  	if (IS_ERR(mxsfb->clk_disp=
_axi))
45d59d704080cc Marek Vasut     2016-08-18  223  		mxsfb->clk_disp_axi =3D N=
ULL;
45d59d704080cc Marek Vasut     2016-08-18  224  =

45d59d704080cc Marek Vasut     2016-08-18  225  	ret =3D dma_set_mask_and_c=
oherent(drm->dev, DMA_BIT_MASK(32));
45d59d704080cc Marek Vasut     2016-08-18  226  	if (ret)
45d59d704080cc Marek Vasut     2016-08-18  227  		return ret;
45d59d704080cc Marek Vasut     2016-08-18  228  =

45d59d704080cc Marek Vasut     2016-08-18  229  	pm_runtime_enable(drm->dev=
);
45d59d704080cc Marek Vasut     2016-08-18  230  =

45d59d704080cc Marek Vasut     2016-08-18  231  	ret =3D drm_vblank_init(dr=
m, drm->mode_config.num_crtc);
45d59d704080cc Marek Vasut     2016-08-18  232  	if (ret < 0) {
45d59d704080cc Marek Vasut     2016-08-18  233  		dev_err(drm->dev, "Failed=
 to initialise vblank\n");
45d59d704080cc Marek Vasut     2016-08-18  234  		goto err_vblank;
45d59d704080cc Marek Vasut     2016-08-18  235  	}
45d59d704080cc Marek Vasut     2016-08-18  236  =

45d59d704080cc Marek Vasut     2016-08-18  237  	/* Modeset init */
45d59d704080cc Marek Vasut     2016-08-18  238  	drm_mode_config_init(drm);
45d59d704080cc Marek Vasut     2016-08-18  239  =

45d59d704080cc Marek Vasut     2016-08-18  240  	ret =3D mxsfb_create_outpu=
t(drm);
45d59d704080cc Marek Vasut     2016-08-18  241  	if (ret < 0) {
45d59d704080cc Marek Vasut     2016-08-18  242  		dev_err(drm->dev, "Failed=
 to create outputs\n");
45d59d704080cc Marek Vasut     2016-08-18  243  		goto err_vblank;
45d59d704080cc Marek Vasut     2016-08-18  244  	}
45d59d704080cc Marek Vasut     2016-08-18  245  =

45d59d704080cc Marek Vasut     2016-08-18  246  	ret =3D drm_simple_display=
_pipe_init(drm, &mxsfb->pipe, &mxsfb_funcs,
e6fc3b68558e4c Ben Widawsky    2017-07-23  247  			mxsfb_formats, ARRAY_SIZ=
E(mxsfb_formats), NULL,
d02340436695cb Robert Chiras   2019-08-29  248  			mxsfb->connector);
45d59d704080cc Marek Vasut     2016-08-18  249  	if (ret < 0) {
45d59d704080cc Marek Vasut     2016-08-18  250  		dev_err(drm->dev, "Cannot=
 setup simple display pipe\n");
45d59d704080cc Marek Vasut     2016-08-18  251  		goto err_vblank;
45d59d704080cc Marek Vasut     2016-08-18  252  	}
45d59d704080cc Marek Vasut     2016-08-18  253  =

d02340436695cb Robert Chiras   2019-08-29  254  	/*
d02340436695cb Robert Chiras   2019-08-29  255  	 * Attach panel only if th=
ere is one.
d02340436695cb Robert Chiras   2019-08-29  256  	 * If there is no panel at=
tach, it must be a bridge. In this case, we
d02340436695cb Robert Chiras   2019-08-29  257  	 * need a reference to its=
 connector for a proper initialization.
d02340436695cb Robert Chiras   2019-08-29  258  	 * We will do this check i=
n pipe->enable(), since the connector won't
d02340436695cb Robert Chiras   2019-08-29  259  	 * be attached to an encod=
er until then.
d02340436695cb Robert Chiras   2019-08-29  260  	 */
d02340436695cb Robert Chiras   2019-08-29  261  =

d02340436695cb Robert Chiras   2019-08-29 @262  	if (mxsfb->panel) {
                                                            ^^^^^^^^^^^^

d02340436695cb Robert Chiras   2019-08-29  263  		ret =3D drm_panel_attach(=
mxsfb->panel, mxsfb->connector);
d02340436695cb Robert Chiras   2019-08-29  264  		if (ret) {
d02340436695cb Robert Chiras   2019-08-29  265  			dev_err(drm->dev, "Canno=
t connect panel: %d\n", ret);
d02340436695cb Robert Chiras   2019-08-29  266  			goto err_vblank;
d02340436695cb Robert Chiras   2019-08-29  267  		}
d02340436695cb Robert Chiras   2019-08-29  268  	} else if (mxsfb->bridge) {
d02340436695cb Robert Chiras   2019-08-29  269  		ret =3D drm_simple_displa=
y_pipe_attach_bridge(&mxsfb->pipe,
d02340436695cb Robert Chiras   2019-08-29  270  							    mxsfb->bridge);
45d59d704080cc Marek Vasut     2016-08-18  271  		if (ret) {
d02340436695cb Robert Chiras   2019-08-29  272  			dev_err(drm->dev, "Canno=
t connect bridge: %d\n", ret);
45d59d704080cc Marek Vasut     2016-08-18  273  			goto err_vblank;
45d59d704080cc Marek Vasut     2016-08-18  274  		}
d02340436695cb Robert Chiras   2019-08-29  275  	}
45d59d704080cc Marek Vasut     2016-08-18  276  =

45d59d704080cc Marek Vasut     2016-08-18  277  	drm->mode_config.min_width=
	=3D MXSFB_MIN_XRES;
45d59d704080cc Marek Vasut     2016-08-18  278  	drm->mode_config.min_heigh=
t	=3D MXSFB_MIN_YRES;
45d59d704080cc Marek Vasut     2016-08-18  279  	drm->mode_config.max_width=
	=3D MXSFB_MAX_XRES;
45d59d704080cc Marek Vasut     2016-08-18  280  	drm->mode_config.max_heigh=
t	=3D MXSFB_MAX_YRES;
45d59d704080cc Marek Vasut     2016-08-18  281  	drm->mode_config.funcs		=
=3D &mxsfb_mode_config_funcs;
9f19fd3bd894d6 Leonard Crestez 2018-09-17  282  	drm->mode_config.helper_pr=
ivate	=3D &mxsfb_mode_config_helpers;
45d59d704080cc Marek Vasut     2016-08-18  283  =

45d59d704080cc Marek Vasut     2016-08-18  284  	drm_mode_config_reset(drm);
45d59d704080cc Marek Vasut     2016-08-18  285  =

45d59d704080cc Marek Vasut     2016-08-18  286  	pm_runtime_get_sync(drm->d=
ev);
45d59d704080cc Marek Vasut     2016-08-18  287  	ret =3D drm_irq_install(dr=
m, platform_get_irq(pdev, 0));
45d59d704080cc Marek Vasut     2016-08-18  288  	pm_runtime_put_sync(drm->d=
ev);
45d59d704080cc Marek Vasut     2016-08-18  289  =

45d59d704080cc Marek Vasut     2016-08-18  290  	if (ret < 0) {
45d59d704080cc Marek Vasut     2016-08-18  291  		dev_err(drm->dev, "Failed=
 to install IRQ handler\n");
45d59d704080cc Marek Vasut     2016-08-18  292  		goto err_irq;
45d59d704080cc Marek Vasut     2016-08-18  293  	}
45d59d704080cc Marek Vasut     2016-08-18  294  =

45d59d704080cc Marek Vasut     2016-08-18  295  	drm_kms_helper_poll_init(d=
rm);
45d59d704080cc Marek Vasut     2016-08-18  296  =

45d59d704080cc Marek Vasut     2016-08-18  297  	platform_set_drvdata(pdev,=
 drm);
45d59d704080cc Marek Vasut     2016-08-18  298  =

45d59d704080cc Marek Vasut     2016-08-18  299  	drm_helper_hpd_irq_event(d=
rm);
45d59d704080cc Marek Vasut     2016-08-18  300  =

45d59d704080cc Marek Vasut     2016-08-18  301  	return 0;
45d59d704080cc Marek Vasut     2016-08-18  302  =

45d59d704080cc Marek Vasut     2016-08-18  303  err_irq:
45d59d704080cc Marek Vasut     2016-08-18 @304  	drm_panel_detach(mxsfb->pa=
nel);
                                                        ^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^
Needs to be checked here as well.

45d59d704080cc Marek Vasut     2016-08-18  305  err_vblank:
45d59d704080cc Marek Vasut     2016-08-18  306  	pm_runtime_disable(drm->de=
v);
45d59d704080cc Marek Vasut     2016-08-18  307  =

45d59d704080cc Marek Vasut     2016-08-18  308  	return ret;
45d59d704080cc Marek Vasut     2016-08-18  309  }

---
0-DAY kernel test infrastructure                Open Source Technology Cent=
er
https://lists.01.org/pipermail/kbuild-all                   Intel Corporati=
on
--===============2272448312050797436==--

