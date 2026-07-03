Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 402A5433E90
	for <oe-kbuild@lists.linux.dev>; Fri,  3 Jul 2026 07:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783065152; cv=none; b=YPZIzRJNY7EFVQb94N7eCMgZSf8lTQyO/pPshMYJbQfJlXu+u0EIUe+VeUyf6E46KNQAaUqFzhyI+EV9UkCpaItmEohQZzq/Wu67EI49GQR2IET8PrUc501isIxEYGeF7za0QQ0y2EqIca4r+HqC2AxMcre69OMKyifDn2GyXtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783065152; c=relaxed/simple;
	bh=MZ27mN80d4OzI68F8kjmi2YsTS5euCR2XvkeUvgJHGY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Y0rjuyiuyjEPcZO+rc4lRGG76qG1VUdIL1OzJv3XFl+DlkE+aHV7gx8gh0gZHAlyUgx6mqsO0ygk5MY5pjnw5A9L8dJaafDaFlLX2WeIFM2+vh8fzOz9DM+8GjQQ1Jb+/FMWs7Mhttndkyk7CG7RrbhuOiyeVc3QikyR10FKSN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jZbq4w/D; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jZbq4w/D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783065150; x=1814601150;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=MZ27mN80d4OzI68F8kjmi2YsTS5euCR2XvkeUvgJHGY=;
  b=jZbq4w/DfzoAapidyKhjf9NiPlDkpTjFM+NKSp1pWIBf8yjLR5DI5tx0
   99TBswu7aNNxCKem0y00QeAq+90jqVKkaOc17XMO53iO4wUJsAdPbGZtM
   akikXk2HmxCeNf+Fn6SDKRJ31XWKvZddovZq1VC3V8iBDaTMzn3xTBRFZ
   t36d0DIwEpZrBxSc7RSgWR0C9FTFxSJmbnk4MnnKeXqKdXUMVwdiD0wRL
   DmJF41/RBLWPSh/isO0ssdaQ74hQLw3JJzKfnrEctlSl/RoGYJGD8DkLp
   mFJ3N7SsO7iE9/cwWPHqHn1I1Z5qbRZVUYTW3z/2bRn+HlDUVYt8Z13K2
   A==;
X-CSE-ConnectionGUID: AfGyCYW9RpqZIU11vemZ1Q==
X-CSE-MsgGUID: qoFI5QcjS8uy43JxtWGyOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="94968986"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="94968986"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 00:52:30 -0700
X-CSE-ConnectionGUID: WXTXOPsbSWSWszhbkXc9uw==
X-CSE-MsgGUID: RbYuRdWkQh2430X+o7Y+3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="253193601"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 03 Jul 2026 00:52:28 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfYhB-00000000Bq3-22vk;
	Fri, 03 Jul 2026 07:52:21 +0000
Date: Fri, 03 Jul 2026 15:51:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [thomas-weissschuh:b4/cros_ec-hwmon-locking 2/6]
 drivers/hwmon/cros_ec_hwmon.c:578 cros_ec_hwmon_probe() warn: passing zero to
 'PTR_ERR'
