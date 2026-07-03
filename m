Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65FB6371D0A
	for <oe-kbuild@lists.linux.dev>; Fri,  3 Jul 2026 08:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783066504; cv=none; b=VFgBl4wBswzDSozFhjRXVaXGGiQuTfI1LqX8JhhoJOfLqUjhG7uJnH04WX9Loe6UsNJG6cP7N5vUyqziFRE1uBRJ3w3vYdGUcLmzpoUVvWfTv5LmbcnvHRHCQuv7hImyIRYyr26Ra8tHaBYfuBDuPLYyo5tcqy1ALRZliroeljY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783066504; c=relaxed/simple;
	bh=DTqELlVhRELURRmDUlmU22dUgkTfDjVjBiYNzH0/fu4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=AzTno4q1TgUJ6UhUtcPl9ny8px1+tR2x+5+hODEe9ysR7Hiy6qz1NcpsuDhqLPc8Enmzsxq8sWwqZqFDzzhmeUVratPKzY6R62/ooLCT4YzPej0pqKAH9RSVYYkE29MS43B0txxYXatK8ACrLnXQTiFTrBsy9RN3XmvvkN6MkXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LrMLX4Kc; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LrMLX4Kc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783066502; x=1814602502;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=DTqELlVhRELURRmDUlmU22dUgkTfDjVjBiYNzH0/fu4=;
  b=LrMLX4KcQigqi0GeuwnZ0c/KPImEnd2KOWkb7u0H4f4kZ0B8in6ukOLy
   iXd3nOlGQnmIMQRc6KWG2Se6sr32TyQQtWQOqMRcG/vca50KY4d5yNCuP
   4PADdYO98gQq5EgT4AqtDxWwFyP2XXBzRB7x3vkte5m3jn0Wul+gPAXGV
   iI/gs8Hio7cUPGIeTDiUYV7hwrLbekVM+AgEoAg9RNWTH5aNcqgLQqc3M
   NxCuu6vJIz/OFDThN0lMkkvKmOCjc3L/FTVgK/Qiw26DlazlJDO9bmBuU
   4F+FBYNE3Cr/gAtcfDYfVtiyKT3/ioO/nb8ULu7KjmD3OOGEVtTSN31f/
   A==;
X-CSE-ConnectionGUID: qTLKHVmqRCuKKH84Ey6BOQ==
X-CSE-MsgGUID: WV1X5wNLR32yI6Z2/NPvjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="83801482"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="83801482"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 01:15:01 -0700
X-CSE-ConnectionGUID: RRGNboBKRMWreQ2yAKHDuw==
X-CSE-MsgGUID: Vwc4J4pZSNKuj9ogsMyB+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="248607323"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 03 Jul 2026 01:15:00 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfZ33-00000000Br5-49Xl;
	Fri, 03 Jul 2026 08:14:57 +0000
Date: Fri, 03 Jul 2026 16:14:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/usb/chipidea/ci_hdrc_imx.c:532 ci_hdrc_imx_probe()
 warn: missing error code 'ret'
