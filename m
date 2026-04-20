Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A85512BE05E
	for <oe-kbuild@lists.linux.dev>; Mon, 20 Apr 2026 10:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776682146; cv=none; b=pRq21Vm59uxC8frqzCSnDh7CRXfiE1MGFpi0YoAupFOTmErr1FsSCC9Gd/aw4z62xtEwd58SdCi1LzqSaMBUaxyojALEhIRekQtPUFi0fCWbcNgaQ2aWHPnKgCs7r7XVuBX1hAMVOgf97k4t7Tu/BpVhF8UhsckM/jkCbOaFfC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776682146; c=relaxed/simple;
	bh=CWENQqM4/4ElLLpt3L92DccIJe4Dtpo0XwmBRFfuykk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=sNhl5DJWN9Omzk2OvOe9KAaLdZUgQmgXWeNqCBnRJNgN3x/OWhbdhTGLbOmEAWDwT/mrOpGpKqKUoa9WMGwtoJqZug6N7RDA6TIQDt7gPAQOM1c6ej7WZ+PxeywNUHFlG4IgYyP68wgNNPvkKOURUFi8SHuiFQRYeNTodTbi+QU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GET0tuT/; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GET0tuT/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776682144; x=1808218144;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=CWENQqM4/4ElLLpt3L92DccIJe4Dtpo0XwmBRFfuykk=;
  b=GET0tuT/dxCqLsa21B34bl/6v8SWmc1uaig/q209VDG8SSX8Xt2nMSA9
   GDaoU08J1ZyiEyU5QbXwBPVEetfaveDxEwHWdyUae5ReNTDmTcjeRDXYJ
   mlvRviJMs9BCUvr7cF29RVcnIk2PKBTFEMUyLHcGpVR00qjOfaeCWtVsm
   2xrmK//JtrgfkEQbpxI8TRlVfFKfHuShdjtXHsAuO7JMidV72XYWo1IOn
   ZHnQWoFR3VURYEdjpGbZxBK2ID3m37cyyw2Tdk2PUGCi9aqKo5HBdUNQs
   s+L+uVMGvP/nYvTAMXs/mUBJLx70lWwQ7tEn6S/dOcUvDbC9SgtxmFUl+
   A==;
X-CSE-ConnectionGUID: ilKxhv8oTzuuvuBvOp02Bg==
X-CSE-MsgGUID: Z8uBLyxFSkGqQi1qGth/sg==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="77463588"
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; 
   d="scan'208";a="77463588"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2026 03:49:03 -0700
X-CSE-ConnectionGUID: m0xx+kD7StqYY053ISX1mQ==
X-CSE-MsgGUID: /pcyg5NsSda58SWwNnjTdw==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 20 Apr 2026 03:49:02 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wEmBY-000000002G1-055N;
	Mon, 20 Apr 2026 10:49:00 +0000
Date: Mon, 20 Apr 2026 12:48:37 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [thermal:thermal/cooling-device-with-id-v2 6/14]
 drivers/power/supply/power_supply_core.c:1578: multiple definition of
 `devm_thermal_cooling_device_register';
 drivers/base/power/main.o:drivers/base/power/main.c:1716: first defined here
Message-ID: <202604201227.E9aaokt5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

::::::=20
:::::: Manual check reason: "low confidence bisect report"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thermal/linux.git t=
hermal/cooling-device-with-id-v2
head:   a1f086d250b04a9b833e71a6fa865e3600c5dac0
commit: 729cfe840489da5dcaf0bf3b57361263c2cbf125 [6/14] thermal/core: Regis=
ter cooling device non-OF drivers
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
config: powerpc64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/=
20260420/202604201227.E9aaokt5-lkp@intel.com/config)
compiler: powerpc64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260420/202604201227.E9aaokt5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604201227.E9aaokt5-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc64-linux-gnu-ld: drivers/power/supply/power_supply_core.o: in fun=
ction `devm_thermal_cooling_device_register':
>> drivers/power/supply/power_supply_core.c:1578: multiple definition of `d=
evm_thermal_cooling_device_register'; drivers/base/power/main.o:drivers/bas=
e/power/main.c:1716: first defined here
   powerpc64-linux-gnu-ld: drivers/cpufreq/cpufreq.o: in function `devm_the=
