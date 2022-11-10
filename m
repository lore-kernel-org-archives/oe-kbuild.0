Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3EE39D;
	Thu, 10 Nov 2022 06:48:24 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id v1so841347wrt.11;
        Wed, 09 Nov 2022 22:48:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mze53EJF5YpRztfmEpaxov9BYMEvO47aGYqekhadc2o=;
        b=SVRBQev8KFTZW5kFHjWoNn3WCYYOt1tHv0zmFt1FQp6gPMtD8vma8FPoIA5YoYC3Qw
         fE+EZyjKWADKeB4jImDx9Vr1LFPhPDO8GnFryVY+tbjJvFgch8fr84Tq8rx39Y8d2T7o
         FBkgm0GA9uVTwDrPPv2E6RYB7fP9Loc91658rZhrh8Mf372pOzGjVLOJ2jSeKkLapJz+
         u59yDBhCjgUUpLgMeadtJ8ke+ZZoBItDZhzXYgoqb/shlGL6UI257+QzEPRd4sMokG5Q
         6duJA/Iy2dwgi9ksDEjj3+nTx6C8gsD2E7HmUbud/4zEKOLaaq8Q6OKuIRl0GWG8h3Cb
         Jnuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mze53EJF5YpRztfmEpaxov9BYMEvO47aGYqekhadc2o=;
        b=6QmPeZfQgqF8UmdROKddBfyfnbXCW1m4Z9HBoFYTHeGwyX/Z/+ovKz9W3cNdOzp9vm
         ysmr+Dq7XVfhDhHbSxMhIC0STDeLoOhXq2X8KhIblvFoFU4umIDvgaoLtabgi47kklhf
         D/bMV2oQOq8fABK/mugDsw6wL8Md3qF6rGHc13mVJoSc7SVWi5WqftrlpWlfrC9lcbhu
         +NPr3EyzLKyCx63sZ0GaGN5VOY1F9HHFeVpm5HXfwFDl1ljRu8Rc+MZN8xwM4cLWnoQw
         Tw/x84Mmj+mOMvX8f2XrlAhJxj6UNhDtPc/HwU2mUxBdGYSP4VVj7YVzs3hkALomaJnG
         TXWA==
X-Gm-Message-State: ACrzQf3CjroC3s1usYsKMsNH/64F3OBCDKlYpnXdl1AIar7/Jgp7uVYo
	hh1KkrYLBOh8ThRKc9I6249+kT+XR77ByQ==
X-Google-Smtp-Source: AMsMyM5n+ilz8FUSm41Ux3xWqwNPlfg+hIKpXjZIoa7VDnS/OG4+RwQr8CAsT4EzL9Joj3KcAGW+Ow==
X-Received: by 2002:adf:f482:0:b0:236:7a2f:69f with SMTP id l2-20020adff482000000b002367a2f069fmr41219409wro.115.1668062901885;
        Wed, 09 Nov 2022 22:48:21 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id f17-20020a056000129100b002368a6deaf8sm15094748wrx.57.2022.11.09.22.48.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Nov 2022 22:48:21 -0800 (PST)
Date: Thu, 10 Nov 2022 09:48:16 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Otavio Salvador <otavio@ossystems.com.br>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/607 6148/18012] drivers/usb/chipidea/core.c:1241
 ci_hdrc_probe() warn: missing error code 'ret'
Message-ID: <202211100158.THRQoK0E-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20221110064816.5CO4YhlUe3YzQvu7cHSYQC41QxWz7nmKKhz6qw3yg1k@z>

tree:   https://github.com/Freescale/linux-fslc pr/607
head:   a5424cd6f6c063dc38eadbc0f9f95f594fb2ccbc
commit: 566b963afe39e39db89066642218674ab000c9ab [6148/18012] Merge remote-tracking branch 'origin/usb/phy' into usb/next
config: m68k-randconfig-m041-20221109
compiler: m68k-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
drivers/usb/chipidea/core.c:1241 ci_hdrc_probe() warn: missing error code 'ret'

