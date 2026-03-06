Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E2D1DFF0
	for <oe-kbuild@lists.linux.dev>; Fri,  6 Mar 2026 16:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772813652; cv=none; b=ndfTbBATK/RIXSzftisbH194WH4FGWc+Gr/qVULlBDrITndTYtdS+IkytCH3mLdCw+Nj8ryPPVipVTyCosW7hTtLH/rm8T0ifFZcj0rMmYUdKtzttucd43tVKeTIOKoFK+sfckGoYVjdgnc3PNDudFIBnw3M0sAMmHDO2CKePCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772813652; c=relaxed/simple;
	bh=hhBIX6yoG5fM9eJU3e+F0/0qbGuB36OF8+m+pI0TUL8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XEZwlriUlURVHGVeFq2Q4ZJ8hvmOkuuCF/RQGJNBcoOwdCsl1Vpv1wywWnSPNN/6eFvsBQjfyH5Pi3RKeu0kppBdD2tfDJU3JL7/Z3ckxAKkmeCcMJbUVYuAC7VDqgK6k+RTXIsdLmJBmm1JebToba2iAmoSllHb/NL9mO0mCx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aiAfdC64; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aiAfdC64"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772813651; x=1804349651;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hhBIX6yoG5fM9eJU3e+F0/0qbGuB36OF8+m+pI0TUL8=;
  b=aiAfdC64UH/Kp3/qq5K8ZpA53O2IOKTtCIKp+nJbcYwR0wX5yCq0zO06
   VkT2BezZaAgH7heGlP+Pmsjyn2R4kTx5bUAkdMOEqWTG7V5jRe4uMTErE
   dr47UHuIMjJJWfX+tbyiSsdlxaii3/pAM9ilerqkaql/U+gA0NcVyHRxy
   mZmEWhIZn7LO900kkfZBRz4VeC1lAQYUQZTaMhjWXXHiaXrjFsuplwUof
   1cMikA35sU3ORNl0OhuXNnkhUO7J/JvfCW/aNNXtM8Pno0tkgWCPTanIK
   AVzTcpM9ee9YEuuaCa3TGsOlIuYwLaSIi+8qwtxGPJ8Uu4/gTXMYAywaa
   g==;
X-CSE-ConnectionGUID: jli7EVSKRi+5qBwefHi/Gw==
X-CSE-MsgGUID: WlN6HkGeQyijE9AoRSKffg==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="73828599"
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="73828599"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 08:14:10 -0800
X-CSE-ConnectionGUID: 0ucLB7lES1Gg899hJLzRrw==
X-CSE-MsgGUID: iZ8zaBxhStGeQT9OjTQJ7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="216165580"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 06 Mar 2026 08:14:08 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyXoT-0000000012P-3pW0;
	Fri, 06 Mar 2026 16:14:05 +0000
Date: Sat, 7 Mar 2026 00:13:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 09/11] mfd: bq257xx: Add BQ25792 support
Message-ID: <202603070045.59SILa9p-lkp@intel.com>
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
In-Reply-To: <20260303-bq25792-v1-9-e6e5e0033458@flipper.net>
References: <20260303-bq25792-v1-9-e6e5e0033458@flipper.net>
TO: Alexey Charkov <alchark@flipper.net>
TO: Lee Jones <lee@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Chris Morgan <macromorgan@hotmail.com>
TO: Liam Girdwood <lgirdwood@gmail.com>
TO: Mark Brown <broonie@kernel.org>
TO: Sebastian Reichel <sre@kernel.org>
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-pm@vger.kernel.org
CC: Alexey Charkov <alchark@flipper.net>

Hi Alexey,

kernel test robot noticed the following build warnings:

