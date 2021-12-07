Content-Type: multipart/mixed; boundary="===============7987260727478209972=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/extcon/extcon-usbc-tusb320.c:272 tusb320_extcon_probe() error: uninitialized symbol 'revision'.
Date: Tue, 07 Dec 2021 09:01:48 +0800
Message-ID: <202112070842.NcV9FwqW-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7987260727478209972==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Yassine Oudjana <y.oudjana@protonmail.com>
CC: Chanwoo Choi <cw00.choi@samsung.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   f80ef9e49fdfbfbc4197711230098b90e6b05a7e
commit: ce0320bd3872038569be360870e2d5251b975692 extcon: usbc-tusb320: Add =
support for TUSB320L
date:   6 weeks ago
:::::: branch date: 6 hours ago
:::::: commit date: 6 weeks ago
config: x86_64-randconfig-m001-20211206 (https://download.01.org/0day-ci/ar=
chive/20211207/202112070842.NcV9FwqW-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/extcon/extcon-usbc-tusb320.c:272 tusb320_extcon_probe() error: unin=
itialized symbol 'revision'.

vim +/revision +272 drivers/extcon/extcon-usbc-tusb320.c

06bc4ca115cddab Michael Auchter 2020-10-15  232  =

06bc4ca115cddab Michael Auchter 2020-10-15  233  static int tusb320_extcon_=
probe(struct i2c_client *client,
06bc4ca115cddab Michael Auchter 2020-10-15  234  				const struct i2c_devic=
e_id *id)
06bc4ca115cddab Michael Auchter 2020-10-15  235  {
06bc4ca115cddab Michael Auchter 2020-10-15  236  	struct tusb320_priv *priv;
ce0320bd3872038 Yassine Oudjana 2021-09-25  237  	const void *match_data;
ce0320bd3872038 Yassine Oudjana 2021-09-25  238  	unsigned int revision;
06bc4ca115cddab Michael Auchter 2020-10-15  239  	int ret;
06bc4ca115cddab Michael Auchter 2020-10-15  240  =

06bc4ca115cddab Michael Auchter 2020-10-15  241  	priv =3D devm_kzalloc(&cl=
ient->dev, sizeof(*priv), GFP_KERNEL);
06bc4ca115cddab Michael Auchter 2020-10-15  242  	if (!priv)
06bc4ca115cddab Michael Auchter 2020-10-15  243  		return -ENOMEM;
06bc4ca115cddab Michael Auchter 2020-10-15  244  	priv->dev =3D &client->de=
v;
06bc4ca115cddab Michael Auchter 2020-10-15  245  =

06bc4ca115cddab Michael Auchter 2020-10-15  246  	priv->regmap =3D devm_reg=
map_init_i2c(client, &tusb320_regmap_config);
06bc4ca115cddab Michael Auchter 2020-10-15  247  	if (IS_ERR(priv->regmap))
06bc4ca115cddab Michael Auchter 2020-10-15  248  		return PTR_ERR(priv->reg=
map);
06bc4ca115cddab Michael Auchter 2020-10-15  249  =

06bc4ca115cddab Michael Auchter 2020-10-15  250  	ret =3D tusb320_check_sig=
nature(priv);
06bc4ca115cddab Michael Auchter 2020-10-15  251  	if (ret)
06bc4ca115cddab Michael Auchter 2020-10-15  252  		return ret;
06bc4ca115cddab Michael Auchter 2020-10-15  253  =

ce0320bd3872038 Yassine Oudjana 2021-09-25  254  	match_data =3D device_get=
_match_data(&client->dev);
ce0320bd3872038 Yassine Oudjana 2021-09-25  255  	if (!match_data)
ce0320bd3872038 Yassine Oudjana 2021-09-25  256  		return -EINVAL;
ce0320bd3872038 Yassine Oudjana 2021-09-25  257  =

ce0320bd3872038 Yassine Oudjana 2021-09-25  258  	priv->ops =3D (struct tus=
b320_ops*)match_data;
ce0320bd3872038 Yassine Oudjana 2021-09-25  259  =

06bc4ca115cddab Michael Auchter 2020-10-15  260  	priv->edev =3D devm_extco=
n_dev_allocate(priv->dev, tusb320_extcon_cable);
06bc4ca115cddab Michael Auchter 2020-10-15  261  	if (IS_ERR(priv->edev)) {
06bc4ca115cddab Michael Auchter 2020-10-15  262  		dev_err(priv->dev, "fail=
ed to allocate extcon device\n");
06bc4ca115cddab Michael Auchter 2020-10-15  263  		return PTR_ERR(priv->ede=
v);
06bc4ca115cddab Michael Auchter 2020-10-15  264  	}
06bc4ca115cddab Michael Auchter 2020-10-15  265  =

ce0320bd3872038 Yassine Oudjana 2021-09-25  266  	if (priv->ops->get_revisi=
on) {
ce0320bd3872038 Yassine Oudjana 2021-09-25  267  		ret =3D priv->ops->get_r=
evision(priv, &revision);
ce0320bd3872038 Yassine Oudjana 2021-09-25  268  		if (ret)
ce0320bd3872038 Yassine Oudjana 2021-09-25  269  			dev_warn(priv->dev,
ce0320bd3872038 Yassine Oudjana 2021-09-25  270  				"failed to read revisi=
on register: %d\n", ret);
ce0320bd3872038 Yassine Oudjana 2021-09-25  271  		else
ce0320bd3872038 Yassine Oudjana 2021-09-25 @272  			dev_info(priv->dev, "ch=
ip revision %d\n", revision);
ce0320bd3872038 Yassine Oudjana 2021-09-25  273  	}
ce0320bd3872038 Yassine Oudjana 2021-09-25  274  =

06bc4ca115cddab Michael Auchter 2020-10-15  275  	ret =3D devm_extcon_dev_r=
egister(priv->dev, priv->edev);
06bc4ca115cddab Michael Auchter 2020-10-15  276  	if (ret < 0) {
06bc4ca115cddab Michael Auchter 2020-10-15  277  		dev_err(priv->dev, "fail=
ed to register extcon device\n");
06bc4ca115cddab Michael Auchter 2020-10-15  278  		return ret;
06bc4ca115cddab Michael Auchter 2020-10-15  279  	}
06bc4ca115cddab Michael Auchter 2020-10-15  280  =

06bc4ca115cddab Michael Auchter 2020-10-15  281  	extcon_set_property_capab=
ility(priv->edev, EXTCON_USB,
06bc4ca115cddab Michael Auchter 2020-10-15  282  				       EXTCON_PROP_USB=
_TYPEC_POLARITY);
06bc4ca115cddab Michael Auchter 2020-10-15  283  	extcon_set_property_capab=
ility(priv->edev, EXTCON_USB_HOST,
06bc4ca115cddab Michael Auchter 2020-10-15  284  				       EXTCON_PROP_USB=
_TYPEC_POLARITY);
06bc4ca115cddab Michael Auchter 2020-10-15  285  =

06bc4ca115cddab Michael Auchter 2020-10-15  286  	/* update initial state */
06bc4ca115cddab Michael Auchter 2020-10-15  287  	tusb320_irq_handler(clien=
t->irq, priv);
06bc4ca115cddab Michael Auchter 2020-10-15  288  =

70c55d6be634e5f Yassine Oudjana 2021-09-25  289  	/* Reset chip to its defa=
ult state */
70c55d6be634e5f Yassine Oudjana 2021-09-25  290  	ret =3D tusb320_reset(pri=
v);
70c55d6be634e5f Yassine Oudjana 2021-09-25  291  	if (ret)
70c55d6be634e5f Yassine Oudjana 2021-09-25  292  		dev_warn(priv->dev, "fai=
led to reset chip: %d\n", ret);
70c55d6be634e5f Yassine Oudjana 2021-09-25  293  	else
70c55d6be634e5f Yassine Oudjana 2021-09-25  294  		/*
70c55d6be634e5f Yassine Oudjana 2021-09-25  295  		 * State and polarity mi=
ght change after a reset, so update
70c55d6be634e5f Yassine Oudjana 2021-09-25  296  		 * them again and make s=
ure the interrupt status bit is cleared.
70c55d6be634e5f Yassine Oudjana 2021-09-25  297  		 */
70c55d6be634e5f Yassine Oudjana 2021-09-25  298  		tusb320_irq_handler(clie=
nt->irq, priv);
70c55d6be634e5f Yassine Oudjana 2021-09-25  299  =

06bc4ca115cddab Michael Auchter 2020-10-15  300  	ret =3D devm_request_thre=
aded_irq(priv->dev, client->irq, NULL,
06bc4ca115cddab Michael Auchter 2020-10-15  301  					tusb320_irq_handler,
06bc4ca115cddab Michael Auchter 2020-10-15  302  					IRQF_TRIGGER_FALLING =
| IRQF_ONESHOT,
06bc4ca115cddab Michael Auchter 2020-10-15  303  					client->name, priv);
06bc4ca115cddab Michael Auchter 2020-10-15  304  =

06bc4ca115cddab Michael Auchter 2020-10-15  305  	return ret;
06bc4ca115cddab Michael Auchter 2020-10-15  306  }
06bc4ca115cddab Michael Auchter 2020-10-15  307  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7987260727478209972==--