rmal_cooling_device_register':
   drivers/cpufreq/cpufreq.c:1911: multiple definition of `devm_thermal_coo=
ling_device_register'; drivers/base/power/main.o:drivers/base/power/main.c:=
1716: first defined here


vim +1578 drivers/power/supply/power_supply_core.c

3be330bf8860dc drivers/power/power_supply_core.c        Jenny TC           =
 2012-05-09  1564 =20
297d716f6260cc drivers/power/power_supply_core.c        Krzysztof Kozlowski=
 2015-03-12  1565  static struct power_supply *__must_check
297d716f6260cc drivers/power/power_supply_core.c        Krzysztof Kozlowski=
 2015-03-12  1566  __power_supply_register(struct device *parent,
297d716f6260cc drivers/power/power_supply_core.c        Krzysztof Kozlowski=
 2015-03-12  1567  				   const struct power_supply_desc *desc,
85d319e14f301e drivers/power/supply/power_supply_core.c Thomas Wei=C3=9Fsch=
uh    2024-10-05  1568  				   const struct power_supply_config *cfg)
4a11b59d828366 drivers/power/power_supply_core.c        Anton Vorontsov    =
 2007-05-04  1569  {
5f487cd34f4337 drivers/power/power_supply_core.c        Anton Vorontsov    =
 2010-05-18  1570  	struct device *dev;
297d716f6260cc drivers/power/power_supply_core.c        Krzysztof Kozlowski=
 2015-03-12  1571  	struct power_supply *psy;
9ba533eb99bb2a drivers/power/supply/power_supply_core.c Matthias Kaehlcke  =
 2021-09-01  1572  	int rc;
4a11b59d828366 drivers/power/power_supply_core.c        Anton Vorontsov    =
 2007-05-04  1573 =20
bfaecf465a058b drivers/power/supply/power_supply_core.c qinyu              =
 2023-02-23  1574  	if (!desc || !desc->name || !desc->properties || !desc-=
>num_properties)
bfaecf465a058b drivers/power/supply/power_supply_core.c qinyu              =
 2023-02-23  1575  		return ERR_PTR(-EINVAL);
bfaecf465a058b drivers/power/supply/power_supply_core.c qinyu              =
 2023-02-23  1576 =20
7f1a57fdd6cb6e drivers/power/power_supply_core.c        Krzysztof Kozlowski=
 2015-05-19  1577  	if (!parent)
7f1a57fdd6cb6e drivers/power/power_supply_core.c        Krzysztof Kozlowski=
 2015-05-19 @1578  		pr_warn("%s: Expected proper parent device for '%s'\n",
7f1a57fdd6cb6e drivers/power/power_supply_core.c        Krzysztof Kozlowski=
 2015-05-19  1579  			__func__, desc->name);
7f1a57fdd6cb6e drivers/power/power_supply_core.c        Krzysztof Kozlowski=
 2015-05-19  1580 =20
297d716f6260cc drivers/power/power_supply_core.c        Krzysztof Kozlowski=
 2015-03-12  1581  	psy =3D kzalloc(sizeof(*psy), GFP_KERNEL);
297d716f6260cc drivers/power/power_supply_core.c        Krzysztof Kozlowski=
 2015-03-12  1582  	if (!psy)
297d716f6260cc drivers/power/power_supply_core.c        Krzysztof Kozlowski=
 2015-03-12  1583  		return ERR_PTR(-ENOMEM);
297d716f6260cc drivers/power/power_supply_core.c        Krzysztof Kozlowski=
 2015-03-12  1584 =20
297d716f6260cc drivers/power/power_supply_core.c        Krzysztof Kozlowski=
 2015-03-12  1585  	dev =3D &psy->dev;
4a11b59d828366 drivers/power/power_supply_core.c        Anton Vorontsov    =
 2007-05-04  1586 =20
5f487cd34f4337 drivers/power/power_supply_core.c        Anton Vorontsov    =
 2010-05-18  1587  	device_initialize(dev);
4a11b59d828366 drivers/power/power_supply_core.c        Anton Vorontsov    =
 2007-05-04  1588 =20
71c2cc5cbf686c drivers/power/supply/power_supply_core.c Ricardo B. Marliere=
 2024-03-01  1589  	dev->class =3D &power_supply_class;
5f487cd34f4337 drivers/power/power_supply_core.c        Anton Vorontsov    =
 2010-05-18  1590  	dev->type =3D &power_supply_dev_type;
5f487cd34f4337 drivers/power/power_supply_core.c        Anton Vorontsov    =
 2010-05-18  1591  	dev->parent =3D parent;
5f487cd34f4337 drivers/power/power_supply_core.c        Anton Vorontsov    =
 2010-05-18  1592  	dev->release =3D power_supply_dev_release;
5f487cd34f4337 drivers/power/power_supply_core.c        Anton Vorontsov    =
 2010-05-18  1593  	dev_set_drvdata(dev, psy);
297d716f6260cc drivers/power/power_supply_core.c        Krzysztof Kozlowski=
 2015-03-12  1594  	psy->desc =3D desc;
2dc9215d7c94f7 drivers/power/power_supply_core.c        Krzysztof Kozlowski=
 2015-03-12  1595  	if (cfg) {
520c790c83e9e4 drivers/power/supply/power_supply_core.c Sebastian Reichel  =
 2025-06-08  1596  		device_set_node(dev, cfg->fwnode);
cef8fe6a382cb5 drivers/power/supply/power_supply_core.c Sebastian Reichel  =
 2018-09-27  1597  		dev->groups =3D cfg->attr_grp;
2dc9215d7c94f7 drivers/power/power_supply_core.c        Krzysztof Kozlowski=
 2015-03-12  1598  		psy->drv_data =3D cfg->drv_data;
2dc9215d7c94f7 drivers/power/power_supply_core.c        Krzysztof Kozlowski=
 2015-03-12  1599  		psy->supplied_to =3D cfg->supplied_to;
2dc9215d7c94f7 drivers/power/power_supply_core.c        Krzysztof Kozlowski=
 2015-03-12  1600  		psy->num_supplicants =3D cfg->num_supplicants;
2dc9215d7c94f7 drivers/power/power_supply_core.c        Krzysztof Kozlowski=
 2015-03-12  1601  	}
5f487cd34f4337 drivers/power/power_supply_core.c        Anton Vorontsov    =
 2010-05-18  1602 =20
297d716f6260cc drivers/power/power_supply_core.c        Krzysztof Kozlowski=
 2015-03-12  1603  	rc =3D dev_set_name(dev, "%s", desc->name);
80c6463e2fa337 drivers/power/power_supply_core.c        Shuah Khan         =
 2013-11-22  1604  	if (rc)
80c6463e2fa337 drivers/power/power_supply_core.c        Shuah Khan         =
 2013-11-22  1605  		goto dev_set_name_failed;
80c6463e2fa337 drivers/power/power_supply_core.c        Shuah Khan         =
 2013-11-22  1606 =20
97774672573ac4 drivers/power/power_supply_core.c        Lars-Peter Clausen =
 2011-02-21  1607  	INIT_WORK(&psy->changed_work, power_supply_changed_work=
);
7f1a57fdd6cb6e drivers/power/power_supply_core.c        Krzysztof Kozlowski=
 2015-05-19  1608  	INIT_DELAYED_WORK(&psy->deferred_register_work,
7f1a57fdd6cb6e drivers/power/power_supply_core.c        Krzysztof Kozlowski=
 2015-05-19  1609  			  power_supply_deferred_register_work);
97774672573ac4 drivers/power/power_supply_core.c        Lars-Peter Clausen =
 2011-02-21  1610 =20
f6e0b081fb300a drivers/power/power_supply_core.c        Rhyland Klein      =
 2013-04-01  1611  	rc =3D power_supply_check_supplies(psy);
f6e0b081fb300a drivers/power/power_supply_core.c        Rhyland Klein      =
 2013-04-01  1612  	if (rc) {
3af26e2ad514df drivers/power/supply/power_supply_core.c Sebastian Reichel  =
 2021-03-09  1613  		dev_dbg(dev, "Not all required supplies found, defer p=
robe\n");
f6e0b081fb300a drivers/power/power_supply_core.c        Rhyland Klein      =
 2013-04-01  1614  		goto check_supplies_failed;
f6e0b081fb300a drivers/power/power_supply_core.c        Rhyland Klein      =
 2013-04-01  1615  	}
f6e0b081fb300a drivers/power/power_supply_core.c        Rhyland Klein      =
 2013-04-01  1616 =20
27a2195efa8d26 drivers/power/supply/power_supply_core.c Sebastian Reichel  =
 2023-03-17  1617  	/*
27a2195efa8d26 drivers/power/supply/power_supply_core.c Sebastian Reichel  =
 2023-03-17  1618  	 * Expose constant battery info, if it is available. Wh=
ile there are
27a2195efa8d26 drivers/power/supply/power_supply_core.c Sebastian Reichel  =
 2023-03-17  1619  	 * some chargers accessing constant battery data, we on=
ly want to
27a2195efa8d26 drivers/power/supply/power_supply_core.c Sebastian Reichel  =
 2023-03-17  1620  	 * expose battery data to userspace for battery devices.
27a2195efa8d26 drivers/power/supply/power_supply_core.c Sebastian Reichel  =
 2023-03-17  1621  	 */
27a2195efa8d26 drivers/power/supply/power_supply_core.c Sebastian Reichel  =
 2023-03-17  1622  	if (desc->type =3D=3D POWER_SUPPLY_TYPE_BATTERY) {
27a2195efa8d26 drivers/power/supply/power_supply_core.c Sebastian Reichel  =
 2023-03-17  1623  		rc =3D power_supply_get_battery_info(psy, &psy->batter=
y_info);
27a2195efa8d26 drivers/power/supply/power_supply_core.c Sebastian Reichel  =
 2023-03-17  1624  		if (rc && rc !=3D -ENODEV && rc !=3D -ENOENT)
27a2195efa8d26 drivers/power/supply/power_supply_core.c Sebastian Reichel  =
 2023-03-17  1625  			goto check_supplies_failed;
27a2195efa8d26 drivers/power/supply/power_supply_core.c Sebastian Reichel  =
 2023-03-17  1626  	}
27a2195efa8d26 drivers/power/supply/power_supply_core.c Sebastian Reichel  =
 2023-03-17  1627 =20
948dcf96622814 drivers/power/power_supply_core.c        Zoran Markovic     =
 2013-08-02  1628  	spin_lock_init(&psy->changed_lock);
6037802bbae892 drivers/power/supply/power_supply_core.c Thomas Wei=C3=9Fsch=
uh    2024-12-11  1629  	init_rwsem(&psy->extensions_sem);
6037802bbae892 drivers/power/supply/power_supply_core.c Thomas Wei=C3=9Fsch=
uh    2024-12-11  1630  	INIT_LIST_HEAD(&psy->extensions);
6037802bbae892 drivers/power/supply/power_supply_core.c Thomas Wei=C3=9Fsch=
uh    2024-12-11  1631 =20
5f487cd34f4337 drivers/power/power_supply_core.c        Anton Vorontsov    =
 2010-05-18  1632  	rc =3D device_add(dev);
4a11b59d828366 drivers/power/power_supply_core.c        Anton Vorontsov    =
 2007-05-04  1633  	if (rc)
5f487cd34f4337 drivers/power/power_supply_core.c        Anton Vorontsov    =
 2010-05-18  1634  		goto device_add_failed;
5f487cd34f4337 drivers/power/power_supply_core.c        Anton Vorontsov    =
 2010-05-18  1635 =20
85d319e14f301e drivers/power/supply/power_supply_core.c Thomas Wei=C3=9Fsch=
uh    2024-10-05  1636  	rc =3D device_init_wakeup(dev, cfg ? !cfg->no_wake=
up_source : true);
8288022284859a drivers/power/supply/power_supply_core.c Stephen Boyd       =
 2019-08-01  1637  	if (rc)
8288022284859a drivers/power/supply/power_supply_core.c Stephen Boyd       =
 2019-08-01  1638  		goto wakeup_init_failed;
8288022284859a drivers/power/supply/power_supply_core.c Stephen Boyd       =
 2019-08-01  1639 =20
3be330bf8860dc drivers/power/power_supply_core.c        Jenny TC           =
 2012-05-09  1640  	rc =3D psy_register_thermal(psy);
3be330bf8860dc drivers/power/power_supply_core.c        Jenny TC           =
 2012-05-09  1641  	if (rc)
3be330bf8860dc drivers/power/power_supply_core.c        Jenny TC           =
 2012-05-09  1642  		goto register_thermal_failed;
3be330bf8860dc drivers/power/power_supply_core.c        Jenny TC           =
 2012-05-09  1643 =20
4a11b59d828366 drivers/power/power_supply_core.c        Anton Vorontsov    =
 2007-05-04  1644  	rc =3D power_supply_create_triggers(psy);
4a11b59d828366 drivers/power/power_supply_core.c        Anton Vorontsov    =
 2007-05-04  1645  	if (rc)
4a11b59d828366 drivers/power/power_supply_core.c        Anton Vorontsov    =
 2007-05-04  1646  		goto create_triggers_failed;
4a11b59d828366 drivers/power/power_supply_core.c        Anton Vorontsov    =
 2007-05-04  1647 =20
64dd6edfc42147 drivers/power/supply/power_supply_core.c Hans de Goede      =
 2025-01-30  1648  	scoped_guard(rwsem_read, &psy->extensions_sem) {
e67d4dfc9ff19d drivers/power/supply/power_supply_core.c Andrey Smirnov     =
 2019-06-12  1649  		rc =3D power_supply_add_hwmon_sysfs(psy);
e67d4dfc9ff19d drivers/power/supply/power_supply_core.c Andrey Smirnov     =
 2019-06-12  1650  		if (rc)
e67d4dfc9ff19d drivers/power/supply/power_supply_core.c Andrey Smirnov     =
 2019-06-12  1651  			goto add_hwmon_sysfs_failed;
6037802bbae892 drivers/power/supply/power_supply_core.c Thomas Wei=C3=9Fsch=
uh    2024-12-11  1652  	}
e67d4dfc9ff19d drivers/power/supply/power_supply_core.c Andrey Smirnov     =
 2019-06-12  1653 =20
8e59c7f23410d5 drivers/power/power_supply_core.c        Krzysztof Kozlowski=
 2015-05-19  1654  	/*
8e59c7f23410d5 drivers/power/power_supply_core.c        Krzysztof Kozlowski=
 2015-05-19  1655  	 * Update use_cnt after any uevents (most notably from =
device_add()).
8e59c7f23410d5 drivers/power/power_supply_core.c        Krzysztof Kozlowski=
 2015-05-19  1656  	 * We are here still during driver's probe but
8e59c7f23410d5 drivers/power/power_supply_core.c        Krzysztof Kozlowski=
 2015-05-19  1657  	 * the power_supply_uevent() calls back driver's get_pr=
operty
8e59c7f23410d5 drivers/power/power_supply_core.c        Krzysztof Kozlowski=
 2015-05-19  1658  	 * method so:
8e59c7f23410d5 drivers/power/power_supply_core.c        Krzysztof Kozlowski=
 2015-05-19  1659  	 * 1. Driver did not assigned the returned struct power=
_supply,
8e59c7f23410d5 drivers/power/power_supply_core.c        Krzysztof Kozlowski=
 2015-05-19  1660  	 * 2. Driver could not finish initialization (anything =
in its probe
8e59c7f23410d5 drivers/power/power_supply_core.c        Krzysztof Kozlowski=
 2015-05-19  1661  	 *    after calling power_supply_register()).
8e59c7f23410d5 drivers/power/power_supply_core.c        Krzysztof Kozlowski=
 2015-05-19  1662  	 */
8e59c7f23410d5 drivers/power/power_supply_core.c        Krzysztof Kozlowski=
 2015-05-19  1663  	atomic_inc(&psy->use_cnt);
e380538529e83c drivers/power/power_supply_core.c        Rhyland Klein      =
 2016-06-22  1664  	psy->initialized =3D true;
7f1a57fdd6cb6e drivers/power/power_supply_core.c        Krzysztof Kozlowski=
 2015-05-19  1665 =20
7f1a57fdd6cb6e drivers/power/power_supply_core.c        Krzysztof Kozlowski=
 2015-05-19  1666  	queue_delayed_work(system_power_efficient_wq,
7f1a57fdd6cb6e drivers/power/power_supply_core.c        Krzysztof Kozlowski=
 2015-05-19  1667  			   &psy->deferred_register_work,
7f1a57fdd6cb6e drivers/power/power_supply_core.c        Krzysztof Kozlowski=
 2015-05-19  1668  			   POWER_SUPPLY_DEFERRED_REGISTER_TIME);
4a11b59d828366 drivers/power/power_supply_core.c        Anton Vorontsov    =
 2007-05-04  1669 =20
297d716f6260cc drivers/power/power_supply_core.c        Krzysztof Kozlowski=
 2015-03-12  1670  	return psy;
4a11b59d828366 drivers/power/power_supply_core.c        Anton Vorontsov    =
 2007-05-04  1671 =20
e67d4dfc9ff19d drivers/power/supply/power_supply_core.c Andrey Smirnov     =
 2019-06-12  1672  add_hwmon_sysfs_failed:
e67d4dfc9ff19d drivers/power/supply/power_supply_core.c Andrey Smirnov     =
 2019-06-12  1673  	power_supply_remove_triggers(psy);
4a11b59d828366 drivers/power/power_supply_core.c        Anton Vorontsov    =
 2007-05-04  1674  create_triggers_failed:
3be330bf8860dc drivers/power/power_supply_core.c        Jenny TC           =
 2012-05-09  1675  	psy_unregister_thermal(psy);
3be330bf8860dc drivers/power/power_supply_core.c        Jenny TC           =
 2012-05-09  1676  register_thermal_failed:
80c6463e2fa337 drivers/power/power_supply_core.c        Shuah Khan         =
 2013-11-22  1677  wakeup_init_failed:
5b79480ce19788 drivers/power/supply/power_supply_core.c Zeng Heng          =
 2022-11-17  1678  	device_del(dev);
8288022284859a drivers/power/supply/power_supply_core.c Stephen Boyd       =
 2019-08-01  1679  device_add_failed:
f6e0b081fb300a drivers/power/power_supply_core.c        Rhyland Klein      =
 2013-04-01  1680  check_supplies_failed:
80c6463e2fa337 drivers/power/power_supply_core.c        Shuah Khan         =
 2013-11-22  1681  dev_set_name_failed:
3a2dbd611b38cf drivers/power/power_supply_core.c        Vasiliy Kulikov    =
 2010-11-19  1682  	put_device(dev);
297d716f6260cc drivers/power/power_supply_core.c        Krzysztof Kozlowski=
 2015-03-12  1683  	return ERR_PTR(rc);
4a11b59d828366 drivers/power/power_supply_core.c        Anton Vorontsov    =
 2007-05-04  1684  }
9113e260767b1c drivers/power/power_supply_core.c        Zhang Rui          =
 2014-05-28  1685 =20

:::::: The code at line 1578 was first introduced by commit
:::::: 7f1a57fdd6cb6e7be2ed31878a34655df38e1861 power_supply: Fix possible =
NULL pointer dereference on early uevent

:::::: TO: Krzysztof Kozlowski <k.kozlowski@samsung.com>
:::::: CC: Sebastian Reichel <sre@kernel.org>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