Message-ID: <202607031656.FR3Xrved-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Xu Yang <xu.yang_2@nxp.com>
CC: Frank Li <Frank.Li@nxp.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   51512e22efe813d8223de27f6fd02a8a48ea2323
commit: 2e9762f45efb53e7e7fc61f4ebf7a3507f5daa45 usb: chipidea: ci_hdrc_imx=
: use "wakeup" suffix for wakeup interrupt name
date:   6 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 6 months ago
config: microblaze-randconfig-r072-20260703 (https://download.01.org/0day-c=
i/archive/20260703/202607031656.FR3Xrved-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 14.3.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: 2e9762f45efb ("usb: chipidea: ci_hdrc_imx: use "wakeup" suffix for=
 wakeup interrupt name")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607031656.FR3Xrved-lkp@intel.com/

smatch warnings:
drivers/usb/chipidea/ci_hdrc_imx.c:532 ci_hdrc_imx_probe() warn: missing er=
ror code 'ret'

vim +/ret +532 drivers/usb/chipidea/ci_hdrc_imx.c

8cab0e9a3f3e8d drivers/usb/chipidea/ci_hdrc_imx.c Fedor Pchelkin      2025-=
03-16  374 =20
8e22978c57087a drivers/usb/chipidea/ci_hdrc_imx.c Alexander Shishkin  2013-=
06-24  375  static int ci_hdrc_imx_probe(struct platform_device *pdev)
f6a3b3a37c4772 drivers/usb/chipidea/ci13xxx_imx.c Michael Grzeschik   2013-=
06-13  376  {
8e22978c57087a drivers/usb/chipidea/ci_hdrc_imx.c Alexander Shishkin  2013-=
06-24  377  	struct ci_hdrc_imx_data *data;
8e22978c57087a drivers/usb/chipidea/ci_hdrc_imx.c Alexander Shishkin  2013-=
06-24  378  	struct ci_hdrc_platform_data pdata =3D {
c844d6c884f372 drivers/usb/chipidea/ci_hdrc_imx.c Alexander Shiyan    2014-=
03-11  379  		.name		=3D dev_name(&pdev->dev),
f6a3b3a37c4772 drivers/usb/chipidea/ci13xxx_imx.c Michael Grzeschik   2013-=
06-13  380  		.capoffset	=3D DEF_CAPOFFSET,
ec841b8d73cff3 drivers/usb/chipidea/ci_hdrc_imx.c Xu Yang             2024-=
09-23  381  		.flags		=3D CI_HDRC_HAS_SHORT_PKT_LIMIT,
7c8e8909417eb6 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2018-=
10-16  382  		.notify_event	=3D ci_hdrc_imx_notify_event,
1530280084c390 drivers/usb/chipidea/ci13xxx_imx.c Richard Zhao        2012-=
07-07  383  	};
1530280084c390 drivers/usb/chipidea/ci13xxx_imx.c Richard Zhao        2012-=
07-07  384  	int ret;
6f51bc340d2a1c drivers/usb/chipidea/ci_hdrc_imx.c LABBE Corentin      2015-=
11-12  385  	const struct ci_hdrc_imx_platform_flag *imx_platform_flag;
be9cae2479f48d drivers/usb/chipidea/ci_hdrc_imx.c Sebastian Reichel   2018-=
03-29  386  	struct device_node *np =3D pdev->dev.of_node;
7c8e8909417eb6 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2018-=
10-16  387  	struct device *dev =3D &pdev->dev;
2e9762f45efb53 drivers/usb/chipidea/ci_hdrc_imx.c Xu Yang             2026-=
01-12  388  	const char *irq_name;
6f51bc340d2a1c drivers/usb/chipidea/ci_hdrc_imx.c LABBE Corentin      2015-=
11-12  389 =20
59b7c6a8fd6c44 drivers/usb/chipidea/ci_hdrc_imx.c Fabio Estevam       2020-=
11-24  390  	imx_platform_flag =3D of_device_get_match_data(&pdev->dev);
1530280084c390 drivers/usb/chipidea/ci13xxx_imx.c Richard Zhao        2012-=
07-07  391 =20
1530280084c390 drivers/usb/chipidea/ci13xxx_imx.c Richard Zhao        2012-=
07-07  392  	data =3D devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
73529828cf896d drivers/usb/chipidea/ci_hdrc_imx.c Fabio Estevam       2014-=
11-26  393  	if (!data)
1530280084c390 drivers/usb/chipidea/ci13xxx_imx.c Richard Zhao        2012-=
07-07  394  		return -ENOMEM;
1530280084c390 drivers/usb/chipidea/ci13xxx_imx.c Richard Zhao        2012-=
07-07  395 =20
d1609c312d42f3 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2019-=
04-28  396  	data->plat_data =3D imx_platform_flag;
d1609c312d42f3 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2019-=
04-28  397  	pdata.flags |=3D imx_platform_flag->flags;
ae3e57ae26cdcc drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2015-=
09-16  398  	platform_set_drvdata(pdev, data);
7c8e8909417eb6 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2018-=
10-16  399  	data->usbmisc_data =3D usbmisc_get_init_data(dev);
05986ba9b025ae drivers/usb/chipidea/ci_hdrc_imx.c Sascha Hauer        2013-=
08-14  400  	if (IS_ERR(data->usbmisc_data))
05986ba9b025ae drivers/usb/chipidea/ci_hdrc_imx.c Sascha Hauer        2013-=
08-14  401  		return PTR_ERR(data->usbmisc_data);
05986ba9b025ae drivers/usb/chipidea/ci_hdrc_imx.c Sascha Hauer        2013-=
08-14  402 =20
8ff396fe56f559 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2019-=
01-17  403  	if ((of_usb_get_phy_mode(dev->of_node) =3D=3D USBPHY_INTERFACE=
_MODE_HSIC)
8ff396fe56f559 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2019-=
01-17  404  		&& data->usbmisc_data) {
7c8e8909417eb6 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2018-=
10-16  405  		pdata.flags |=3D CI_HDRC_IMX_IS_HSIC;
7c8e8909417eb6 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2018-=
10-16  406  		data->usbmisc_data->hsic =3D 1;
7c8e8909417eb6 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2018-=
10-16  407  		data->pinctrl =3D devm_pinctrl_get(dev);
3f4aad6e1a4c26 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2019-=
10-10  408  		if (PTR_ERR(data->pinctrl) =3D=3D -ENODEV)
3f4aad6e1a4c26 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2019-=
10-10  409  			data->pinctrl =3D NULL;
74adad500346fb drivers/usb/chipidea/ci_hdrc_imx.c Joe Hattori         2024-=
12-16  410  		else if (IS_ERR(data->pinctrl)) {
74adad500346fb drivers/usb/chipidea/ci_hdrc_imx.c Joe Hattori         2024-=
12-16  411  			ret =3D dev_err_probe(dev, PTR_ERR(data->pinctrl),
18171cfc3c236a drivers/usb/chipidea/ci_hdrc_imx.c Alexander Stein     2022-=
06-14  412  					     "pinctrl get failed\n");
74adad500346fb drivers/usb/chipidea/ci_hdrc_imx.c Joe Hattori         2024-=
12-16  413  			goto err_put;
74adad500346fb drivers/usb/chipidea/ci_hdrc_imx.c Joe Hattori         2024-=
12-16  414  		}
7c8e8909417eb6 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2018-=
10-16  415 =20
4d6141288c33b7 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2019-=
10-10  416  		data->hsic_pad_regulator =3D
4d6141288c33b7 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2019-=
10-10  417  				devm_regulator_get_optional(dev, "hsic");
4d6141288c33b7 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2019-=
10-10  418  		if (PTR_ERR(data->hsic_pad_regulator) =3D=3D -ENODEV) {
9c3959bb4cbf2b drivers/usb/chipidea/ci_hdrc_imx.c Jonathan Neusch=C3=A4fer =
2022-11-04  419  			/* no pad regulator is needed */
4d6141288c33b7 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2019-=
10-10  420  			data->hsic_pad_regulator =3D NULL;
74adad500346fb drivers/usb/chipidea/ci_hdrc_imx.c Joe Hattori         2024-=
12-16  421  		} else if (IS_ERR(data->hsic_pad_regulator)) {
74adad500346fb drivers/usb/chipidea/ci_hdrc_imx.c Joe Hattori         2024-=
12-16  422  			ret =3D dev_err_probe(dev, PTR_ERR(data->hsic_pad_regulator),
18171cfc3c236a drivers/usb/chipidea/ci_hdrc_imx.c Alexander Stein     2022-=
06-14  423  					     "Get HSIC pad regulator error\n");
74adad500346fb drivers/usb/chipidea/ci_hdrc_imx.c Joe Hattori         2024-=
12-16  424  			goto err_put;
74adad500346fb drivers/usb/chipidea/ci_hdrc_imx.c Joe Hattori         2024-=
12-16  425  		}
4d6141288c33b7 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2019-=
10-10  426 =20
4d6141288c33b7 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2019-=
10-10  427  		if (data->hsic_pad_regulator) {
4d6141288c33b7 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2019-=
10-10  428  			ret =3D regulator_enable(data->hsic_pad_regulator);
4d6141288c33b7 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2019-=
10-10  429  			if (ret) {
4d6141288c33b7 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2019-=
10-10  430  				dev_err(dev,
4d6141288c33b7 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2019-=
10-10  431  					"Failed to enable HSIC pad regulator\n");
74adad500346fb drivers/usb/chipidea/ci_hdrc_imx.c Joe Hattori         2024-=
12-16  432  				goto err_put;
4d6141288c33b7 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2019-=
10-10  433  			}
8cab0e9a3f3e8d drivers/usb/chipidea/ci_hdrc_imx.c Fedor Pchelkin      2025-=
03-16  434  			ret =3D devm_add_action_or_reset(dev,
8cab0e9a3f3e8d drivers/usb/chipidea/ci_hdrc_imx.c Fedor Pchelkin      2025-=
03-16  435  					ci_hdrc_imx_disable_regulator, data);
8cab0e9a3f3e8d drivers/usb/chipidea/ci_hdrc_imx.c Fedor Pchelkin      2025-=
03-16  436  			if (ret) {
8cab0e9a3f3e8d drivers/usb/chipidea/ci_hdrc_imx.c Fedor Pchelkin      2025-=
03-16  437  				dev_err(dev,
8cab0e9a3f3e8d drivers/usb/chipidea/ci_hdrc_imx.c Fedor Pchelkin      2025-=
03-16  438  					"Failed to add regulator devm action\n");
8cab0e9a3f3e8d drivers/usb/chipidea/ci_hdrc_imx.c Fedor Pchelkin      2025-=
03-16  439  				goto err_put;
8cab0e9a3f3e8d drivers/usb/chipidea/ci_hdrc_imx.c Fedor Pchelkin      2025-=
03-16  440  			}
4d6141288c33b7 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2019-=
10-10  441  		}
4d6141288c33b7 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2019-=
10-10  442  	}
4d6141288c33b7 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2019-=
10-10  443 =20
4d6141288c33b7 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2019-=
10-10  444  	/* HSIC pinctrl handling */
4d6141288c33b7 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2019-=
10-10  445  	if (data->pinctrl) {
4d6141288c33b7 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2019-=
10-10  446  		struct pinctrl_state *pinctrl_hsic_idle;
4d6141288c33b7 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2019-=
10-10  447 =20
7c8e8909417eb6 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2018-=
10-16  448  		pinctrl_hsic_idle =3D pinctrl_lookup_state(data->pinctrl, "id=
le");
7c8e8909417eb6 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2018-=
10-16  449  		if (IS_ERR(pinctrl_hsic_idle)) {
7c8e8909417eb6 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2018-=
10-16  450  			dev_err(dev,
7c8e8909417eb6 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2018-=
10-16  451  				"pinctrl_hsic_idle lookup failed, err=3D%ld\n",
7c8e8909417eb6 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2018-=
10-16  452  					PTR_ERR(pinctrl_hsic_idle));
74adad500346fb drivers/usb/chipidea/ci_hdrc_imx.c Joe Hattori         2024-=
12-16  453  			ret =3D PTR_ERR(pinctrl_hsic_idle);
74adad500346fb drivers/usb/chipidea/ci_hdrc_imx.c Joe Hattori         2024-=
12-16  454  			goto err_put;
7c8e8909417eb6 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2018-=
10-16  455  		}
7c8e8909417eb6 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2018-=
10-16  456 =20
7c8e8909417eb6 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2018-=
10-16  457  		ret =3D pinctrl_select_state(data->pinctrl, pinctrl_hsic_idle=
);
7c8e8909417eb6 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2018-=
10-16  458  		if (ret) {
7c8e8909417eb6 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2018-=
10-16  459  			dev_err(dev, "hsic_idle select failed, err=3D%d\n", ret);
74adad500346fb drivers/usb/chipidea/ci_hdrc_imx.c Joe Hattori         2024-=
12-16  460  			goto err_put;
7c8e8909417eb6 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2018-=
10-16  461  		}
1530280084c390 drivers/usb/chipidea/ci13xxx_imx.c Richard Zhao        2012-=
07-07  462 =20
7c8e8909417eb6 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2018-=
10-16  463  		data->pinctrl_hsic_active =3D pinctrl_lookup_state(data->pinc=
trl,
7c8e8909417eb6 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2018-=
10-16  464  								"active");
7c8e8909417eb6 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2018-=
10-16  465  		if (IS_ERR(data->pinctrl_hsic_active)) {
7c8e8909417eb6 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2018-=
10-16  466  			dev_err(dev,
7c8e8909417eb6 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2018-=
10-16  467  				"pinctrl_hsic_active lookup failed, err=3D%ld\n",
7c8e8909417eb6 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2018-=
10-16  468  					PTR_ERR(data->pinctrl_hsic_active));
74adad500346fb drivers/usb/chipidea/ci_hdrc_imx.c Joe Hattori         2024-=
12-16  469  			ret =3D PTR_ERR(data->pinctrl_hsic_active);
74adad500346fb drivers/usb/chipidea/ci_hdrc_imx.c Joe Hattori         2024-=
12-16  470  			goto err_put;
7c8e8909417eb6 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2018-=
10-16  471  		}
7c8e8909417eb6 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2018-=
10-16  472  	}
d1609c312d42f3 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2019-=
04-28  473 =20
d1609c312d42f3 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2019-=
04-28  474  	if (pdata.flags & CI_HDRC_PMQOS)
77b352456941e8 drivers/usb/chipidea/ci_hdrc_imx.c Rafael J. Wysocki   2020-=
02-12  475  		cpu_latency_qos_add_request(&data->pm_qos_req, 0);
d1609c312d42f3 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2019-=
04-28  476 =20
7c8e8909417eb6 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2018-=
10-16  477  	ret =3D imx_get_clks(dev);
7c8e8909417eb6 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2018-=
10-16  478  	if (ret)
8cab0e9a3f3e8d drivers/usb/chipidea/ci_hdrc_imx.c Fedor Pchelkin      2025-=
03-16  479  		goto qos_remove_request;
7c8e8909417eb6 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2018-=
10-16  480 =20
7c8e8909417eb6 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2018-=
10-16  481  	ret =3D imx_prepare_enable_clks(dev);
7c8e8909417eb6 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2018-=
10-16  482  	if (ret)
8cab0e9a3f3e8d drivers/usb/chipidea/ci_hdrc_imx.c Fedor Pchelkin      2025-=
03-16  483  		goto qos_remove_request;
1530280084c390 drivers/usb/chipidea/ci13xxx_imx.c Richard Zhao        2012-=
07-07  484 =20
5dbe9ac28355fd drivers/usb/chipidea/ci_hdrc_imx.c Xu Yang             2023-=
12-28  485  	ret =3D clk_prepare_enable(data->clk_wakeup);
5dbe9ac28355fd drivers/usb/chipidea/ci_hdrc_imx.c Xu Yang             2023-=
12-28  486  	if (ret)
5dbe9ac28355fd drivers/usb/chipidea/ci_hdrc_imx.c Xu Yang             2023-=
12-28  487  		goto err_wakeup_clk;
5dbe9ac28355fd drivers/usb/chipidea/ci_hdrc_imx.c Xu Yang             2023-=
12-28  488 =20
7c8e8909417eb6 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2018-=
10-16  489  	data->phy =3D devm_usb_get_phy_by_phandle(dev, "fsl,usbphy", 0=
);
af59a8b120d189 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2013-=
09-24  490  	if (IS_ERR(data->phy)) {
af59a8b120d189 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2013-=
09-24  491  		ret =3D PTR_ERR(data->phy);
3a1bd0494352bd drivers/usb/chipidea/ci_hdrc_imx.c Alexander Stein     2023-=
01-30  492  		if (ret !=3D -ENODEV) {
3a1bd0494352bd drivers/usb/chipidea/ci_hdrc_imx.c Alexander Stein     2023-=
01-30  493  			dev_err_probe(dev, ret, "Failed to parse fsl,usbphy\n");
d4d2e5329ae9df drivers/usb/chipidea/ci_hdrc_imx.c Dan Carpenter       2021-=
11-17  494  			goto err_clk;
3a1bd0494352bd drivers/usb/chipidea/ci_hdrc_imx.c Alexander Stein     2023-=
01-30  495  		}
8253a34bfae327 drivers/usb/chipidea/ci_hdrc_imx.c Fabio Estevam       2021-=
09-21  496  		data->phy =3D devm_usb_get_phy_by_phandle(dev, "phys", 0);
8253a34bfae327 drivers/usb/chipidea/ci_hdrc_imx.c Fabio Estevam       2021-=
09-21  497  		if (IS_ERR(data->phy)) {
8253a34bfae327 drivers/usb/chipidea/ci_hdrc_imx.c Fabio Estevam       2021-=
09-21  498  			ret =3D PTR_ERR(data->phy);
3a1bd0494352bd drivers/usb/chipidea/ci_hdrc_imx.c Alexander Stein     2023-=
01-30  499  			if (ret =3D=3D -ENODEV) {
ed5a419bb0195c drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2019-=
05-07  500  				data->phy =3D NULL;
3a1bd0494352bd drivers/usb/chipidea/ci_hdrc_imx.c Alexander Stein     2023-=
01-30  501  			} else {
3a1bd0494352bd drivers/usb/chipidea/ci_hdrc_imx.c Alexander Stein     2023-=
01-30  502  				dev_err_probe(dev, ret, "Failed to parse phys\n");
ea1418b5f1a394 drivers/usb/chipidea/ci13xxx_imx.c Sascha Hauer        2013-=
06-13  503  				goto err_clk;
1530280084c390 drivers/usb/chipidea/ci13xxx_imx.c Richard Zhao        2012-=
07-07  504  			}
8253a34bfae327 drivers/usb/chipidea/ci_hdrc_imx.c Fabio Estevam       2021-=
09-21  505  		}
3a1bd0494352bd drivers/usb/chipidea/ci_hdrc_imx.c Alexander Stein     2023-=
01-30  506  	}
1530280084c390 drivers/usb/chipidea/ci13xxx_imx.c Richard Zhao        2012-=
07-07  507 =20
ef44cb4226d132 drivers/usb/chipidea/ci_hdrc_imx.c Antoine Tenart      2014-=
10-30  508  	pdata.usb_phy =3D data->phy;
746f316b753a83 drivers/usb/chipidea/ci_hdrc_imx.c Jun Li              2020-=
01-23  509  	if (data->usbmisc_data)
746f316b753a83 drivers/usb/chipidea/ci_hdrc_imx.c Jun Li              2020-=
01-23  510  		data->usbmisc_data->usb_phy =3D data->phy;
be9cae2479f48d drivers/usb/chipidea/ci_hdrc_imx.c Sebastian Reichel   2018-=
03-29  511 =20
03e6275ae38108 drivers/usb/chipidea/ci_hdrc_imx.c Andrey Smirnov      2018-=
05-30  512  	if ((of_device_is_compatible(np, "fsl,imx53-usb") ||
03e6275ae38108 drivers/usb/chipidea/ci_hdrc_imx.c Andrey Smirnov      2018-=
05-30  513  	     of_device_is_compatible(np, "fsl,imx51-usb")) && pdata.us=
b_phy &&
be9cae2479f48d drivers/usb/chipidea/ci_hdrc_imx.c Sebastian Reichel   2018-=
03-29  514  	    of_usb_get_phy_mode(np) =3D=3D USBPHY_INTERFACE_MODE_ULPI)=
 {
be9cae2479f48d drivers/usb/chipidea/ci_hdrc_imx.c Sebastian Reichel   2018-=
03-29  515  		pdata.flags |=3D CI_HDRC_OVERRIDE_PHY_CONTROL;
be9cae2479f48d drivers/usb/chipidea/ci_hdrc_imx.c Sebastian Reichel   2018-=
03-29  516  		data->override_phy_control =3D true;
8c531e0a8c2d82 drivers/usb/chipidea/ci_hdrc_imx.c Fedor Pchelkin      2025-=
03-16  517  		ret =3D usb_phy_init(pdata.usb_phy);
8c531e0a8c2d82 drivers/usb/chipidea/ci_hdrc_imx.c Fedor Pchelkin      2025-=
03-16  518  		if (ret) {
8c531e0a8c2d82 drivers/usb/chipidea/ci_hdrc_imx.c Fedor Pchelkin      2025-=
03-16  519  			dev_err(dev, "Failed to init phy\n");
8c531e0a8c2d82 drivers/usb/chipidea/ci_hdrc_imx.c Fedor Pchelkin      2025-=
03-16  520  			goto err_clk;
8c531e0a8c2d82 drivers/usb/chipidea/ci_hdrc_imx.c Fedor Pchelkin      2025-=
03-16  521  		}
be9cae2479f48d drivers/usb/chipidea/ci_hdrc_imx.c Sebastian Reichel   2018-=
03-29  522  	}
be9cae2479f48d drivers/usb/chipidea/ci_hdrc_imx.c Sebastian Reichel   2018-=
03-29  523 =20
e14db48dfcf3ab drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2015-=
02-11  524  	if (pdata.flags & CI_HDRC_SUPPORTS_RUNTIME_PM)
e14db48dfcf3ab drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2015-=
02-11  525  		data->supports_runtime_pm =3D true;
1071055e2a118a drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2014-=
01-10  526 =20
ee0dc2f7d52279 drivers/usb/chipidea/ci_hdrc_imx.c Xu Yang             2025-=
03-18  527  	data->wakeup_irq =3D platform_get_irq_optional(pdev, 1);
ee0dc2f7d52279 drivers/usb/chipidea/ci_hdrc_imx.c Xu Yang             2025-=
03-18  528  	if (data->wakeup_irq > 0) {
2e9762f45efb53 drivers/usb/chipidea/ci_hdrc_imx.c Xu Yang             2026-=
01-12  529  		irq_name =3D devm_kasprintf(dev, GFP_KERNEL, "%s:wakeup", pda=
ta.name);
2e9762f45efb53 drivers/usb/chipidea/ci_hdrc_imx.c Xu Yang             2026-=
01-12  530  		if (!irq_name) {
2e9762f45efb53 drivers/usb/chipidea/ci_hdrc_imx.c Xu Yang             2026-=
01-12  531  			dev_err_probe(dev, -ENOMEM, "failed to create irq_name\n");
2e9762f45efb53 drivers/usb/chipidea/ci_hdrc_imx.c Xu Yang             2026-=
01-12 @532  			goto err_clk;
2e9762f45efb53 drivers/usb/chipidea/ci_hdrc_imx.c Xu Yang             2026-=
01-12  533  		}
2e9762f45efb53 drivers/usb/chipidea/ci_hdrc_imx.c Xu Yang             2026-=
01-12  534 =20
ee0dc2f7d52279 drivers/usb/chipidea/ci_hdrc_imx.c Xu Yang             2025-=
03-18  535  		ret =3D devm_request_threaded_irq(dev, data->wakeup_irq,
ee0dc2f7d52279 drivers/usb/chipidea/ci_hdrc_imx.c Xu Yang             2025-=
03-18  536  						NULL, ci_wakeup_irq_handler,
ee0dc2f7d52279 drivers/usb/chipidea/ci_hdrc_imx.c Xu Yang             2025-=
03-18  537  						IRQF_ONESHOT | IRQF_NO_AUTOEN,
2e9762f45efb53 drivers/usb/chipidea/ci_hdrc_imx.c Xu Yang             2026-=
01-12  538  						irq_name, data);
ee0dc2f7d52279 drivers/usb/chipidea/ci_hdrc_imx.c Xu Yang             2025-=
03-18  539  		if (ret)
ee0dc2f7d52279 drivers/usb/chipidea/ci_hdrc_imx.c Xu Yang             2025-=
03-18  540  			goto err_clk;
ee0dc2f7d52279 drivers/usb/chipidea/ci_hdrc_imx.c Xu Yang             2025-=
03-18  541  	}
ee0dc2f7d52279 drivers/usb/chipidea/ci_hdrc_imx.c Xu Yang             2025-=
03-18  542 =20
05986ba9b025ae drivers/usb/chipidea/ci_hdrc_imx.c Sascha Hauer        2013-=
08-14  543  	ret =3D imx_usbmisc_init(data->usbmisc_data);
d142d6be231713 drivers/usb/chipidea/ci13xxx_imx.c Richard Zhao        2012-=
09-12  544  	if (ret) {
7c8e8909417eb6 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2018-=
10-16  545  		dev_err(dev, "usbmisc init failed, ret=3D%d\n", ret);
8c531e0a8c2d82 drivers/usb/chipidea/ci_hdrc_imx.c Fedor Pchelkin      2025-=
03-16  546  		goto phy_shutdown;
d142d6be231713 drivers/usb/chipidea/ci13xxx_imx.c Richard Zhao        2012-=
09-12  547  	}
d142d6be231713 drivers/usb/chipidea/ci13xxx_imx.c Richard Zhao        2012-=
09-12  548 =20
7c8e8909417eb6 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2018-=
10-16  549  	data->ci_pdev =3D ci_hdrc_add_device(dev,
1530280084c390 drivers/usb/chipidea/ci13xxx_imx.c Richard Zhao        2012-=
07-07  550  				pdev->resource, pdev->num_resources,
f6a3b3a37c4772 drivers/usb/chipidea/ci13xxx_imx.c Michael Grzeschik   2013-=
06-13  551  				&pdata);
770719df7b2cee drivers/usb/chipidea/ci13xxx_imx.c Fabio Estevam       2013-=
06-13  552  	if (IS_ERR(data->ci_pdev)) {
770719df7b2cee drivers/usb/chipidea/ci13xxx_imx.c Fabio Estevam       2013-=
06-13  553  		ret =3D PTR_ERR(data->ci_pdev);
18171cfc3c236a drivers/usb/chipidea/ci_hdrc_imx.c Alexander Stein     2022-=
06-14  554  		dev_err_probe(dev, ret, "ci_hdrc_add_device failed\n");
8c531e0a8c2d82 drivers/usb/chipidea/ci_hdrc_imx.c Fedor Pchelkin      2025-=
03-16  555  		goto phy_shutdown;
1530280084c390 drivers/usb/chipidea/ci13xxx_imx.c Richard Zhao        2012-=
07-07  556  	}
1530280084c390 drivers/usb/chipidea/ci13xxx_imx.c Richard Zhao        2012-=
07-07  557 =20
df17aa9fb31f6a drivers/usb/chipidea/ci_hdrc_imx.c Li Jun              2019-=
10-09  558  	if (data->usbmisc_data) {
93c2c7330a3b6d drivers/usb/chipidea/ci_hdrc_imx.c Li Jun              2019-=
09-09  559  		if (!IS_ERR(pdata.id_extcon.edev) ||
93c2c7330a3b6d drivers/usb/chipidea/ci_hdrc_imx.c Li Jun              2019-=
09-09  560  		    of_property_read_bool(np, "usb-role-switch"))
93c2c7330a3b6d drivers/usb/chipidea/ci_hdrc_imx.c Li Jun              2019-=
09-09  561  			data->usbmisc_data->ext_id =3D 1;
93c2c7330a3b6d drivers/usb/chipidea/ci_hdrc_imx.c Li Jun              2019-=
09-09  562 =20
93c2c7330a3b6d drivers/usb/chipidea/ci_hdrc_imx.c Li Jun              2019-=
09-09  563  		if (!IS_ERR(pdata.vbus_extcon.edev) ||
93c2c7330a3b6d drivers/usb/chipidea/ci_hdrc_imx.c Li Jun              2019-=
09-09  564  		    of_property_read_bool(np, "usb-role-switch"))
93c2c7330a3b6d drivers/usb/chipidea/ci_hdrc_imx.c Li Jun              2019-=
09-09  565  			data->usbmisc_data->ext_vbus =3D 1;
d6f93d21001e43 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2020-=
07-28  566 =20
d6f93d21001e43 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2020-=
07-28  567  		/* usbmisc needs to know dr mode to choose wakeup setting */
d6f93d21001e43 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2020-=
07-28  568  		data->usbmisc_data->available_role =3D
d6f93d21001e43 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2020-=
07-28  569  			ci_hdrc_query_available_role(data->ci_pdev);
df17aa9fb31f6a drivers/usb/chipidea/ci_hdrc_imx.c Li Jun              2019-=
10-09  570  	}
93c2c7330a3b6d drivers/usb/chipidea/ci_hdrc_imx.c Li Jun              2019-=
09-09  571 =20
05986ba9b025ae drivers/usb/chipidea/ci_hdrc_imx.c Sascha Hauer        2013-=
08-14  572  	ret =3D imx_usbmisc_init_post(data->usbmisc_data);
a068533079a0a1 drivers/usb/chipidea/ci13xxx_imx.c Michael Grzeschik   2013-=
03-30  573  	if (ret) {
7c8e8909417eb6 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2018-=
10-16  574  		dev_err(dev, "usbmisc post failed, ret=3D%d\n", ret);
770719df7b2cee drivers/usb/chipidea/ci13xxx_imx.c Fabio Estevam       2013-=
06-13  575  		goto disable_device;
a068533079a0a1 drivers/usb/chipidea/ci13xxx_imx.c Michael Grzeschik   2013-=
03-30  576  	}
a068533079a0a1 drivers/usb/chipidea/ci13xxx_imx.c Michael Grzeschik   2013-=
03-30  577 =20
e14db48dfcf3ab drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2015-=
02-11  578  	if (data->supports_runtime_pm) {
7c8e8909417eb6 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2018-=
10-16  579  		pm_runtime_set_active(dev);
7c8e8909417eb6 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2018-=
10-16  580  		pm_runtime_enable(dev);
e14db48dfcf3ab drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2015-=
02-11  581  	}
1530280084c390 drivers/usb/chipidea/ci13xxx_imx.c Richard Zhao        2012-=
07-07  582 =20
7c8e8909417eb6 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2018-=
10-16  583  	device_set_wakeup_capable(dev, true);
6d6531104d2069 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2015-=
02-11  584 =20
1530280084c390 drivers/usb/chipidea/ci13xxx_imx.c Richard Zhao        2012-=
07-07  585  	return 0;
1530280084c390 drivers/usb/chipidea/ci13xxx_imx.c Richard Zhao        2012-=
07-07  586 =20
770719df7b2cee drivers/usb/chipidea/ci13xxx_imx.c Fabio Estevam       2013-=
06-13  587  disable_device:
8e22978c57087a drivers/usb/chipidea/ci_hdrc_imx.c Alexander Shishkin  2013-=
06-24  588  	ci_hdrc_remove_device(data->ci_pdev);
8c531e0a8c2d82 drivers/usb/chipidea/ci_hdrc_imx.c Fedor Pchelkin      2025-=
03-16  589  phy_shutdown:
8c531e0a8c2d82 drivers/usb/chipidea/ci_hdrc_imx.c Fedor Pchelkin      2025-=
03-16  590  	if (data->override_phy_control)
8c531e0a8c2d82 drivers/usb/chipidea/ci_hdrc_imx.c Fedor Pchelkin      2025-=
03-16  591  		usb_phy_shutdown(data->phy);
ea1418b5f1a394 drivers/usb/chipidea/ci13xxx_imx.c Sascha Hauer        2013-=
06-13  592  err_clk:
5dbe9ac28355fd drivers/usb/chipidea/ci_hdrc_imx.c Xu Yang             2023-=
12-28  593  	clk_disable_unprepare(data->clk_wakeup);
5dbe9ac28355fd drivers/usb/chipidea/ci_hdrc_imx.c Xu Yang             2023-=
12-28  594  err_wakeup_clk:
7c8e8909417eb6 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2018-=
10-16  595  	imx_disable_unprepare_clks(dev);
8cab0e9a3f3e8d drivers/usb/chipidea/ci_hdrc_imx.c Fedor Pchelkin      2025-=
03-16  596  qos_remove_request:
d1609c312d42f3 drivers/usb/chipidea/ci_hdrc_imx.c Peter Chen          2019-=
04-28  597  	if (pdata.flags & CI_HDRC_PMQOS)
77b352456941e8 drivers/usb/chipidea/ci_hdrc_imx.c Rafael J. Wysocki   2020-=
02-12  598  		cpu_latency_qos_remove_request(&data->pm_qos_req);
141822aa3f79ef drivers/usb/chipidea/ci_hdrc_imx.c Andr=C3=A9 Draszik       =
2019-08-10  599  	data->ci_pdev =3D NULL;
74adad500346fb drivers/usb/chipidea/ci_hdrc_imx.c Joe Hattori         2024-=
12-16  600  err_put:
4e28f79e3dffa5 drivers/usb/chipidea/ci_hdrc_imx.c Fedor Pchelkin      2025-=
03-16  601  	if (data->usbmisc_data)
74adad500346fb drivers/usb/chipidea/ci_hdrc_imx.c Joe Hattori         2024-=
12-16  602  		put_device(data->usbmisc_data->dev);
1530280084c390 drivers/usb/chipidea/ci13xxx_imx.c Richard Zhao        2012-=
07-07  603  	return ret;
1530280084c390 drivers/usb/chipidea/ci13xxx_imx.c Richard Zhao        2012-=
07-07  604  }
1530280084c390 drivers/usb/chipidea/ci13xxx_imx.c Richard Zhao        2012-=
07-07  605 =20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
