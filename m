Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F6E637D101
	for <oe-kbuild@lists.linux.dev>; Fri,  3 Apr 2026 08:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775205783; cv=none; b=NS5J59cDlm5TBJUTE627ZfukTNTDXWKz4tc5WxeWo7pPpEFlWwommUZEaN96+JOH3GdJn9tjGDj8Ce1N9N5/zLbfi4qaIo+R/4bpbC8HXdm7ZCuV690lZyzytk+kS/3AqL1zA5v31L+9EPnp9PLqXM8ep3ICbpHbpG0xv1sTLTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775205783; c=relaxed/simple;
	bh=9ushoRgPl2uiZ6IR+ac4uA4mXNYfrNRneakx8E8ukSQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Iiok0En2X5wrSP65qXwfqALeIQrbAx8vHjRY3bQ1Tb07LRSgwRTh553ztTRFZj11fGmY8yuenKEIMbfFhof6qWAaRu/IvnjHSBQZFCtfL0bH57zeqhCHm0D9Y5MQPoDkrrjK/1RHna5Q2Cq4yuFjOdebm0htufgYU3kwtu+HKvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MXEZLEKF; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MXEZLEKF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775205782; x=1806741782;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=9ushoRgPl2uiZ6IR+ac4uA4mXNYfrNRneakx8E8ukSQ=;
  b=MXEZLEKFGreK5KOvYIdRe6DAS2iIhdEozmTQG02Ty3LkhYZdoRevZQNd
   sHVKFCk85p8VZaK6oaqCpdMS/Outa2K8iWlU2FkPhrXNqDn5m0dYrV0Ea
   0vGGgOB7kvfYbzG+vXrgBDimH5+aNn0Ucsh56aUCPHuvunRizAq15AjeX
   o6h1k+Lg5LMknO3iRrMTsxIawDAJEsW3R9prNf/LQwCNOSdOJAb1hpOob
   WKg9ZNmvdoHTEKknuQFiCZQeQWyRDG4QC84NMeyX+6OgMKx6kjJeJz6ku
   WU7WUogIqEXtd5/yT7sX3a7zXaOeUmnGXn8DFOd7QBE6wlOhj9H5mGfGs
   Q==;
X-CSE-ConnectionGUID: pn6SCKdDTF6zWUlAtf/phA==
X-CSE-MsgGUID: UhktkH+lQpikDL8kE8BMHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="75311893"
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="75311893"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 01:42:59 -0700
X-CSE-ConnectionGUID: wxY91e5QRROOhDTg9Qj7Xw==
X-CSE-MsgGUID: MEVQzAkqT6GxUvqA8m8MMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="250286600"
Received: from lkp-server01.sh.intel.com (HELO 064ad336901d) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 03 Apr 2026 01:42:57 -0700
Received: from kbuild by 064ad336901d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8a7D-0000000013o-2Slo;
	Fri, 03 Apr 2026 08:42:55 +0000
Date: Fri, 03 Apr 2026 16:42:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [usb:usb-testing 42/91]
 drivers/usb/typec/tcpm/fusb302.c:1790 fusb302_probe() warn:
 'chip->gpio_int_n_irq' from request_threaded_irq() not released on lines:
 1779.
