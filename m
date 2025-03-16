Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7634C80
	for <oe-kbuild@lists.linux.dev>; Sun, 16 Mar 2025 01:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742087219; cv=none; b=PtRAFH5L0Ujm4FglCjfCEPKGmWr+qxeg6cEXw/tKf9Tczf7s0IIK/glAw+7hpe+g7pu1UGTndGP9xBp8bhjYwU/IokVm5PFfqGsG2lJaslesk1GKlQZ67+JltHwDgUCSssdNp2HrRwmZHSgaJOIAhjurKk230NtfA1kKZiLAZY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742087219; c=relaxed/simple;
	bh=O3SU802k6SjAn8XuhgD1a0j1Zb/SKkz+2KPJW5AgOaE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R4cRd7BwNKzfeuQ7/5p2QAXJ2X1SM4Wgra9/AreMJAtlTi9mc1tuIkuyZGAB4+/vSjU6o8HbLuN/Atry5uV6CQmezMWWfH53b4Ki0RY+IoMxXIK8P526k1wG8KUTCpYSWDAf9tDWq8grX4GZ32wqU3SLhKcU3Geq0Ys6k7DfAMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mZViy7P5; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mZViy7P5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742087217; x=1773623217;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=O3SU802k6SjAn8XuhgD1a0j1Zb/SKkz+2KPJW5AgOaE=;
  b=mZViy7P5XHTHvTWlJslcloTFLwHGpDhr8iufWXeAqNgsgVsFMz0/PSIe
   YK+lNiZicME0TwEdn0XsPBzI9Kci2zXupv56tyG179pn5MQnPRQLjRwrJ
   rdgVkAQzi+7sAfUfwal8WLd6F/cCH7z0I5Nz5uDjRoIaMRaWlej6/Y+nZ
   6i7e4VvdtIdlQV3Fedf8izpuIdqtWnPfOomQ3fsu/HWZizn7o7m1mag+W
   pZllOBpXbi4kz5cx1IUoNSpkuzjdpfgxCO2WvSnPq6VOmjQj7Kp/DdCmN
   LI9eAyivm1Q5e5RZXMmDsh6HpmkBE2bdr8KvSd/aaTXSw89YlOX3FUGsz
   g==;
X-CSE-ConnectionGUID: W+qXipPCTQa7ayst+BLxUg==
X-CSE-MsgGUID: p3i+gZg8RNa2c2UITKnPGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11374"; a="43095430"
X-IronPort-AV: E=Sophos;i="6.14,251,1736841600"; 
   d="scan'208";a="43095430"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2025 18:06:56 -0700
X-CSE-ConnectionGUID: g3L0DfQQQhC2C9seOoEcWQ==
X-CSE-MsgGUID: 5XffTUjeQESrtkrh3aeMlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,251,1736841600"; 
   d="scan'208";a="152494446"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 15 Mar 2025 18:06:55 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ttcSq-000BkW-2Y;
	Sun, 16 Mar 2025 01:06:52 +0000
Date: Sun, 16 Mar 2025 09:06:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/hwmon/hwmon.c:241 hwmon_thermal_add_sensor() warn: passing
 positive error code '(-524)' to 'PTR_ERR'
