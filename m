Content-Type: multipart/mixed; boundary="===============0464089148069779144=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 781/11208] sound/pci/hda/cs35l41_hda.c:475 cs35l41_hda_probe() warn: missing error code 'ret'
Date: Tue, 19 Jul 2022 08:07:42 +0800
Message-ID: <202207190809.nlH14kAl-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0464089148069779144==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Cezary Rojewski <cezary.rojewski@intel.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   036ad6daa8f0fd357af7f50f9da58539eaa6f68c
commit: b5df2a7dca1cc6c66eee0005c92094855dc2028c [781/11208] ASoC: codecs: =
Add HD-Audio codec driver
:::::: branch date: 13 hours ago
:::::: commit date: 6 weeks ago
config: i386-randconfig-m041-20220718 (https://download.01.org/0day-ci/arch=
ive/20220719/202207190809.nlH14kAl-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
sound/pci/hda/cs35l41_hda.c:475 cs35l41_hda_probe() warn: missing error cod=
e 'ret'

vim +/ret +475 sound/pci/hda/cs35l41_hda.c

7b2f3eb492dac7 Lucas Tanure   2021-12-17  439  =

7b2f3eb492dac7 Lucas Tanure   2021-12-17  440  int cs35l41_hda_probe(struct=
 device *dev, const char *device_name, int id, int irq,
7b2f3eb492dac7 Lucas Tanure   2021-12-17  441  		      struct regmap *regma=
p)
7b2f3eb492dac7 Lucas Tanure   2021-12-17  442  {
7b2f3eb492dac7 Lucas Tanure   2021-12-17  443  	unsigned int int_sts, regid=
, reg_revid, mtl_revid, chipid, int_status;
7b2f3eb492dac7 Lucas Tanure   2021-12-17  444  	struct cs35l41_hda *cs35l41;
7b2f3eb492dac7 Lucas Tanure   2021-12-17  445  	int ret;
7b2f3eb492dac7 Lucas Tanure   2021-12-17  446  =

aa4a38af97e9f1 Stefan Binding 2022-05-09  447  	BUILD_BUG_ON(ARRAY_SIZE(cs3=
5l41_irqs) !=3D ARRAY_SIZE(cs35l41_reg_irqs));
aa4a38af97e9f1 Stefan Binding 2022-05-09  448  	BUILD_BUG_ON(ARRAY_SIZE(cs3=
5l41_irqs) !=3D CS35L41_NUM_IRQ);
aa4a38af97e9f1 Stefan Binding 2022-05-09  449  =

7b2f3eb492dac7 Lucas Tanure   2021-12-17  450  	if (IS_ERR(regmap))
7b2f3eb492dac7 Lucas Tanure   2021-12-17  451  		return PTR_ERR(regmap);
7b2f3eb492dac7 Lucas Tanure   2021-12-17  452  =

7b2f3eb492dac7 Lucas Tanure   2021-12-17  453  	cs35l41 =3D devm_kzalloc(de=
v, sizeof(*cs35l41), GFP_KERNEL);
7b2f3eb492dac7 Lucas Tanure   2021-12-17  454  	if (!cs35l41)
7b2f3eb492dac7 Lucas Tanure   2021-12-17  455  		return -ENOMEM;
7b2f3eb492dac7 Lucas Tanure   2021-12-17  456  =

7b2f3eb492dac7 Lucas Tanure   2021-12-17  457  	cs35l41->dev =3D dev;
7b2f3eb492dac7 Lucas Tanure   2021-12-17  458  	cs35l41->irq =3D irq;
7b2f3eb492dac7 Lucas Tanure   2021-12-17  459  	cs35l41->regmap =3D regmap;
7b2f3eb492dac7 Lucas Tanure   2021-12-17  460  	dev_set_drvdata(dev, cs35l4=
1);
7b2f3eb492dac7 Lucas Tanure   2021-12-17  461  =

f7f207375d4e6e Lucas Tanure   2022-04-13  462  	ret =3D cs35l41_hda_read_ac=
pi(cs35l41, device_name, id);
f7f207375d4e6e Lucas Tanure   2022-04-13  463  	if (ret) {
f7f207375d4e6e Lucas Tanure   2022-04-13  464  		dev_err_probe(cs35l41->dev=
, ret, "Platform not supported %d\n", ret);
f7f207375d4e6e Lucas Tanure   2022-04-13  465  		return ret;
f7f207375d4e6e Lucas Tanure   2022-04-13  466  	}
7b2f3eb492dac7 Lucas Tanure   2021-12-17  467  =

7b2f3eb492dac7 Lucas Tanure   2021-12-17  468  	if (IS_ERR(cs35l41->reset_g=
pio)) {
7b2f3eb492dac7 Lucas Tanure   2021-12-17  469  		ret =3D PTR_ERR(cs35l41->r=
eset_gpio);
7b2f3eb492dac7 Lucas Tanure   2021-12-17  470  		cs35l41->reset_gpio =3D NU=
LL;
7b2f3eb492dac7 Lucas Tanure   2021-12-17  471  		if (ret =3D=3D -EBUSY) {
7b2f3eb492dac7 Lucas Tanure   2021-12-17  472  			dev_info(cs35l41->dev, "R=
eset line busy, assuming shared reset\n");
7b2f3eb492dac7 Lucas Tanure   2021-12-17  473  		} else {
a025df02ce424f Lucas Tanure   2022-01-17  474  			dev_err_probe(cs35l41->de=
v, ret, "Failed to get reset GPIO: %d\n", ret);
7b2f3eb492dac7 Lucas Tanure   2021-12-17 @475  			goto err;
7b2f3eb492dac7 Lucas Tanure   2021-12-17  476  		}
7b2f3eb492dac7 Lucas Tanure   2021-12-17  477  	}
7b2f3eb492dac7 Lucas Tanure   2021-12-17  478  	if (cs35l41->reset_gpio) {
7b2f3eb492dac7 Lucas Tanure   2021-12-17  479  		usleep_range(2000, 2100);
7b2f3eb492dac7 Lucas Tanure   2021-12-17  480  		gpiod_set_value_cansleep(c=
s35l41->reset_gpio, 1);
7b2f3eb492dac7 Lucas Tanure   2021-12-17  481  	}
7b2f3eb492dac7 Lucas Tanure   2021-12-17  482  =

7b2f3eb492dac7 Lucas Tanure   2021-12-17  483  	usleep_range(2000, 2100);
7b2f3eb492dac7 Lucas Tanure   2021-12-17  484  =

7b2f3eb492dac7 Lucas Tanure   2021-12-17  485  	ret =3D regmap_read_poll_ti=
meout(cs35l41->regmap, CS35L41_IRQ1_STATUS4, int_status,
7b2f3eb492dac7 Lucas Tanure   2021-12-17  486  				       int_status & CS35=
L41_OTP_BOOT_DONE, 1000, 100000);
7b2f3eb492dac7 Lucas Tanure   2021-12-17  487  	if (ret) {
7b2f3eb492dac7 Lucas Tanure   2021-12-17  488  		dev_err(cs35l41->dev, "Fai=
led waiting for OTP_BOOT_DONE: %d\n", ret);
7b2f3eb492dac7 Lucas Tanure   2021-12-17  489  		goto err;
7b2f3eb492dac7 Lucas Tanure   2021-12-17  490  	}
7b2f3eb492dac7 Lucas Tanure   2021-12-17  491  =

7b2f3eb492dac7 Lucas Tanure   2021-12-17  492  	ret =3D regmap_read(cs35l41=
->regmap, CS35L41_IRQ1_STATUS3, &int_sts);
7b2f3eb492dac7 Lucas Tanure   2021-12-17  493  	if (ret || (int_sts & CS35L=
41_OTP_BOOT_ERR)) {
8c286a0f973a81 Lucas Tanure   2022-01-17  494  		dev_err(cs35l41->dev, "OTP=
 Boot status %x error: %d\n",
8c286a0f973a81 Lucas Tanure   2022-01-17  495  			int_sts & CS35L41_OTP_BOO=
T_ERR, ret);
7b2f3eb492dac7 Lucas Tanure   2021-12-17  496  		ret =3D -EIO;
7b2f3eb492dac7 Lucas Tanure   2021-12-17  497  		goto err;
7b2f3eb492dac7 Lucas Tanure   2021-12-17  498  	}
7b2f3eb492dac7 Lucas Tanure   2021-12-17  499  =

7b2f3eb492dac7 Lucas Tanure   2021-12-17  500  	ret =3D regmap_read(cs35l41=
->regmap, CS35L41_DEVID, &regid);
7b2f3eb492dac7 Lucas Tanure   2021-12-17  501  	if (ret) {
7b2f3eb492dac7 Lucas Tanure   2021-12-17  502  		dev_err(cs35l41->dev, "Get=
 Device ID failed: %d\n", ret);
7b2f3eb492dac7 Lucas Tanure   2021-12-17  503  		goto err;
7b2f3eb492dac7 Lucas Tanure   2021-12-17  504  	}
7b2f3eb492dac7 Lucas Tanure   2021-12-17  505  =

7b2f3eb492dac7 Lucas Tanure   2021-12-17  506  	ret =3D regmap_read(cs35l41=
->regmap, CS35L41_REVID, &reg_revid);
7b2f3eb492dac7 Lucas Tanure   2021-12-17  507  	if (ret) {
7b2f3eb492dac7 Lucas Tanure   2021-12-17  508  		dev_err(cs35l41->dev, "Get=
 Revision ID failed: %d\n", ret);
7b2f3eb492dac7 Lucas Tanure   2021-12-17  509  		goto err;
7b2f3eb492dac7 Lucas Tanure   2021-12-17  510  	}
7b2f3eb492dac7 Lucas Tanure   2021-12-17  511  =

7b2f3eb492dac7 Lucas Tanure   2021-12-17  512  	mtl_revid =3D reg_revid & C=
S35L41_MTLREVID_MASK;
7b2f3eb492dac7 Lucas Tanure   2021-12-17  513  =

7b2f3eb492dac7 Lucas Tanure   2021-12-17  514  	chipid =3D (mtl_revid % 2) =
? CS35L41R_CHIP_ID : CS35L41_CHIP_ID;
7b2f3eb492dac7 Lucas Tanure   2021-12-17  515  	if (regid !=3D chipid) {
7b2f3eb492dac7 Lucas Tanure   2021-12-17  516  		dev_err(cs35l41->dev, "CS3=
5L41 Device ID (%X). Expected ID %X\n", regid, chipid);
7b2f3eb492dac7 Lucas Tanure   2021-12-17  517  		ret =3D -ENODEV;
7b2f3eb492dac7 Lucas Tanure   2021-12-17  518  		goto err;
7b2f3eb492dac7 Lucas Tanure   2021-12-17  519  	}
7b2f3eb492dac7 Lucas Tanure   2021-12-17  520  =

6e4320d8ecbc87 Charles Keepax 2022-01-17  521  	ret =3D cs35l41_test_key_un=
lock(cs35l41->dev, cs35l41->regmap);
6e4320d8ecbc87 Charles Keepax 2022-01-17  522  	if (ret)
6e4320d8ecbc87 Charles Keepax 2022-01-17  523  		goto err;
6e4320d8ecbc87 Charles Keepax 2022-01-17  524  =

7b2f3eb492dac7 Lucas Tanure   2021-12-17  525  	ret =3D cs35l41_register_er=
rata_patch(cs35l41->dev, cs35l41->regmap, reg_revid);
7b2f3eb492dac7 Lucas Tanure   2021-12-17  526  	if (ret)
7b2f3eb492dac7 Lucas Tanure   2021-12-17  527  		goto err;
7b2f3eb492dac7 Lucas Tanure   2021-12-17  528  =

7b2f3eb492dac7 Lucas Tanure   2021-12-17  529  	ret =3D cs35l41_otp_unpack(=
cs35l41->dev, cs35l41->regmap);
7b2f3eb492dac7 Lucas Tanure   2021-12-17  530  	if (ret) {
7b2f3eb492dac7 Lucas Tanure   2021-12-17  531  		dev_err(cs35l41->dev, "OTP=
 Unpack failed: %d\n", ret);
7b2f3eb492dac7 Lucas Tanure   2021-12-17  532  		goto err;
7b2f3eb492dac7 Lucas Tanure   2021-12-17  533  	}
7b2f3eb492dac7 Lucas Tanure   2021-12-17  534  =

6e4320d8ecbc87 Charles Keepax 2022-01-17  535  	ret =3D cs35l41_test_key_lo=
ck(cs35l41->dev, cs35l41->regmap);
6e4320d8ecbc87 Charles Keepax 2022-01-17  536  	if (ret)
6e4320d8ecbc87 Charles Keepax 2022-01-17  537  		goto err;
6e4320d8ecbc87 Charles Keepax 2022-01-17  538  =

f7f207375d4e6e Lucas Tanure   2022-04-13  539  	ret =3D cs35l41_hda_apply_p=
roperties(cs35l41);
7b2f3eb492dac7 Lucas Tanure   2021-12-17  540  	if (ret)
7b2f3eb492dac7 Lucas Tanure   2021-12-17  541  		goto err;
7b2f3eb492dac7 Lucas Tanure   2021-12-17  542  =

7b2f3eb492dac7 Lucas Tanure   2021-12-17  543  	ret =3D component_add(cs35l=
41->dev, &cs35l41_hda_comp_ops);
7b2f3eb492dac7 Lucas Tanure   2021-12-17  544  	if (ret) {
7b2f3eb492dac7 Lucas Tanure   2021-12-17  545  		dev_err(cs35l41->dev, "Reg=
ister component failed: %d\n", ret);
7b2f3eb492dac7 Lucas Tanure   2021-12-17  546  		goto err;
7b2f3eb492dac7 Lucas Tanure   2021-12-17  547  	}
7b2f3eb492dac7 Lucas Tanure   2021-12-17  548  =

7b2f3eb492dac7 Lucas Tanure   2021-12-17  549  	dev_info(cs35l41->dev, "Cir=
rus Logic CS35L41 (%x), Revision: %02X\n", regid, reg_revid);
7b2f3eb492dac7 Lucas Tanure   2021-12-17  550  =

7b2f3eb492dac7 Lucas Tanure   2021-12-17  551  	return 0;
7b2f3eb492dac7 Lucas Tanure   2021-12-17  552  =

7b2f3eb492dac7 Lucas Tanure   2021-12-17  553  err:
5577dd2329d03e Lucas Tanure   2022-04-13  554  	if (cs35l41_safe_reset(cs35=
l41->regmap, cs35l41->hw_cfg.bst_type))
7b2f3eb492dac7 Lucas Tanure   2021-12-17  555  		gpiod_set_value_cansleep(c=
s35l41->reset_gpio, 0);
7b2f3eb492dac7 Lucas Tanure   2021-12-17  556  	gpiod_put(cs35l41->reset_gp=
io);
7b2f3eb492dac7 Lucas Tanure   2021-12-17  557  =

7b2f3eb492dac7 Lucas Tanure   2021-12-17  558  	return ret;
7b2f3eb492dac7 Lucas Tanure   2021-12-17  559  }
77dc3a6ee2eb58 Lucas Tanure   2022-01-17  560  EXPORT_SYMBOL_NS_GPL(cs35l41=
_hda_probe, SND_HDA_SCODEC_CS35L41);
7b2f3eb492dac7 Lucas Tanure   2021-12-17  561  =


:::::: The code at line 475 was first introduced by commit
:::::: 7b2f3eb492dac7665c75df067e4d8e4869589f4a ALSA: hda: cs35l41: Add sup=
port for CS35L41 in HDA systems

:::::: TO: Lucas Tanure <tanureal@opensource.cirrus.com>
:::::: CC: Takashi Iwai <tiwai@suse.de>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0464089148069779144==--

