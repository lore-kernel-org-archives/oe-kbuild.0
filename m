Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E5DA747F
	for <oe-kbuild@lists.linux.dev>; Thu, 14 Aug 2025 00:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755131704; cv=none; b=AaOHnZUucXxBYJs43dTbfi48N/1pcxDakE9ka1NrCqXwsXTzzewGnOCW0hydtJ3BIXFvxHBOn6RaYUSFmnGYi6VUslYipjIi0rKWBQkO+/aa69F/dLDi+LtUWYt25xMOdINnysQrUOsNtdiS0yT8bDzvlhBAjMkMNqKAor/qN+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755131704; c=relaxed/simple;
	bh=uQdxozI+Na/xjGvPK06GyMG64LqhwIqMdbffb+76YkI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fcQFzVZonYknwGaUnKCRRh5+CkC7Kflosi4UmvOJEyH1hiJIXgS5j/ENMVsXaQaKTFXYKKX1QEDQcdELL6vGQQaIytBV4ILewmHpilT2fLbEvJELrza8g9nQAVP5AeunKBA4H4Ot5d08ad1Z5ho9+OTkx5jCLxi6Gwj5bveXETc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EMx0RJMk; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EMx0RJMk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755131702; x=1786667702;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uQdxozI+Na/xjGvPK06GyMG64LqhwIqMdbffb+76YkI=;
  b=EMx0RJMkwKeH+FlL5x8WqxegSYuEUw5GpDYeBaDT4lfRO+r149el4SYT
   gKCWNQz7OjdZuZH6IEYfxE56trdeCV0w8w7S6rzXtnyEXLMPofqZBlcEm
   mUPb887HiOVs3YxYz6Sw5trQ7LGD8v/KiwVPhnV6j2Y1b/VrK0rmXEBG7
   KLNPwTeqGKnf8/EWMebooVwvXJC7sTeEaqci36/yETMDqXFrnrVAvyDfO
   TvgAuzL3BfXnHvq++ZYNxrTEc0UGY6CB+vGX//o8mf6NyfyGbN5pM5yxM
   MMkWvni4N2Gsrpmj90rEEx9rBxZEpsxSQLTaZdV1QSw2PFuxPqJ/sLjXu
   Q==;
X-CSE-ConnectionGUID: VoJ1PiYLQoeKHa/OajGsxw==
X-CSE-MsgGUID: JU+1xOVzQW+D4bXiSeUXew==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="68521436"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="68521436"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2025 17:35:00 -0700
X-CSE-ConnectionGUID: D+L2FbiWQZSpDHi6wEJSpg==
X-CSE-MsgGUID: flMxd+WLRg2TrhIgn13lJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="203794126"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 13 Aug 2025 17:34:58 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umLvk-000ASC-0D;
	Thu, 14 Aug 2025 00:34:56 +0000
Date: Thu, 14 Aug 2025 08:34:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH V6 2/5] mfd: bq257xx: Add support for BQ25703A core driver
Message-ID: <202508140839.hYfIB0Da-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250812214300.123129-3-macroalpha82@gmail.com>
References: <20250812214300.123129-3-macroalpha82@gmail.com>
TO: Chris Morgan <macroalpha82@gmail.com>
TO: linux-rockchip@lists.infradead.org
CC: linux-pm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: broonie@kernel.org
CC: lee@kernel.org
CC: lgirdwood@gmail.com
CC: sre@kernel.org
CC: heiko@sntech.de
CC: conor+dt@kernel.org
CC: krzk+dt@kernel.org
CC: robh@kernel.org
CC: Chris Morgan <macromorgan@hotmail.com>