vim +/ret +1241 drivers/usb/chipidea/core.c

41ac7b3ab7fe1d Bill Pemberton     2012-11-19  1048  static int ci_hdrc_probe(struct platform_device *pdev)
e443b333629f82 Alexander Shishkin 2012-05-11  1049  {
e443b333629f82 Alexander Shishkin 2012-05-11  1050  	struct device	*dev = &pdev->dev;
8e22978c57087a Alexander Shishkin 2013-06-24  1051  	struct ci_hdrc	*ci;
e443b333629f82 Alexander Shishkin 2012-05-11  1052  	struct resource	*res;
e443b333629f82 Alexander Shishkin 2012-05-11  1053  	void __iomem	*base;
e443b333629f82 Alexander Shishkin 2012-05-11  1054  	int		ret;
691962d1593a16 Sascha Hauer       2013-06-13  1055  	enum usb_dr_mode dr_mode;
e443b333629f82 Alexander Shishkin 2012-05-11  1056  
fad56745a64175 Jingoo Han         2014-02-19  1057  	if (!dev_get_platdata(dev)) {
e443b333629f82 Alexander Shishkin 2012-05-11  1058  		dev_err(dev, "platform data missing\n");
e443b333629f82 Alexander Shishkin 2012-05-11  1059  		return -ENODEV;
e443b333629f82 Alexander Shishkin 2012-05-11  1060  	}
e443b333629f82 Alexander Shishkin 2012-05-11  1061  
e443b333629f82 Alexander Shishkin 2012-05-11  1062  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
19290816c5fa3f Felipe Balbi       2013-03-30  1063  	base = devm_ioremap_resource(dev, res);
19290816c5fa3f Felipe Balbi       2013-03-30  1064  	if (IS_ERR(base))
19290816c5fa3f Felipe Balbi       2013-03-30  1065  		return PTR_ERR(base);
e443b333629f82 Alexander Shishkin 2012-05-11  1066  
5f36e231e9dbff Alexander Shishkin 2012-05-11  1067  	ci = devm_kzalloc(dev, sizeof(*ci), GFP_KERNEL);
d0f992498e82e6 Fabio Estevam      2014-11-26  1068  	if (!ci)
5f36e231e9dbff Alexander Shishkin 2012-05-11  1069  		return -ENOMEM;
5f36e231e9dbff Alexander Shishkin 2012-05-11  1070  
a5d906bb261cde Peter Chen         2016-11-15  1071  	spin_lock_init(&ci->lock);
5f36e231e9dbff Alexander Shishkin 2012-05-11  1072  	ci->dev = dev;
fad56745a64175 Jingoo Han         2014-02-19  1073  	ci->platdata = dev_get_platdata(dev);
ed8f8318d2ef3e Peter Chen         2014-01-10  1074  	ci->imx28_write_fix = !!(ci->platdata->flags &
ed8f8318d2ef3e Peter Chen         2014-01-10  1075  		CI_HDRC_IMX28_WRITE_FIX);
1f874edcb7318c Peter Chen         2015-02-11  1076  	ci->supports_runtime_pm = !!(ci->platdata->flags &
1f874edcb7318c Peter Chen         2015-02-11  1077  		CI_HDRC_SUPPORTS_RUNTIME_PM);
7bb7e9b1a4319d Stephen Boyd       2016-12-28  1078  	platform_set_drvdata(pdev, ci);
5f36e231e9dbff Alexander Shishkin 2012-05-11  1079  
5f36e231e9dbff Alexander Shishkin 2012-05-11  1080  	ret = hw_device_init(ci, base);
5f36e231e9dbff Alexander Shishkin 2012-05-11  1081  	if (ret < 0) {
5f36e231e9dbff Alexander Shishkin 2012-05-11  1082  		dev_err(dev, "can't initialize hardware\n");
5f36e231e9dbff Alexander Shishkin 2012-05-11  1083  		return -ENODEV;
5f36e231e9dbff Alexander Shishkin 2012-05-11  1084  	}
e443b333629f82 Alexander Shishkin 2012-05-11  1085  
7bb7e9b1a4319d Stephen Boyd       2016-12-28  1086  	ret = ci_ulpi_init(ci);
7bb7e9b1a4319d Stephen Boyd       2016-12-28  1087  	if (ret)
7bb7e9b1a4319d Stephen Boyd       2016-12-28  1088  		return ret;
7bb7e9b1a4319d Stephen Boyd       2016-12-28  1089  
1e5e2d3d055436 Antoine Tenart     2014-10-30  1090  	if (ci->platdata->phy) {
1e5e2d3d055436 Antoine Tenart     2014-10-30  1091  		ci->phy = ci->platdata->phy;
1e5e2d3d055436 Antoine Tenart     2014-10-30  1092  	} else if (ci->platdata->usb_phy) {
ef44cb4226d132 Antoine Tenart     2014-10-30  1093  		ci->usb_phy = ci->platdata->usb_phy;
1e5e2d3d055436 Antoine Tenart     2014-10-30  1094  	} else {
a3a47548332864 Paul Kocialkowski  2019-02-27  1095  		/* Look for a generic PHY first */
21a5b579cb6336 Antoine Tenart     2014-11-26  1096  		ci->phy = devm_phy_get(dev->parent, "usb-phy");
68ef2362747930 Paul Kocialkowski  2019-02-27  1097  
a3a47548332864 Paul Kocialkowski  2019-02-27  1098  		if (PTR_ERR(ci->phy) == -EPROBE_DEFER) {
a3a47548332864 Paul Kocialkowski  2019-02-27  1099  			ret = -EPROBE_DEFER;
7bb7e9b1a4319d Stephen Boyd       2016-12-28  1100  			goto ulpi_exit;
a3a47548332864 Paul Kocialkowski  2019-02-27  1101  		} else if (IS_ERR(ci->phy)) {
a3a47548332864 Paul Kocialkowski  2019-02-27  1102  			ci->phy = NULL;
7bb7e9b1a4319d Stephen Boyd       2016-12-28  1103  		}
c859aa65a7ec40 Peter Chen         2014-02-19  1104  
a3a47548332864 Paul Kocialkowski  2019-02-27  1105  		/* Look for a legacy USB PHY from device-tree next */
a3a47548332864 Paul Kocialkowski  2019-02-27  1106  		if (!ci->phy) {
a3a47548332864 Paul Kocialkowski  2019-02-27  1107  			ci->usb_phy = devm_usb_get_phy_by_phandle(dev->parent,
a3a47548332864 Paul Kocialkowski  2019-02-27  1108  								  "phys", 0);
a3a47548332864 Paul Kocialkowski  2019-02-27  1109  
a3a47548332864 Paul Kocialkowski  2019-02-27  1110  			if (PTR_ERR(ci->usb_phy) == -EPROBE_DEFER) {
7bb7e9b1a4319d Stephen Boyd       2016-12-28  1111  				ret = -EPROBE_DEFER;
7bb7e9b1a4319d Stephen Boyd       2016-12-28  1112  				goto ulpi_exit;
a3a47548332864 Paul Kocialkowski  2019-02-27  1113  			} else if (IS_ERR(ci->usb_phy)) {
a3a47548332864 Paul Kocialkowski  2019-02-27  1114  				ci->usb_phy = NULL;
a3a47548332864 Paul Kocialkowski  2019-02-27  1115  			}
7bb7e9b1a4319d Stephen Boyd       2016-12-28  1116  		}
1e5e2d3d055436 Antoine Tenart     2014-10-30  1117  
a3a47548332864 Paul Kocialkowski  2019-02-27  1118  		/* Look for any registered legacy USB PHY as last resort */
a3a47548332864 Paul Kocialkowski  2019-02-27  1119  		if (!ci->phy && !ci->usb_phy) {
a3a47548332864 Paul Kocialkowski  2019-02-27  1120  			ci->usb_phy = devm_usb_get_phy(dev->parent,
a3a47548332864 Paul Kocialkowski  2019-02-27  1121  						       USB_PHY_TYPE_USB2);
a3a47548332864 Paul Kocialkowski  2019-02-27  1122  
a3a47548332864 Paul Kocialkowski  2019-02-27  1123  			if (PTR_ERR(ci->usb_phy) == -EPROBE_DEFER) {
a3a47548332864 Paul Kocialkowski  2019-02-27  1124  				ret = -EPROBE_DEFER;
a3a47548332864 Paul Kocialkowski  2019-02-27  1125  				goto ulpi_exit;
a3a47548332864 Paul Kocialkowski  2019-02-27  1126  			} else if (IS_ERR(ci->usb_phy)) {
1e5e2d3d055436 Antoine Tenart     2014-10-30  1127  				ci->usb_phy = NULL;
c859aa65a7ec40 Peter Chen         2014-02-19  1128  			}
a3a47548332864 Paul Kocialkowski  2019-02-27  1129  		}
a3a47548332864 Paul Kocialkowski  2019-02-27  1130  
a3a47548332864 Paul Kocialkowski  2019-02-27  1131  		/* No USB PHY was found in the end */
a3a47548332864 Paul Kocialkowski  2019-02-27  1132  		if (!ci->phy && !ci->usb_phy) {
a3a47548332864 Paul Kocialkowski  2019-02-27  1133  			ret = -ENXIO;
a3a47548332864 Paul Kocialkowski  2019-02-27  1134  			goto ulpi_exit;
a3a47548332864 Paul Kocialkowski  2019-02-27  1135  		}
a3a47548332864 Paul Kocialkowski  2019-02-27  1136  	}
c859aa65a7ec40 Peter Chen         2014-02-19  1137  
d03cccff9c7683 Peter Chen         2014-04-23  1138  	ret = ci_usb_phy_init(ci);
74475ede784d4a Peter Chen         2013-09-24  1139  	if (ret) {
74475ede784d4a Peter Chen         2013-09-24  1140  		dev_err(dev, "unable to init phy: %d\n", ret);
74475ede784d4a Peter Chen         2013-09-24  1141  		return ret;
74475ede784d4a Peter Chen         2013-09-24  1142  	}
74475ede784d4a Peter Chen         2013-09-24  1143  
eb70e5ab8f95a8 Alexander Shishkin 2012-05-11  1144  	ci->hw_bank.phys = res->start;
eb70e5ab8f95a8 Alexander Shishkin 2012-05-11  1145  
5f36e231e9dbff Alexander Shishkin 2012-05-11  1146  	ci->irq = platform_get_irq(pdev, 0);
5f36e231e9dbff Alexander Shishkin 2012-05-11  1147  	if (ci->irq < 0) {
42d18212480157 Fabio Estevam      2014-02-19  1148  		ret = ci->irq;
c859aa65a7ec40 Peter Chen         2014-02-19  1149  		goto deinit_phy;
5f36e231e9dbff Alexander Shishkin 2012-05-11  1150  	}
5f36e231e9dbff Alexander Shishkin 2012-05-11  1151  
577b232fc9caba Peter Chen         2013-08-14  1152  	ci_get_otg_capable(ci);
577b232fc9caba Peter Chen         2013-08-14  1153  
691962d1593a16 Sascha Hauer       2013-06-13  1154  	dr_mode = ci->platdata->dr_mode;
5f36e231e9dbff Alexander Shishkin 2012-05-11  1155  	/* initialize role(s) before the interrupt is requested */
691962d1593a16 Sascha Hauer       2013-06-13  1156  	if (dr_mode == USB_DR_MODE_OTG || dr_mode == USB_DR_MODE_HOST) {
eb70e5ab8f95a8 Alexander Shishkin 2012-05-11  1157  		ret = ci_hdrc_host_init(ci);
c4a0bbbdb7f6e3 Jisheng Zhang      2017-04-26  1158  		if (ret) {
c4a0bbbdb7f6e3 Jisheng Zhang      2017-04-26  1159  			if (ret == -ENXIO)
eb70e5ab8f95a8 Alexander Shishkin 2012-05-11  1160  				dev_info(dev, "doesn't support host\n");
c4a0bbbdb7f6e3 Jisheng Zhang      2017-04-26  1161  			else
c4a0bbbdb7f6e3 Jisheng Zhang      2017-04-26  1162  				goto deinit_phy;
c4a0bbbdb7f6e3 Jisheng Zhang      2017-04-26  1163  		}
691962d1593a16 Sascha Hauer       2013-06-13  1164  	}
eb70e5ab8f95a8 Alexander Shishkin 2012-05-11  1165  
691962d1593a16 Sascha Hauer       2013-06-13  1166  	if (dr_mode == USB_DR_MODE_OTG || dr_mode == USB_DR_MODE_PERIPHERAL) {
5f36e231e9dbff Alexander Shishkin 2012-05-11  1167  		ret = ci_hdrc_gadget_init(ci);
c4a0bbbdb7f6e3 Jisheng Zhang      2017-04-26  1168  		if (ret) {
c4a0bbbdb7f6e3 Jisheng Zhang      2017-04-26  1169  			if (ret == -ENXIO)
5f36e231e9dbff Alexander Shishkin 2012-05-11  1170  				dev_info(dev, "doesn't support gadget\n");
c4a0bbbdb7f6e3 Jisheng Zhang      2017-04-26  1171  			else
c4a0bbbdb7f6e3 Jisheng Zhang      2017-04-26  1172  				goto deinit_host;
c4a0bbbdb7f6e3 Jisheng Zhang      2017-04-26  1173  		}
691962d1593a16 Sascha Hauer       2013-06-13  1174  	}
5f36e231e9dbff Alexander Shishkin 2012-05-11  1175  
5f36e231e9dbff Alexander Shishkin 2012-05-11  1176  	if (!ci->roles[CI_ROLE_HOST] && !ci->roles[CI_ROLE_GADGET]) {
5f36e231e9dbff Alexander Shishkin 2012-05-11  1177  		dev_err(dev, "no supported roles\n");
74475ede784d4a Peter Chen         2013-09-24  1178  		ret = -ENODEV;
c4a0bbbdb7f6e3 Jisheng Zhang      2017-04-26  1179  		goto deinit_gadget;
cbec6bd55a45fa Peter Chen         2013-08-14  1180  	}
cbec6bd55a45fa Peter Chen         2013-08-14  1181  
27c62c2da17717 Peter Chen         2014-09-22  1182  	if (ci->is_otg && ci->roles[CI_ROLE_GADGET]) {
cbec6bd55a45fa Peter Chen         2013-08-14  1183  		ret = ci_hdrc_otg_init(ci);
cbec6bd55a45fa Peter Chen         2013-08-14  1184  		if (ret) {
cbec6bd55a45fa Peter Chen         2013-08-14  1185  			dev_err(dev, "init otg fails, ret = %d\n", ret);
c4a0bbbdb7f6e3 Jisheng Zhang      2017-04-26  1186  			goto deinit_gadget;
cbec6bd55a45fa Peter Chen         2013-08-14  1187  		}
5f36e231e9dbff Alexander Shishkin 2012-05-11  1188  	}
5f36e231e9dbff Alexander Shishkin 2012-05-11  1189  
05559f10ed797b Li Jun             2019-08-26  1190  	if (ci_role_switch.fwnode) {
bce3052f0c1656 Heikki Krogerus    2020-03-02  1191  		ci_role_switch.driver_data = ci;
05559f10ed797b Li Jun             2019-08-26  1192  		ci->role_switch = usb_role_switch_register(dev,
05559f10ed797b Li Jun             2019-08-26  1193  					&ci_role_switch);
05559f10ed797b Li Jun             2019-08-26  1194  		if (IS_ERR(ci->role_switch)) {
05559f10ed797b Li Jun             2019-08-26  1195  			ret = PTR_ERR(ci->role_switch);
05559f10ed797b Li Jun             2019-08-26  1196  			goto deinit_otg;
05559f10ed797b Li Jun             2019-08-26  1197  		}
05559f10ed797b Li Jun             2019-08-26  1198  	}
05559f10ed797b Li Jun             2019-08-26  1199  
086bb8958bf846 Peter Chen         2020-02-17  1200  	ci->role = ci_get_role(ci);
961ea496facda6 Li Jun             2015-02-11  1201  	if (!ci_otg_is_fsm_mode(ci)) {
5a1e1456fc633d Peter Chen         2013-12-05  1202  		/* only update vbus status for peripheral */
5523f06a19502d Peter Chen         2020-02-10  1203  		if (ci->role == CI_ROLE_GADGET) {
5523f06a19502d Peter Chen         2020-02-10  1204  			/* Pull down DP for possible charger detection */
5523f06a19502d Peter Chen         2020-02-10  1205  			hw_write(ci, OP_USBCMD, USBCMD_RS, 0);
5a1e1456fc633d Peter Chen         2013-12-05  1206  			ci_handle_vbus_change(ci);
5523f06a19502d Peter Chen         2020-02-10  1207  		}
5a1e1456fc633d Peter Chen         2013-12-05  1208  
5f36e231e9dbff Alexander Shishkin 2012-05-11  1209  		ret = ci_role_start(ci, ci->role);
5f36e231e9dbff Alexander Shishkin 2012-05-11  1210  		if (ret) {
4dcf720c5d40b2 Li Jun             2014-04-23  1211  			dev_err(dev, "can't start %s role\n",
4dcf720c5d40b2 Li Jun             2014-04-23  1212  						ci_role(ci)->name);
cbec6bd55a45fa Peter Chen         2013-08-14  1213  			goto stop;
e443b333629f82 Alexander Shishkin 2012-05-11  1214  		}
4dcf720c5d40b2 Li Jun             2014-04-23  1215  	}
e443b333629f82 Alexander Shishkin 2012-05-11  1216  
4c503dd5fbdc33 Peter Chen         2014-11-26  1217  	ret = devm_request_irq(dev, ci->irq, ci_irq, IRQF_SHARED,
4c503dd5fbdc33 Peter Chen         2014-11-26  1218  			ci->platdata->name, ci);
5f36e231e9dbff Alexander Shishkin 2012-05-11  1219  	if (ret)
5f36e231e9dbff Alexander Shishkin 2012-05-11  1220  		goto stop;
e443b333629f82 Alexander Shishkin 2012-05-11  1221  
3ecb3e09b042e7 Ivan T. Ivanov     2015-09-07  1222  	ret = ci_extcon_register(ci);
3ecb3e09b042e7 Ivan T. Ivanov     2015-09-07  1223  	if (ret)
3ecb3e09b042e7 Ivan T. Ivanov     2015-09-07  1224  		goto stop;
3ecb3e09b042e7 Ivan T. Ivanov     2015-09-07  1225  
1f874edcb7318c Peter Chen         2015-02-11  1226  	if (ci->supports_runtime_pm) {
1f874edcb7318c Peter Chen         2015-02-11  1227  		pm_runtime_set_active(&pdev->dev);
1f874edcb7318c Peter Chen         2015-02-11  1228  		pm_runtime_enable(&pdev->dev);
1f874edcb7318c Peter Chen         2015-02-11  1229  		pm_runtime_set_autosuspend_delay(&pdev->dev, 2000);
1f874edcb7318c Peter Chen         2015-02-11  1230  		pm_runtime_mark_last_busy(ci->dev);
1f874edcb7318c Peter Chen         2015-02-11  1231  		pm_runtime_use_autosuspend(&pdev->dev);
1f874edcb7318c Peter Chen         2015-02-11  1232  	}
1f874edcb7318c Peter Chen         2015-02-11  1233  
4dcf720c5d40b2 Li Jun             2014-04-23  1234  	if (ci_otg_is_fsm_mode(ci))
4dcf720c5d40b2 Li Jun             2014-04-23  1235  		ci_hdrc_otg_fsm_start(ci);
4dcf720c5d40b2 Li Jun             2014-04-23  1236  
086bb8958bf846 Peter Chen         2020-02-17  1237  	/* Init workqueue for controller power lost handling */
086bb8958bf846 Peter Chen         2020-02-17  1238  	ci->power_lost_wq = create_freezable_workqueue("ci_power_lost");
086bb8958bf846 Peter Chen         2020-02-17  1239  	if (!ci->power_lost_wq) {
086bb8958bf846 Peter Chen         2020-02-17  1240  		dev_err(ci->dev, "can't create power_lost workqueue\n");
086bb8958bf846 Peter Chen         2020-02-17 @1241  		goto remove_debug;

ret = -ENOMEM;

086bb8958bf846 Peter Chen         2020-02-17  1242  	}
086bb8958bf846 Peter Chen         2020-02-17  1243  
086bb8958bf846 Peter Chen         2020-02-17  1244  	INIT_WORK(&ci->power_lost_work, ci_power_lost_work);
f8efa7665e66c1 Peter Chen         2015-02-11  1245  	device_set_wakeup_capable(&pdev->dev, true);
a61b75d10882b3 Greg Kroah-Hartman 2018-05-29  1246  	dbg_create_files(ci);
bb4e3e617faf6a Peter Chen         2017-03-14  1247  	mutex_init(&ci->mutex);
a932a8041ff994 Peter Chen         2017-03-27  1248  
adf0f735e61aae Alexander Shishkin 2013-03-30  1249  	return 0;
5f36e231e9dbff Alexander Shishkin 2012-05-11  1250  
086bb8958bf846 Peter Chen         2020-02-17  1251  remove_debug:
086bb8958bf846 Peter Chen         2020-02-17  1252  	dbg_remove_files(ci);
5f36e231e9dbff Alexander Shishkin 2012-05-11  1253  stop:
05559f10ed797b Li Jun             2019-08-26  1254  	if (ci->role_switch)
05559f10ed797b Li Jun             2019-08-26  1255  		usb_role_switch_unregister(ci->role_switch);
05559f10ed797b Li Jun             2019-08-26  1256  deinit_otg:
c4a0bbbdb7f6e3 Jisheng Zhang      2017-04-26  1257  	if (ci->is_otg && ci->roles[CI_ROLE_GADGET])
c4a0bbbdb7f6e3 Jisheng Zhang      2017-04-26  1258  		ci_hdrc_otg_destroy(ci);
c4a0bbbdb7f6e3 Jisheng Zhang      2017-04-26  1259  deinit_gadget:
c4a0bbbdb7f6e3 Jisheng Zhang      2017-04-26  1260  	ci_hdrc_gadget_destroy(ci);
c4a0bbbdb7f6e3 Jisheng Zhang      2017-04-26  1261  deinit_host:
c4a0bbbdb7f6e3 Jisheng Zhang      2017-04-26  1262  	ci_hdrc_host_destroy(ci);
c859aa65a7ec40 Peter Chen         2014-02-19  1263  deinit_phy:
1e5e2d3d055436 Antoine Tenart     2014-10-30  1264  	ci_usb_phy_exit(ci);
7bb7e9b1a4319d Stephen Boyd       2016-12-28  1265  ulpi_exit:
7bb7e9b1a4319d Stephen Boyd       2016-12-28  1266  	ci_ulpi_exit(ci);
e443b333629f82 Alexander Shishkin 2012-05-11  1267  
e443b333629f82 Alexander Shishkin 2012-05-11  1268  	return ret;
e443b333629f82 Alexander Shishkin 2012-05-11  1269  }

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