Message-ID: <202607031558.090AWNd1-lkp@intel.com>
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
TO: "Thomas Wei=C3=9Fschuh" <linux@weissschuh.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/l=
inux.git b4/cros_ec-hwmon-locking
head:   95003896306434c5e2d6cae819f38179e0f5048f
commit: d54d63ebb10e19d82a484c16372173926c021022 [2/6] priv
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: sparc-randconfig-r071-20260702 (https://download.01.org/0day-ci/arc=
hive/20260703/202607031558.090AWNd1-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.4.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607031558.090AWNd1-lkp@intel.com/

smatch warnings:
drivers/hwmon/cros_ec_hwmon.c:578 cros_ec_hwmon_probe() warn: passing zero =
to 'PTR_ERR'

vim +/PTR_ERR +578 drivers/hwmon/cros_ec_hwmon.c

5798b62867b47b Sung-Chi Li      2025-09-11  545 =20
bc3e45258096f2 Thomas Wei=C3=9Fschuh 2024-05-29  546  static int cros_ec_hw=
mon_probe(struct platform_device *pdev)
bc3e45258096f2 Thomas Wei=C3=9Fschuh 2024-05-29  547  {
bc3e45258096f2 Thomas Wei=C3=9Fschuh 2024-05-29  548  	struct device *dev =
=3D &pdev->dev;
bc3e45258096f2 Thomas Wei=C3=9Fschuh 2024-05-29  549  	struct cros_ec_dev *=
ec_dev =3D dev_get_drvdata(dev->parent);
bc3e45258096f2 Thomas Wei=C3=9Fschuh 2024-05-29  550  	struct cros_ec_devic=
e *cros_ec =3D ec_dev->ec_dev;
bc3e45258096f2 Thomas Wei=C3=9Fschuh 2024-05-29  551  	struct cros_ec_hwmon=
_priv *priv;
bc3e45258096f2 Thomas Wei=C3=9Fschuh 2024-05-29  552  	struct device *hwmon=
_dev;
bc3e45258096f2 Thomas Wei=C3=9Fschuh 2024-05-29  553  	u8 thermal_version;
bc3e45258096f2 Thomas Wei=C3=9Fschuh 2024-05-29  554  	int ret;
bc3e45258096f2 Thomas Wei=C3=9Fschuh 2024-05-29  555 =20
bc3e45258096f2 Thomas Wei=C3=9Fschuh 2024-05-29  556  	ret =3D cros_ec_cmd_=
readmem(cros_ec, EC_MEMMAP_THERMAL_VERSION, 1, &thermal_version);
bc3e45258096f2 Thomas Wei=C3=9Fschuh 2024-05-29  557  	if (ret < 0)
bc3e45258096f2 Thomas Wei=C3=9Fschuh 2024-05-29  558  		return ret;
bc3e45258096f2 Thomas Wei=C3=9Fschuh 2024-05-29  559 =20
bc3e45258096f2 Thomas Wei=C3=9Fschuh 2024-05-29  560  	/* Covers both fan a=
nd temp sensors */
bc3e45258096f2 Thomas Wei=C3=9Fschuh 2024-05-29  561  	if (thermal_version =
=3D=3D 0)
bc3e45258096f2 Thomas Wei=C3=9Fschuh 2024-05-29  562  		return -ENODEV;
bc3e45258096f2 Thomas Wei=C3=9Fschuh 2024-05-29  563 =20
bc3e45258096f2 Thomas Wei=C3=9Fschuh 2024-05-29  564  	priv =3D devm_kzallo=
c(dev, sizeof(*priv), GFP_KERNEL);
bc3e45258096f2 Thomas Wei=C3=9Fschuh 2024-05-29  565  	if (!priv)
bc3e45258096f2 Thomas Wei=C3=9Fschuh 2024-05-29  566  		return -ENOMEM;
bc3e45258096f2 Thomas Wei=C3=9Fschuh 2024-05-29  567 =20
bc3e45258096f2 Thomas Wei=C3=9Fschuh 2024-05-29  568  	priv->cros_ec =3D cr=
os_ec;
bc3e45258096f2 Thomas Wei=C3=9Fschuh 2024-05-29  569 =20
bc3e45258096f2 Thomas Wei=C3=9Fschuh 2024-05-29  570  	cros_ec_hwmon_probe_=
temp_sensors(dev, priv, thermal_version);
bc3e45258096f2 Thomas Wei=C3=9Fschuh 2024-05-29  571  	cros_ec_hwmon_probe_=
fans(priv);
fb8e659309f72e Sung-Chi Li      2025-09-11  572  	priv->fan_control_support=
ed =3D cros_ec_hwmon_probe_fan_control_supported(priv->cros_ec);
afa7c56ec44731 Thomas Wei=C3=9Fschuh 2026-01-18  573  	priv->temp_threshold=
_supported =3D is_cros_ec_cmd_available(priv->cros_ec,
afa7c56ec44731 Thomas Wei=C3=9Fschuh 2026-01-18  574  								  EC_CMD_THER=
MAL_GET_THRESHOLD, 1);
bc3e45258096f2 Thomas Wei=C3=9Fschuh 2024-05-29  575 =20
d54d63ebb10e19 Thomas Wei=C3=9Fschuh 2026-07-01  576  	priv->hwmon_dev =3D =
devm_hwmon_device_register_with_info(dev, "cros_ec", priv,
bc3e45258096f2 Thomas Wei=C3=9Fschuh 2024-05-29  577  							       &cros_e=
c_hwmon_chip_info, NULL);
d54d63ebb10e19 Thomas Wei=C3=9Fschuh 2026-07-01 @578  	if (PTR_ERR(priv->hw=
mon_dev))
d54d63ebb10e19 Thomas Wei=C3=9Fschuh 2026-07-01  579  		return PTR_ERR(priv=
->hwmon_dev);
d54d63ebb10e19 Thomas Wei=C3=9Fschuh 2026-07-01  580 =20
d54d63ebb10e19 Thomas Wei=C3=9Fschuh 2026-07-01  581  	cros_ec_hwmon_regist=
er_fan_cooling_devices(dev, priv);
d54d63ebb10e19 Thomas Wei=C3=9Fschuh 2026-07-01  582 =20
fb8e659309f72e Sung-Chi Li      2025-09-11  583  	platform_set_drvdata(pdev=
, priv);
bc3e45258096f2 Thomas Wei=C3=9Fschuh 2024-05-29  584 =20
bc3e45258096f2 Thomas Wei=C3=9Fschuh 2024-05-29  585  	return PTR_ERR_OR_ZE=
RO(hwmon_dev);
bc3e45258096f2 Thomas Wei=C3=9Fschuh 2024-05-29  586  }
bc3e45258096f2 Thomas Wei=C3=9Fschuh 2024-05-29  587 =20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