[auto build test WARNING on d517cb8cea012f43b069617fc8179b45404f8018]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexey-Charkov/dt-bindings-mfd-ti-bq25703a-Expand-to-include-BQ25792/20260303-234353
base:   d517cb8cea012f43b069617fc8179b45404f8018
patch link:    https://lore.kernel.org/r/20260303-bq25792-v1-9-e6e5e0033458%40flipper.net
patch subject: [PATCH 09/11] mfd: bq257xx: Add BQ25792 support
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: alpha-randconfig-r071-20260306 (https://download.01.org/0day-ci/archive/20260307/202603070045.59SILa9p-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603070045.59SILa9p-lkp@intel.com/

New smatch warnings:
drivers/mfd/bq257xx.c:94 bq257xx_probe() warn: sizeof(NUMBER)?

Old smatch warnings:
drivers/mfd/bq257xx.c:95 bq257xx_probe() warn: sizeof(NUMBER)?

vim +94 drivers/mfd/bq257xx.c

3b1bbfb5fce3ca9 Chris Morgan   2025-09-04   89  
3b1bbfb5fce3ca9 Chris Morgan   2025-09-04   90  static int bq257xx_probe(struct i2c_client *client)
3b1bbfb5fce3ca9 Chris Morgan   2025-09-04   91  {
c51ca581550d4a4 Alexey Charkov 2026-03-03   92  	const struct bq257xx_match_data *md = device_get_match_data(&client->dev);
c51ca581550d4a4 Alexey Charkov 2026-03-03   93  	const struct mfd_cell cells[] = {
c51ca581550d4a4 Alexey Charkov 2026-03-03  @94  		MFD_CELL_BASIC("bq257xx-regulator", NULL, &md->plat, sizeof(md->plat), 0),
c51ca581550d4a4 Alexey Charkov 2026-03-03   95  		MFD_CELL_BASIC("bq257xx-charger", NULL, &md->plat, sizeof(md->plat), 0),
c51ca581550d4a4 Alexey Charkov 2026-03-03   96  	};
3b1bbfb5fce3ca9 Chris Morgan   2025-09-04   97  	struct bq257xx_device *ddata;
3b1bbfb5fce3ca9 Chris Morgan   2025-09-04   98  	int ret;
3b1bbfb5fce3ca9 Chris Morgan   2025-09-04   99  
3b1bbfb5fce3ca9 Chris Morgan   2025-09-04  100  	ddata = devm_kzalloc(&client->dev, sizeof(*ddata), GFP_KERNEL);
3b1bbfb5fce3ca9 Chris Morgan   2025-09-04  101  	if (!ddata)
3b1bbfb5fce3ca9 Chris Morgan   2025-09-04  102  		return -ENOMEM;
3b1bbfb5fce3ca9 Chris Morgan   2025-09-04  103  
3b1bbfb5fce3ca9 Chris Morgan   2025-09-04  104  	ddata->client = client;
3b1bbfb5fce3ca9 Chris Morgan   2025-09-04  105  
c51ca581550d4a4 Alexey Charkov 2026-03-03  106  	ddata->regmap = devm_regmap_init_i2c(client, md->regmap_config);
3b1bbfb5fce3ca9 Chris Morgan   2025-09-04  107  	if (IS_ERR(ddata->regmap)) {
3b1bbfb5fce3ca9 Chris Morgan   2025-09-04  108  		return dev_err_probe(&client->dev, PTR_ERR(ddata->regmap),
3b1bbfb5fce3ca9 Chris Morgan   2025-09-04  109  				     "Failed to allocate register map\n");
3b1bbfb5fce3ca9 Chris Morgan   2025-09-04  110  	}
3b1bbfb5fce3ca9 Chris Morgan   2025-09-04  111  
3b1bbfb5fce3ca9 Chris Morgan   2025-09-04  112  	i2c_set_clientdata(client, ddata);
3b1bbfb5fce3ca9 Chris Morgan   2025-09-04  113  
3b1bbfb5fce3ca9 Chris Morgan   2025-09-04  114  	ret = devm_mfd_add_devices(&client->dev, PLATFORM_DEVID_AUTO,
3b1bbfb5fce3ca9 Chris Morgan   2025-09-04  115  				   cells, ARRAY_SIZE(cells), NULL, 0, NULL);
3b1bbfb5fce3ca9 Chris Morgan   2025-09-04  116  	if (ret)
3b1bbfb5fce3ca9 Chris Morgan   2025-09-04  117  		return dev_err_probe(&client->dev, ret,
3b1bbfb5fce3ca9 Chris Morgan   2025-09-04  118  				     "Failed to register child devices\n");
3b1bbfb5fce3ca9 Chris Morgan   2025-09-04  119  
3b1bbfb5fce3ca9 Chris Morgan   2025-09-04  120  	return ret;
3b1bbfb5fce3ca9 Chris Morgan   2025-09-04  121  }
3b1bbfb5fce3ca9 Chris Morgan   2025-09-04  122  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