Hi Chris,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-regulator/for-next]
[also build test WARNING on sre-power-supply/for-next rockchip/for-next linus/master v6.17-rc1 next-20250813]
[cannot apply to lee-mfd/for-mfd-next lee-mfd/for-mfd-fixes]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chris-Morgan/dt-bindings-mfd-ti-bq25703a-Add-TI-BQ25703A-Charger/20250813-054704
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next
patch link:    https://lore.kernel.org/r/20250812214300.123129-3-macroalpha82%40gmail.com
patch subject: [PATCH V6 2/5] mfd: bq257xx: Add support for BQ25703A core driver
:::::: branch date: 26 hours ago
:::::: commit date: 26 hours ago
config: m68k-randconfig-r073-20250814 (https://download.01.org/0day-ci/archive/20250814/202508140839.hYfIB0Da-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202508140839.hYfIB0Da-lkp@intel.com/

New smatch warnings:
drivers/mfd/bq257xx.c:46 bq257xx_probe() warn: sizeof(NUMBER)?

Old smatch warnings:
drivers/mfd/bq257xx.c:47 bq257xx_probe() warn: sizeof(NUMBER)?

vim +46 drivers/mfd/bq257xx.c

4b63b1500e4b18 Chris Morgan 2025-08-12  41  
4b63b1500e4b18 Chris Morgan 2025-08-12  42  static int bq257xx_probe(struct i2c_client *client)
4b63b1500e4b18 Chris Morgan 2025-08-12  43  {
4b63b1500e4b18 Chris Morgan 2025-08-12  44  	struct bq257xx_device *ddata;
4b63b1500e4b18 Chris Morgan 2025-08-12  45  	static const struct mfd_cell cells[] = {
4b63b1500e4b18 Chris Morgan 2025-08-12 @46  		MFD_CELL_NAME("bq257xx-regulator"),
4b63b1500e4b18 Chris Morgan 2025-08-12  47  		MFD_CELL_NAME("bq257xx-charger"),
4b63b1500e4b18 Chris Morgan 2025-08-12  48  	};
4b63b1500e4b18 Chris Morgan 2025-08-12  49  	int ret;
4b63b1500e4b18 Chris Morgan 2025-08-12  50  
4b63b1500e4b18 Chris Morgan 2025-08-12  51  	ddata = devm_kzalloc(&client->dev, sizeof(*ddata), GFP_KERNEL);
4b63b1500e4b18 Chris Morgan 2025-08-12  52  	if (!ddata)
4b63b1500e4b18 Chris Morgan 2025-08-12  53  		return -ENOMEM;
4b63b1500e4b18 Chris Morgan 2025-08-12  54  
4b63b1500e4b18 Chris Morgan 2025-08-12  55  	ddata->client = client;
4b63b1500e4b18 Chris Morgan 2025-08-12  56  	ddata->regmap = devm_regmap_init_i2c(client, &bq25703_regmap_config);
4b63b1500e4b18 Chris Morgan 2025-08-12  57  	if (IS_ERR(ddata->regmap)) {
4b63b1500e4b18 Chris Morgan 2025-08-12  58  		return dev_err_probe(&client->dev, PTR_ERR(ddata->regmap),
4b63b1500e4b18 Chris Morgan 2025-08-12  59  				     "Failed to allocate register map\n");
4b63b1500e4b18 Chris Morgan 2025-08-12  60  	}
4b63b1500e4b18 Chris Morgan 2025-08-12  61  
4b63b1500e4b18 Chris Morgan 2025-08-12  62  	i2c_set_clientdata(client, ddata);
4b63b1500e4b18 Chris Morgan 2025-08-12  63  
4b63b1500e4b18 Chris Morgan 2025-08-12  64  	ret = devm_mfd_add_devices(&client->dev, PLATFORM_DEVID_AUTO,
4b63b1500e4b18 Chris Morgan 2025-08-12  65  				   cells, ARRAY_SIZE(cells), NULL, 0, NULL);
4b63b1500e4b18 Chris Morgan 2025-08-12  66  	if (ret)
4b63b1500e4b18 Chris Morgan 2025-08-12  67  		return dev_err_probe(&client->dev, ret,
4b63b1500e4b18 Chris Morgan 2025-08-12  68  				     "Failed to register child devices\n");
4b63b1500e4b18 Chris Morgan 2025-08-12  69  
4b63b1500e4b18 Chris Morgan 2025-08-12  70  	return ret;
4b63b1500e4b18 Chris Morgan 2025-08-12  71  }
4b63b1500e4b18 Chris Morgan 2025-08-12  72  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