Message-ID: <202503160844.bmAU7Hyd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Thomas Weiﬂschuh" <linux@weissschuh.net>
CC: Guenter Roeck <linux@roeck-us.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   eb88e6bfbc0a975e08a18c39d1138d3e6cdc00a5
commit: 4d2ffc42f78c429b7d42a635351a654c6f0b01b5 hwmon: (core) Avoid ifdef CONFIG_THERMAL in C source file
date:   3 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 3 months ago
config: openrisc-randconfig-r071-20250314 (https://download.01.org/0day-ci/archive/20250316/202503160844.bmAU7Hyd-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503160844.bmAU7Hyd-lkp@intel.com/

smatch warnings:
drivers/hwmon/hwmon.c:241 hwmon_thermal_add_sensor() warn: passing positive error code '(-524)' to 'PTR_ERR'

vim +241 drivers/hwmon/hwmon.c

1597b374af22266 Guenter Roeck  2020-05-28  222  
3bf8bdcf3bada77 Guenter Roeck  2020-01-16  223  static int hwmon_thermal_add_sensor(struct device *dev, int index)
d560168b5d0fb4a Guenter Roeck  2015-08-26  224  {
1597b374af22266 Guenter Roeck  2020-05-28  225  	struct hwmon_device *hwdev = to_hwmon_device(dev);
d560168b5d0fb4a Guenter Roeck  2015-08-26  226  	struct hwmon_thermal_data *tdata;
47c332deb8e89f6 Linus Walleij  2017-12-05  227  	struct thermal_zone_device *tzd;
1597b374af22266 Guenter Roeck  2020-05-28  228  	int err;
d560168b5d0fb4a Guenter Roeck  2015-08-26  229  
d560168b5d0fb4a Guenter Roeck  2015-08-26  230  	tdata = devm_kzalloc(dev, sizeof(*tdata), GFP_KERNEL);
d560168b5d0fb4a Guenter Roeck  2015-08-26  231  	if (!tdata)
d560168b5d0fb4a Guenter Roeck  2015-08-26  232  		return -ENOMEM;
d560168b5d0fb4a Guenter Roeck  2015-08-26  233  
3bf8bdcf3bada77 Guenter Roeck  2020-01-16  234  	tdata->dev = dev;
d560168b5d0fb4a Guenter Roeck  2015-08-26  235  	tdata->index = index;
d560168b5d0fb4a Guenter Roeck  2015-08-26  236  
e5181331359d931 Daniel Lezcano 2022-08-05  237  	tzd = devm_thermal_of_zone_register(dev, index, tdata,
d560168b5d0fb4a Guenter Roeck  2015-08-26  238  					    &hwmon_thermal_ops);
1b5f517cca36292 Guenter Roeck  2022-02-21  239  	if (IS_ERR(tzd)) {
1b5f517cca36292 Guenter Roeck  2022-02-21  240  		if (PTR_ERR(tzd) != -ENODEV)
47c332deb8e89f6 Linus Walleij  2017-12-05 @241  			return PTR_ERR(tzd);
1b5f517cca36292 Guenter Roeck  2022-02-21  242  		dev_info(dev, "temp%d_input not attached to any thermal zone\n",
1b5f517cca36292 Guenter Roeck  2022-02-21  243  			 index + 1);
1b5f517cca36292 Guenter Roeck  2022-02-21  244  		devm_kfree(dev, tdata);
1b5f517cca36292 Guenter Roeck  2022-02-21  245  		return 0;
1b5f517cca36292 Guenter Roeck  2022-02-21  246  	}
d560168b5d0fb4a Guenter Roeck  2015-08-26  247  
1597b374af22266 Guenter Roeck  2020-05-28  248  	err = devm_add_action(dev, hwmon_thermal_remove_sensor, &tdata->node);
1597b374af22266 Guenter Roeck  2020-05-28  249  	if (err)
1597b374af22266 Guenter Roeck  2020-05-28  250  		return err;
1597b374af22266 Guenter Roeck  2020-05-28  251  
1597b374af22266 Guenter Roeck  2020-05-28  252  	tdata->tzd = tzd;
1597b374af22266 Guenter Roeck  2020-05-28  253  	list_add(&tdata->node, &hwdev->tzdata);
1597b374af22266 Guenter Roeck  2020-05-28  254  
d560168b5d0fb4a Guenter Roeck  2015-08-26  255  	return 0;
d560168b5d0fb4a Guenter Roeck  2015-08-26  256  }
44e3ad882bb2685 Akinobu Mita   2020-05-04  257  

:::::: The code at line 241 was first introduced by commit
:::::: 47c332deb8e89f6c59b0bb2615945c6e7fad1a60 hwmon: Deal with errors from the thermal subsystem

:::::: TO: Linus Walleij <linus.walleij@linaro.org>
:::::: CC: Guenter Roeck <linux@roeck-us.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