Message-ID: <202604030057.ltpEgGgC-lkp@intel.com>
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
CC: linux-usb@vger.kernel.org
TO: Alexey Charkov <alchark@flipper.net>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Hans de Goede <johannes.goede@oss.qualcomm.com>
CC: Heikki Krogerus <heikki.krogrerus@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-=
testing
head:   25e531b422dc2ac90cdae3b6e74b5cdeb081440d
commit: 6b9db53197094f38a18797495df2e3c758ec51dc [42/91] usb: typec: fusb30=
2: Switch to threaded IRQ handler
:::::: branch date: 3 hours ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-161-20260402 (https://download.01.org/0day-ci/arc=
hive/20260403/202604030057.ltpEgGgC-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f022=
7cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202604030057.ltpEgGgC-lkp@intel.com/

New smatch warnings:
drivers/usb/typec/tcpm/fusb302.c:1790 fusb302_probe() warn: 'chip->gpio_int=
_n_irq' from request_threaded_irq() not released on lines: 1779.

Old smatch warnings:
drivers/usb/typec/tcpm/fusb302.c:161 _fusb302_log() error: testing array of=
fset 'chip->logbuffer_head' after use.

vim +1790 drivers/usb/typec/tcpm/fusb302.c

8f6244055bd3369 drivers/usb/typec/tcpm/fusb302.c        Heikki Krogerus   2=
019-08-14  1688 =20
3646730ee44f42d drivers/usb/typec/tcpm/fusb302.c        Uwe Kleine-K=C3=B6n=
ig  2022-11-18  1689  static int fusb302_probe(struct i2c_client *client)
c034a43e72dda58 drivers/staging/typec/fusb302/fusb302.c Yueyao Zhu        2=
017-04-27  1690  {
c034a43e72dda58 drivers/staging/typec/fusb302/fusb302.c Yueyao Zhu        2=
017-04-27  1691  	struct fusb302_chip *chip;
4c06a42e826d5bb drivers/usb/typec/tcpm/fusb302.c        Wolfram Sang      2=
019-06-08  1692  	struct i2c_adapter *adapter =3D client->adapter;
5d79c525405dcf9 drivers/usb/typec/tcpm/fusb302.c        Sebastian Reichel 2=
026-03-10  1693  	struct auxiliary_device *bridge_dev;
097578ec200858c drivers/staging/typec/fusb302/fusb302.c Hans de Goede     2=
017-08-30  1694  	struct device *dev =3D &client->dev;
382099d6bcffa13 drivers/staging/typec/fusb302/fusb302.c Hans de Goede     2=
017-08-30  1695  	const char *name;
c034a43e72dda58 drivers/staging/typec/fusb302/fusb302.c Yueyao Zhu        2=
017-04-27  1696  	int ret =3D 0;
c034a43e72dda58 drivers/staging/typec/fusb302/fusb302.c Yueyao Zhu        2=
017-04-27  1697 =20
c034a43e72dda58 drivers/staging/typec/fusb302/fusb302.c Yueyao Zhu        2=
017-04-27  1698  	if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_I2C_=
BLOCK)) {
c034a43e72dda58 drivers/staging/typec/fusb302/fusb302.c Yueyao Zhu        2=
017-04-27  1699  		dev_err(&client->dev,
c034a43e72dda58 drivers/staging/typec/fusb302/fusb302.c Yueyao Zhu        2=
017-04-27  1700  			"I2C/SMBus block functionality not supported!\n");
c034a43e72dda58 drivers/staging/typec/fusb302/fusb302.c Yueyao Zhu        2=
017-04-27  1701  		return -ENODEV;
c034a43e72dda58 drivers/staging/typec/fusb302/fusb302.c Yueyao Zhu        2=
017-04-27  1702  	}
c034a43e72dda58 drivers/staging/typec/fusb302/fusb302.c Yueyao Zhu        2=
017-04-27  1703  	chip =3D devm_kzalloc(&client->dev, sizeof(*chip), GFP_KE=
RNEL);
c034a43e72dda58 drivers/staging/typec/fusb302/fusb302.c Yueyao Zhu        2=
017-04-27  1704  	if (!chip)
c034a43e72dda58 drivers/staging/typec/fusb302/fusb302.c Yueyao Zhu        2=
017-04-27  1705  		return -ENOMEM;
c034a43e72dda58 drivers/staging/typec/fusb302/fusb302.c Yueyao Zhu        2=
017-04-27  1706 =20
c034a43e72dda58 drivers/staging/typec/fusb302/fusb302.c Yueyao Zhu        2=
017-04-27  1707  	chip->i2c_client =3D client;
c034a43e72dda58 drivers/staging/typec/fusb302/fusb302.c Yueyao Zhu        2=
017-04-27  1708  	chip->dev =3D &client->dev;
c034a43e72dda58 drivers/staging/typec/fusb302/fusb302.c Yueyao Zhu        2=
017-04-27  1709  	mutex_init(&chip->lock);
c034a43e72dda58 drivers/staging/typec/fusb302/fusb302.c Yueyao Zhu        2=
017-04-27  1710 =20
382099d6bcffa13 drivers/staging/typec/fusb302/fusb302.c Hans de Goede     2=
017-08-30  1711  	/*
382099d6bcffa13 drivers/staging/typec/fusb302/fusb302.c Hans de Goede     2=
017-08-30  1712  	 * Devicetree platforms should get extcon via phandle (no=
t yet
382099d6bcffa13 drivers/staging/typec/fusb302/fusb302.c Hans de Goede     2=
017-08-30  1713  	 * supported). On ACPI platforms, we get the name from a =
device prop.
382099d6bcffa13 drivers/staging/typec/fusb302/fusb302.c Hans de Goede     2=
017-08-30  1714  	 * This device prop is for kernel internal use only and i=
s expected
382099d6bcffa13 drivers/staging/typec/fusb302/fusb302.c Hans de Goede     2=
017-08-30  1715  	 * to be set by the platform code which also registers th=
e i2c client
382099d6bcffa13 drivers/staging/typec/fusb302/fusb302.c Hans de Goede     2=
017-08-30  1716  	 * for the fusb302.
382099d6bcffa13 drivers/staging/typec/fusb302/fusb302.c Hans de Goede     2=
017-08-30  1717  	 */
440da5a30e54ded drivers/usb/typec/tcpm/fusb302.c        Andy Shevchenko   2=
018-11-15  1718  	if (device_property_read_string(dev, "linux,extcon-name",=
 &name) =3D=3D 0) {
382099d6bcffa13 drivers/staging/typec/fusb302/fusb302.c Hans de Goede     2=
017-08-30  1719  		chip->extcon =3D extcon_get_extcon_dev(name);
58e4a2d27d3255e drivers/usb/typec/tcpm/fusb302.c        Dan Carpenter     2=
021-12-17  1720  		if (IS_ERR(chip->extcon))
58e4a2d27d3255e drivers/usb/typec/tcpm/fusb302.c        Dan Carpenter     2=
021-12-17  1721  			return PTR_ERR(chip->extcon);
382099d6bcffa13 drivers/staging/typec/fusb302/fusb302.c Hans de Goede     2=
017-08-30  1722  	}
382099d6bcffa13 drivers/staging/typec/fusb302/fusb302.c Hans de Goede     2=
017-08-30  1723 =20
c800c51f586b3c3 drivers/usb/typec/fusb302/fusb302.c     Heikki Krogerus   2=
018-09-20  1724  	chip->vbus =3D devm_regulator_get(chip->dev, "vbus");
c800c51f586b3c3 drivers/usb/typec/fusb302/fusb302.c     Heikki Krogerus   2=
018-09-20  1725  	if (IS_ERR(chip->vbus))
c800c51f586b3c3 drivers/usb/typec/fusb302/fusb302.c     Heikki Krogerus   2=
018-09-20  1726  		return PTR_ERR(chip->vbus);
c034a43e72dda58 drivers/staging/typec/fusb302/fusb302.c Yueyao Zhu        2=
017-04-27  1727 =20
c034a43e72dda58 drivers/staging/typec/fusb302/fusb302.c Yueyao Zhu        2=
017-04-27  1728  	chip->wq =3D create_singlethread_workqueue(dev_name(chip-=
>dev));
c800c51f586b3c3 drivers/usb/typec/fusb302/fusb302.c     Heikki Krogerus   2=
018-09-20  1729  	if (!chip->wq)
c800c51f586b3c3 drivers/usb/typec/fusb302/fusb302.c     Heikki Krogerus   2=
018-09-20  1730  		return -ENOMEM;
c800c51f586b3c3 drivers/usb/typec/fusb302/fusb302.c     Heikki Krogerus   2=
018-09-20  1731 =20
207338ec5a278a3 drivers/usb/typec/tcpm/fusb302.c        Hans de Goede     2=
019-03-11  1732  	spin_lock_init(&chip->irq_lock);
207338ec5a278a3 drivers/usb/typec/tcpm/fusb302.c        Hans de Goede     2=
019-03-11  1733  	INIT_WORK(&chip->irq_work, fusb302_irq_work);
c034a43e72dda58 drivers/staging/typec/fusb302/fusb302.c Yueyao Zhu        2=
017-04-27  1734  	INIT_DELAYED_WORK(&chip->bc_lvl_handler, fusb302_bc_lvl_h=
andler_work);
c034a43e72dda58 drivers/staging/typec/fusb302/fusb302.c Yueyao Zhu        2=
017-04-27  1735  	init_tcpc_dev(&chip->tcpc_dev);
1e296b5be40d309 drivers/usb/typec/tcpm/fusb302.c        Hans de Goede     2=
019-08-17  1736  	fusb302_debugfs_init(chip);
c034a43e72dda58 drivers/staging/typec/fusb302/fusb302.c Yueyao Zhu        2=
017-04-27  1737 =20
4660e4aeb9d7489 drivers/staging/typec/fusb302/fusb302.c Hans de Goede     2=
017-08-30  1738  	if (client->irq) {
4660e4aeb9d7489 drivers/staging/typec/fusb302/fusb302.c Hans de Goede     2=
017-08-30  1739  		chip->gpio_int_n_irq =3D client->irq;
4660e4aeb9d7489 drivers/staging/typec/fusb302/fusb302.c Hans de Goede     2=
017-08-30  1740  	} else {
c034a43e72dda58 drivers/staging/typec/fusb302/fusb302.c Yueyao Zhu        2=
017-04-27  1741  		ret =3D init_gpio(chip);
c034a43e72dda58 drivers/staging/typec/fusb302/fusb302.c Yueyao Zhu        2=
017-04-27  1742  		if (ret < 0)
c034a43e72dda58 drivers/staging/typec/fusb302/fusb302.c Yueyao Zhu        2=
017-04-27  1743  			goto destroy_workqueue;
4660e4aeb9d7489 drivers/staging/typec/fusb302/fusb302.c Hans de Goede     2=
017-08-30  1744  	}
c034a43e72dda58 drivers/staging/typec/fusb302/fusb302.c Yueyao Zhu        2=
017-04-27  1745 =20
8f6244055bd3369 drivers/usb/typec/tcpm/fusb302.c        Heikki Krogerus   2=
019-08-14  1746  	chip->tcpc_dev.fwnode =3D fusb302_fwnode_get(dev);
8f6244055bd3369 drivers/usb/typec/tcpm/fusb302.c        Heikki Krogerus   2=
019-08-14  1747  	if (IS_ERR(chip->tcpc_dev.fwnode)) {
8f6244055bd3369 drivers/usb/typec/tcpm/fusb302.c        Heikki Krogerus   2=
019-08-14  1748  		ret =3D PTR_ERR(chip->tcpc_dev.fwnode);
8f6244055bd3369 drivers/usb/typec/tcpm/fusb302.c        Heikki Krogerus   2=
019-08-14  1749  		goto destroy_workqueue;
8f6244055bd3369 drivers/usb/typec/tcpm/fusb302.c        Heikki Krogerus   2=
019-08-14  1750  	}
8f6244055bd3369 drivers/usb/typec/tcpm/fusb302.c        Heikki Krogerus   2=
019-08-14  1751 =20
5d79c525405dcf9 drivers/usb/typec/tcpm/fusb302.c        Sebastian Reichel 2=
026-03-10  1752  	bridge_dev =3D devm_drm_dp_hpd_bridge_alloc(chip->dev, to=
_of_node(chip->tcpc_dev.fwnode));
5d79c525405dcf9 drivers/usb/typec/tcpm/fusb302.c        Sebastian Reichel 2=
026-03-10  1753  	if (IS_ERR(bridge_dev)) {
5d79c525405dcf9 drivers/usb/typec/tcpm/fusb302.c        Sebastian Reichel 2=
026-03-10  1754  		ret =3D PTR_ERR(bridge_dev);
5d79c525405dcf9 drivers/usb/typec/tcpm/fusb302.c        Sebastian Reichel 2=
026-03-10  1755  		dev_err_probe(chip->dev, ret, "failed to alloc bridge\n"=
);
5d79c525405dcf9 drivers/usb/typec/tcpm/fusb302.c        Sebastian Reichel 2=
026-03-10  1756  		goto destroy_workqueue;
5d79c525405dcf9 drivers/usb/typec/tcpm/fusb302.c        Sebastian Reichel 2=
026-03-10  1757  	}
5d79c525405dcf9 drivers/usb/typec/tcpm/fusb302.c        Sebastian Reichel 2=
026-03-10  1758 =20
c034a43e72dda58 drivers/staging/typec/fusb302/fusb302.c Yueyao Zhu        2=
017-04-27  1759  	chip->tcpm_port =3D tcpm_register_port(&client->dev, &chi=
p->tcpc_dev);
c034a43e72dda58 drivers/staging/typec/fusb302/fusb302.c Yueyao Zhu        2=
017-04-27  1760  	if (IS_ERR(chip->tcpm_port)) {
8f6244055bd3369 drivers/usb/typec/tcpm/fusb302.c        Heikki Krogerus   2=
019-08-14  1761  		fwnode_handle_put(chip->tcpc_dev.fwnode);
a075590c0aa2b9d drivers/usb/typec/tcpm/fusb302.c        Yang Yingliang    2=
022-09-22  1762  		ret =3D dev_err_probe(dev, PTR_ERR(chip->tcpm_port),
a075590c0aa2b9d drivers/usb/typec/tcpm/fusb302.c        Yang Yingliang    2=
022-09-22  1763  				    "cannot register tcpm port\n");
c034a43e72dda58 drivers/staging/typec/fusb302/fusb302.c Yueyao Zhu        2=
017-04-27  1764  		goto destroy_workqueue;
c034a43e72dda58 drivers/staging/typec/fusb302/fusb302.c Yueyao Zhu        2=
017-04-27  1765  	}
c034a43e72dda58 drivers/staging/typec/fusb302/fusb302.c Yueyao Zhu        2=
017-04-27  1766 =20
6b9db53197094f3 drivers/usb/typec/tcpm/fusb302.c        Alexey Charkov    2=
026-03-17  1767  	ret =3D request_threaded_irq(chip->gpio_int_n_irq, NULL, =
fusb302_irq_intn,
6b9db53197094f3 drivers/usb/typec/tcpm/fusb302.c        Alexey Charkov    2=
026-03-17  1768  				   IRQF_ONESHOT | IRQF_TRIGGER_LOW,
6b9db53197094f3 drivers/usb/typec/tcpm/fusb302.c        Alexey Charkov    2=
026-03-17  1769  				   "fsc_interrupt_int_n", chip);
c034a43e72dda58 drivers/staging/typec/fusb302/fusb302.c Yueyao Zhu        2=
017-04-27  1770  	if (ret < 0) {
cf140a3569714be drivers/usb/typec/fusb302/fusb302.c     Mats Karrman      2=
017-11-24  1771  		dev_err(dev, "cannot request IRQ for GPIO Int_N, ret=3D%=
d", ret);
c034a43e72dda58 drivers/staging/typec/fusb302/fusb302.c Yueyao Zhu        2=
017-04-27  1772  		goto tcpm_unregister_port;
c034a43e72dda58 drivers/staging/typec/fusb302/fusb302.c Yueyao Zhu        2=
017-04-27  1773  	}
c034a43e72dda58 drivers/staging/typec/fusb302/fusb302.c Yueyao Zhu        2=
017-04-27  1774  	enable_irq_wake(chip->gpio_int_n_irq);
c800c51f586b3c3 drivers/usb/typec/fusb302/fusb302.c     Heikki Krogerus   2=
018-09-20  1775  	i2c_set_clientdata(client, chip);
c800c51f586b3c3 drivers/usb/typec/fusb302/fusb302.c     Heikki Krogerus   2=
018-09-20  1776 =20
5d79c525405dcf9 drivers/usb/typec/tcpm/fusb302.c        Sebastian Reichel 2=
026-03-10  1777  	ret =3D devm_drm_dp_hpd_bridge_add(chip->dev, bridge_dev);
5d79c525405dcf9 drivers/usb/typec/tcpm/fusb302.c        Sebastian Reichel 2=
026-03-10  1778  	if (ret)
5d79c525405dcf9 drivers/usb/typec/tcpm/fusb302.c        Sebastian Reichel 2=
026-03-10  1779  		return ret;
5d79c525405dcf9 drivers/usb/typec/tcpm/fusb302.c        Sebastian Reichel 2=
026-03-10  1780 =20
c034a43e72dda58 drivers/staging/typec/fusb302/fusb302.c Yueyao Zhu        2=
017-04-27  1781  	return ret;
c034a43e72dda58 drivers/staging/typec/fusb302/fusb302.c Yueyao Zhu        2=
017-04-27  1782 =20
c034a43e72dda58 drivers/staging/typec/fusb302/fusb302.c Yueyao Zhu        2=
017-04-27  1783  tcpm_unregister_port:
c034a43e72dda58 drivers/staging/typec/fusb302/fusb302.c Yueyao Zhu        2=
017-04-27  1784  	tcpm_unregister_port(chip->tcpm_port);
8f6244055bd3369 drivers/usb/typec/tcpm/fusb302.c        Heikki Krogerus   2=
019-08-14  1785  	fwnode_handle_put(chip->tcpc_dev.fwnode);
c034a43e72dda58 drivers/staging/typec/fusb302/fusb302.c Yueyao Zhu        2=
017-04-27  1786  destroy_workqueue:
1e296b5be40d309 drivers/usb/typec/tcpm/fusb302.c        Hans de Goede     2=
019-08-17  1787  	fusb302_debugfs_exit(chip);
c034a43e72dda58 drivers/staging/typec/fusb302/fusb302.c Yueyao Zhu        2=
017-04-27  1788  	destroy_workqueue(chip->wq);
c034a43e72dda58 drivers/staging/typec/fusb302/fusb302.c Yueyao Zhu        2=
017-04-27  1789 =20
c034a43e72dda58 drivers/staging/typec/fusb302/fusb302.c Yueyao Zhu        2=
017-04-27 @1790  	return ret;
c034a43e72dda58 drivers/staging/typec/fusb302/fusb302.c Yueyao Zhu        2=
017-04-27  1791  }
c034a43e72dda58 drivers/staging/typec/fusb302/fusb302.c Yueyao Zhu        2=
017-04-27  1792 =20

:::::: The code at line 1790 was first introduced by commit
:::::: c034a43e72dda58e4a184d71f5502ef356e04453 staging: typec: Fairchild F=
USB302 Type-c chip driver

:::::: TO: Yueyao Zhu <yueyao@google.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
