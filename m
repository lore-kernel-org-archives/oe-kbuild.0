Content-Type: multipart/mixed; boundary="===============5170582677218384418=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: sound/pci/hda/cs35l41_hda.c:433 cs35l41_hda_probe() warn: missing error code 'ret'
Date: Tue, 09 Aug 2022 18:58:12 +0800
Message-ID: <202208091848.DFZpk6RX-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5170582677218384418==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Lucas Tanure <tanureal@opensource.cirrus.com>
CC: Takashi Iwai <tiwai@suse.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   eb555cb5b794f4e12a9897f3d46d5a72104cd4a7
commit: a025df02ce424fa77f6bc6aa195db21677e11274 ALSA: hda: cs35l41: Make u=
se of the helper function dev_err_probe()
date:   7 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 7 months ago
config: i386-randconfig-m021-20220808 (https://download.01.org/0day-ci/arch=
ive/20220809/202208091848.DFZpk6RX-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
sound/pci/hda/cs35l41_hda.c:433 cs35l41_hda_probe() warn: missing error cod=
e 'ret'

vim +/ret +433 sound/pci/hda/cs35l41_hda.c

7b2f3eb492dac76 Lucas Tanure   2021-12-17  401  =

7b2f3eb492dac76 Lucas Tanure   2021-12-17  402  int cs35l41_hda_probe(struc=
t device *dev, const char *device_name, int id, int irq,
7b2f3eb492dac76 Lucas Tanure   2021-12-17  403  		      struct regmap *regm=
ap)
7b2f3eb492dac76 Lucas Tanure   2021-12-17  404  {
7b2f3eb492dac76 Lucas Tanure   2021-12-17  405  	unsigned int int_sts, regi=
d, reg_revid, mtl_revid, chipid, int_status;
7b2f3eb492dac76 Lucas Tanure   2021-12-17  406  	struct cs35l41_hda_hw_conf=
ig *acpi_hw_cfg;
7b2f3eb492dac76 Lucas Tanure   2021-12-17  407  	struct cs35l41_hda *cs35l4=
1;
7b2f3eb492dac76 Lucas Tanure   2021-12-17  408  	int ret;
7b2f3eb492dac76 Lucas Tanure   2021-12-17  409  =

7b2f3eb492dac76 Lucas Tanure   2021-12-17  410  	if (IS_ERR(regmap))
7b2f3eb492dac76 Lucas Tanure   2021-12-17  411  		return PTR_ERR(regmap);
7b2f3eb492dac76 Lucas Tanure   2021-12-17  412  =

7b2f3eb492dac76 Lucas Tanure   2021-12-17  413  	cs35l41 =3D devm_kzalloc(d=
ev, sizeof(*cs35l41), GFP_KERNEL);
7b2f3eb492dac76 Lucas Tanure   2021-12-17  414  	if (!cs35l41)
7b2f3eb492dac76 Lucas Tanure   2021-12-17  415  		return -ENOMEM;
7b2f3eb492dac76 Lucas Tanure   2021-12-17  416  =

7b2f3eb492dac76 Lucas Tanure   2021-12-17  417  	cs35l41->dev =3D dev;
7b2f3eb492dac76 Lucas Tanure   2021-12-17  418  	cs35l41->irq =3D irq;
7b2f3eb492dac76 Lucas Tanure   2021-12-17  419  	cs35l41->regmap =3D regmap;
7b2f3eb492dac76 Lucas Tanure   2021-12-17  420  	dev_set_drvdata(dev, cs35l=
41);
7b2f3eb492dac76 Lucas Tanure   2021-12-17  421  =

7b2f3eb492dac76 Lucas Tanure   2021-12-17  422  	acpi_hw_cfg =3D cs35l41_hd=
a_read_acpi(cs35l41, device_name, id);
7b2f3eb492dac76 Lucas Tanure   2021-12-17  423  	if (IS_ERR(acpi_hw_cfg))
7b2f3eb492dac76 Lucas Tanure   2021-12-17  424  		return PTR_ERR(acpi_hw_cf=
g);
7b2f3eb492dac76 Lucas Tanure   2021-12-17  425  =

7b2f3eb492dac76 Lucas Tanure   2021-12-17  426  	if (IS_ERR(cs35l41->reset_=
gpio)) {
7b2f3eb492dac76 Lucas Tanure   2021-12-17  427  		ret =3D PTR_ERR(cs35l41->=
reset_gpio);
7b2f3eb492dac76 Lucas Tanure   2021-12-17  428  		cs35l41->reset_gpio =3D N=
ULL;
7b2f3eb492dac76 Lucas Tanure   2021-12-17  429  		if (ret =3D=3D -EBUSY) {
7b2f3eb492dac76 Lucas Tanure   2021-12-17  430  			dev_info(cs35l41->dev, "=
Reset line busy, assuming shared reset\n");
7b2f3eb492dac76 Lucas Tanure   2021-12-17  431  		} else {
a025df02ce424fa Lucas Tanure   2022-01-17  432  			dev_err_probe(cs35l41->d=
ev, ret, "Failed to get reset GPIO: %d\n", ret);
7b2f3eb492dac76 Lucas Tanure   2021-12-17 @433  			goto err;
7b2f3eb492dac76 Lucas Tanure   2021-12-17  434  		}
7b2f3eb492dac76 Lucas Tanure   2021-12-17  435  	}
7b2f3eb492dac76 Lucas Tanure   2021-12-17  436  	if (cs35l41->reset_gpio) {
7b2f3eb492dac76 Lucas Tanure   2021-12-17  437  		usleep_range(2000, 2100);
7b2f3eb492dac76 Lucas Tanure   2021-12-17  438  		gpiod_set_value_cansleep(=
cs35l41->reset_gpio, 1);
7b2f3eb492dac76 Lucas Tanure   2021-12-17  439  	}
7b2f3eb492dac76 Lucas Tanure   2021-12-17  440  =

7b2f3eb492dac76 Lucas Tanure   2021-12-17  441  	usleep_range(2000, 2100);
7b2f3eb492dac76 Lucas Tanure   2021-12-17  442  =

7b2f3eb492dac76 Lucas Tanure   2021-12-17  443  	ret =3D regmap_read_poll_t=
imeout(cs35l41->regmap, CS35L41_IRQ1_STATUS4, int_status,
7b2f3eb492dac76 Lucas Tanure   2021-12-17  444  				       int_status & CS3=
5L41_OTP_BOOT_DONE, 1000, 100000);
7b2f3eb492dac76 Lucas Tanure   2021-12-17  445  	if (ret) {
7b2f3eb492dac76 Lucas Tanure   2021-12-17  446  		dev_err(cs35l41->dev, "Fa=
iled waiting for OTP_BOOT_DONE: %d\n", ret);
7b2f3eb492dac76 Lucas Tanure   2021-12-17  447  		goto err;
7b2f3eb492dac76 Lucas Tanure   2021-12-17  448  	}
7b2f3eb492dac76 Lucas Tanure   2021-12-17  449  =

7b2f3eb492dac76 Lucas Tanure   2021-12-17  450  	ret =3D regmap_read(cs35l4=
1->regmap, CS35L41_IRQ1_STATUS3, &int_sts);
7b2f3eb492dac76 Lucas Tanure   2021-12-17  451  	if (ret || (int_sts & CS35=
L41_OTP_BOOT_ERR)) {
7b2f3eb492dac76 Lucas Tanure   2021-12-17  452  		dev_err(cs35l41->dev, "OT=
P Boot error\n");
7b2f3eb492dac76 Lucas Tanure   2021-12-17  453  		ret =3D -EIO;
7b2f3eb492dac76 Lucas Tanure   2021-12-17  454  		goto err;
7b2f3eb492dac76 Lucas Tanure   2021-12-17  455  	}
7b2f3eb492dac76 Lucas Tanure   2021-12-17  456  =

7b2f3eb492dac76 Lucas Tanure   2021-12-17  457  	ret =3D regmap_read(cs35l4=
1->regmap, CS35L41_DEVID, &regid);
7b2f3eb492dac76 Lucas Tanure   2021-12-17  458  	if (ret) {
7b2f3eb492dac76 Lucas Tanure   2021-12-17  459  		dev_err(cs35l41->dev, "Ge=
t Device ID failed: %d\n", ret);
7b2f3eb492dac76 Lucas Tanure   2021-12-17  460  		goto err;
7b2f3eb492dac76 Lucas Tanure   2021-12-17  461  	}
7b2f3eb492dac76 Lucas Tanure   2021-12-17  462  =

7b2f3eb492dac76 Lucas Tanure   2021-12-17  463  	ret =3D regmap_read(cs35l4=
1->regmap, CS35L41_REVID, &reg_revid);
7b2f3eb492dac76 Lucas Tanure   2021-12-17  464  	if (ret) {
7b2f3eb492dac76 Lucas Tanure   2021-12-17  465  		dev_err(cs35l41->dev, "Ge=
t Revision ID failed: %d\n", ret);
7b2f3eb492dac76 Lucas Tanure   2021-12-17  466  		goto err;
7b2f3eb492dac76 Lucas Tanure   2021-12-17  467  	}
7b2f3eb492dac76 Lucas Tanure   2021-12-17  468  =

7b2f3eb492dac76 Lucas Tanure   2021-12-17  469  	mtl_revid =3D reg_revid & =
CS35L41_MTLREVID_MASK;
7b2f3eb492dac76 Lucas Tanure   2021-12-17  470  =

7b2f3eb492dac76 Lucas Tanure   2021-12-17  471  	chipid =3D (mtl_revid % 2)=
 ? CS35L41R_CHIP_ID : CS35L41_CHIP_ID;
7b2f3eb492dac76 Lucas Tanure   2021-12-17  472  	if (regid !=3D chipid) {
7b2f3eb492dac76 Lucas Tanure   2021-12-17  473  		dev_err(cs35l41->dev, "CS=
35L41 Device ID (%X). Expected ID %X\n", regid, chipid);
7b2f3eb492dac76 Lucas Tanure   2021-12-17  474  		ret =3D -ENODEV;
7b2f3eb492dac76 Lucas Tanure   2021-12-17  475  		goto err;
7b2f3eb492dac76 Lucas Tanure   2021-12-17  476  	}
7b2f3eb492dac76 Lucas Tanure   2021-12-17  477  =

6e4320d8ecbc871 Charles Keepax 2022-01-17  478  	ret =3D cs35l41_test_key_u=
nlock(cs35l41->dev, cs35l41->regmap);
6e4320d8ecbc871 Charles Keepax 2022-01-17  479  	if (ret)
6e4320d8ecbc871 Charles Keepax 2022-01-17  480  		goto err;
6e4320d8ecbc871 Charles Keepax 2022-01-17  481  =

7b2f3eb492dac76 Lucas Tanure   2021-12-17  482  	ret =3D cs35l41_register_e=
rrata_patch(cs35l41->dev, cs35l41->regmap, reg_revid);
7b2f3eb492dac76 Lucas Tanure   2021-12-17  483  	if (ret)
7b2f3eb492dac76 Lucas Tanure   2021-12-17  484  		goto err;
7b2f3eb492dac76 Lucas Tanure   2021-12-17  485  =

7b2f3eb492dac76 Lucas Tanure   2021-12-17  486  	ret =3D cs35l41_otp_unpack=
(cs35l41->dev, cs35l41->regmap);
7b2f3eb492dac76 Lucas Tanure   2021-12-17  487  	if (ret) {
7b2f3eb492dac76 Lucas Tanure   2021-12-17  488  		dev_err(cs35l41->dev, "OT=
P Unpack failed: %d\n", ret);
7b2f3eb492dac76 Lucas Tanure   2021-12-17  489  		goto err;
7b2f3eb492dac76 Lucas Tanure   2021-12-17  490  	}
7b2f3eb492dac76 Lucas Tanure   2021-12-17  491  =

6e4320d8ecbc871 Charles Keepax 2022-01-17  492  	ret =3D cs35l41_test_key_l=
ock(cs35l41->dev, cs35l41->regmap);
6e4320d8ecbc871 Charles Keepax 2022-01-17  493  	if (ret)
6e4320d8ecbc871 Charles Keepax 2022-01-17  494  		goto err;
6e4320d8ecbc871 Charles Keepax 2022-01-17  495  =

7b2f3eb492dac76 Lucas Tanure   2021-12-17  496  	ret =3D cs35l41_hda_apply_=
properties(cs35l41, acpi_hw_cfg);
7b2f3eb492dac76 Lucas Tanure   2021-12-17  497  	if (ret)
7b2f3eb492dac76 Lucas Tanure   2021-12-17  498  		goto err;
7b2f3eb492dac76 Lucas Tanure   2021-12-17  499  	kfree(acpi_hw_cfg);
10b1a5a99c6ac42 Dan Carpenter  2022-01-11  500  	acpi_hw_cfg =3D NULL;
7b2f3eb492dac76 Lucas Tanure   2021-12-17  501  =

7b2f3eb492dac76 Lucas Tanure   2021-12-17  502  	if (cs35l41->reg_seq->prob=
e) {
2cb52046d186863 Charles Keepax 2022-01-17  503  		ret =3D regmap_multi_reg_=
write(cs35l41->regmap, cs35l41->reg_seq->probe,
7b2f3eb492dac76 Lucas Tanure   2021-12-17  504  					    cs35l41->reg_seq->=
num_probe);
7b2f3eb492dac76 Lucas Tanure   2021-12-17  505  		if (ret) {
7b2f3eb492dac76 Lucas Tanure   2021-12-17  506  			dev_err(cs35l41->dev, "F=
ail to apply probe reg patch: %d\n", ret);
7b2f3eb492dac76 Lucas Tanure   2021-12-17  507  			goto err;
7b2f3eb492dac76 Lucas Tanure   2021-12-17  508  		}
7b2f3eb492dac76 Lucas Tanure   2021-12-17  509  	}
7b2f3eb492dac76 Lucas Tanure   2021-12-17  510  =

7b2f3eb492dac76 Lucas Tanure   2021-12-17  511  	ret =3D component_add(cs35=
l41->dev, &cs35l41_hda_comp_ops);
7b2f3eb492dac76 Lucas Tanure   2021-12-17  512  	if (ret) {
7b2f3eb492dac76 Lucas Tanure   2021-12-17  513  		dev_err(cs35l41->dev, "Re=
gister component failed: %d\n", ret);
7b2f3eb492dac76 Lucas Tanure   2021-12-17  514  		goto err;
7b2f3eb492dac76 Lucas Tanure   2021-12-17  515  	}
7b2f3eb492dac76 Lucas Tanure   2021-12-17  516  =

7b2f3eb492dac76 Lucas Tanure   2021-12-17  517  	dev_info(cs35l41->dev, "Ci=
rrus Logic CS35L41 (%x), Revision: %02X\n", regid, reg_revid);
7b2f3eb492dac76 Lucas Tanure   2021-12-17  518  =

7b2f3eb492dac76 Lucas Tanure   2021-12-17  519  	return 0;
7b2f3eb492dac76 Lucas Tanure   2021-12-17  520  =

7b2f3eb492dac76 Lucas Tanure   2021-12-17  521  err:
7b2f3eb492dac76 Lucas Tanure   2021-12-17  522  	kfree(acpi_hw_cfg);
7b2f3eb492dac76 Lucas Tanure   2021-12-17  523  	if (!cs35l41->vspk_always_=
on)
7b2f3eb492dac76 Lucas Tanure   2021-12-17  524  		gpiod_set_value_cansleep(=
cs35l41->reset_gpio, 0);
7b2f3eb492dac76 Lucas Tanure   2021-12-17  525  	gpiod_put(cs35l41->reset_g=
pio);
7b2f3eb492dac76 Lucas Tanure   2021-12-17  526  =

7b2f3eb492dac76 Lucas Tanure   2021-12-17  527  	return ret;
7b2f3eb492dac76 Lucas Tanure   2021-12-17  528  }
77dc3a6ee2eb585 Lucas Tanure   2022-01-17  529  EXPORT_SYMBOL_NS_GPL(cs35l4=
1_hda_probe, SND_HDA_SCODEC_CS35L41);
7b2f3eb492dac76 Lucas Tanure   2021-12-17  530  =


:::::: The code at line 433 was first introduced by commit
:::::: 7b2f3eb492dac7665c75df067e4d8e4869589f4a ALSA: hda: cs35l41: Add sup=
port for CS35L41 in HDA systems

:::::: TO: Lucas Tanure <tanureal@opensource.cirrus.com>
:::::: CC: Takashi Iwai <tiwai@suse.de>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5170582677218384418==--

