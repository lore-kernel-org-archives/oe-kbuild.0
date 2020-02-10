Content-Type: multipart/mixed; boundary="===============2690921604689516557=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [balbi-usb:testing/next 5/10] drivers/usb/dwc3/dwc3-meson-g12a.c:455 dwc3_meson_g12a_otg_init() error: uninitialized symbol 'ret'.
Date: Mon, 10 Feb 2020 10:31:10 +0300
Message-ID: <20200210073110.GQ24804@kadam>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2690921604689516557==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git testi=
ng/next
head:   b081f1dc121c0bdeacc45cf02c35d1ee95120680
commit: 729149c53f048f16aff9e662bf444c275b59ba8a [5/10] usb: dwc3: Add Amlo=
gic A1 DWC3 glue

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/usb/dwc3/dwc3-meson-g12a.c:455 dwc3_meson_g12a_otg_init() error: un=
initialized symbol 'ret'.

# https://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git/commit/?id=
=3D729149c53f048f16aff9e662bf444c275b59ba8a
git remote add balbi-usb https://git.kernel.org/pub/scm/linux/kernel/git/ba=
lbi/usb.git
git remote update balbi-usb
git checkout 729149c53f048f16aff9e662bf444c275b59ba8a
vim +/ret +455 drivers/usb/dwc3/dwc3-meson-g12a.c

729149c53f048f Hanjie Lin     2020-01-20  411  static int dwc3_meson_g12a_o=
tg_init(struct platform_device *pdev,
729149c53f048f Hanjie Lin     2020-01-20  412  				    struct dwc3_meson_g1=
2a *priv)
729149c53f048f Hanjie Lin     2020-01-20  413  {
729149c53f048f Hanjie Lin     2020-01-20  414  	enum phy_mode otg_id;
729149c53f048f Hanjie Lin     2020-01-20  415  	int ret, irq;
729149c53f048f Hanjie Lin     2020-01-20  416  	struct device *dev =3D &pde=
v->dev;
729149c53f048f Hanjie Lin     2020-01-20  417  =

729149c53f048f Hanjie Lin     2020-01-20  418  	if (!priv->drvdata->otg_swi=
tch_supported)
729149c53f048f Hanjie Lin     2020-01-20  419  		return 0;
729149c53f048f Hanjie Lin     2020-01-20  420  =

729149c53f048f Hanjie Lin     2020-01-20  421  	if (priv->otg_mode =3D=3D U=
SB_DR_MODE_OTG) {
729149c53f048f Hanjie Lin     2020-01-20  422  		/* Ack irq before register=
ing */
729149c53f048f Hanjie Lin     2020-01-20  423  		regmap_update_bits(priv->r=
egmap, USB_R5,
729149c53f048f Hanjie Lin     2020-01-20  424  				   USB_R5_ID_DIG_IRQ, 0);
729149c53f048f Hanjie Lin     2020-01-20  425  =

729149c53f048f Hanjie Lin     2020-01-20  426  		irq =3D platform_get_irq(p=
dev, 0);
729149c53f048f Hanjie Lin     2020-01-20  427  		ret =3D devm_request_threa=
ded_irq(&pdev->dev, irq, NULL,
729149c53f048f Hanjie Lin     2020-01-20  428  						dwc3_meson_g12a_irq_th=
read,
729149c53f048f Hanjie Lin     2020-01-20  429  						IRQF_ONESHOT, pdev->na=
me, priv);
729149c53f048f Hanjie Lin     2020-01-20  430  		if (ret)
729149c53f048f Hanjie Lin     2020-01-20  431  			return ret;
729149c53f048f Hanjie Lin     2020-01-20  432  	}
729149c53f048f Hanjie Lin     2020-01-20  433  =

729149c53f048f Hanjie Lin     2020-01-20  434  	/* Setup OTG mode correspon=
ding to the ID pin */
729149c53f048f Hanjie Lin     2020-01-20  435  	if (priv->otg_mode =3D=3D U=
SB_DR_MODE_OTG) {
729149c53f048f Hanjie Lin     2020-01-20  436  		otg_id =3D dwc3_meson_g12a=
_get_id(priv);
729149c53f048f Hanjie Lin     2020-01-20  437  		if (otg_id !=3D priv->otg_=
phy_mode) {
729149c53f048f Hanjie Lin     2020-01-20  438  			if (dwc3_meson_g12a_otg_m=
ode_set(priv, otg_id))
729149c53f048f Hanjie Lin     2020-01-20  439  				dev_warn(dev, "Failed to=
 switch OTG mode\n");
729149c53f048f Hanjie Lin     2020-01-20  440  		}
729149c53f048f Hanjie Lin     2020-01-20  441  	}
729149c53f048f Hanjie Lin     2020-01-20  442  =

729149c53f048f Hanjie Lin     2020-01-20  443  	/* Setup role switcher */
729149c53f048f Hanjie Lin     2020-01-20  444  	priv->switch_desc.usb2_port=
 =3D dwc3_meson_g12_find_child(dev,
729149c53f048f Hanjie Lin     2020-01-20  445  								"snps,dwc3");
729149c53f048f Hanjie Lin     2020-01-20  446  	priv->switch_desc.udc =3D d=
wc3_meson_g12_find_child(dev, "snps,dwc2");
729149c53f048f Hanjie Lin     2020-01-20  447  	priv->switch_desc.allow_use=
rspace_control =3D true;
729149c53f048f Hanjie Lin     2020-01-20  448  	priv->switch_desc.set =3D d=
wc3_meson_g12a_role_set;
729149c53f048f Hanjie Lin     2020-01-20  449  	priv->switch_desc.get =3D d=
wc3_meson_g12a_role_get;
729149c53f048f Hanjie Lin     2020-01-20  450  =

729149c53f048f Hanjie Lin     2020-01-20  451  	priv->role_switch =3D usb_r=
ole_switch_register(dev, &priv->switch_desc);
729149c53f048f Hanjie Lin     2020-01-20  452  	if (IS_ERR(priv->role_switc=
h))
729149c53f048f Hanjie Lin     2020-01-20  453  		dev_warn(dev, "Unable to r=
egister Role Switch\n");
729149c53f048f Hanjie Lin     2020-01-20  454  =

729149c53f048f Hanjie Lin     2020-01-20 @455  	return ret;

"ret" can be uninitialized.  It should be "return 0;" anyway.

729149c53f048f Hanjie Lin     2020-01-20  456  }

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2690921604689516557==--

