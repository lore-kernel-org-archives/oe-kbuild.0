Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793423603;
	b=KBnuuTEavVW/I/YvmChnhv57dOh4tVPYcb4UBCGYBZM53y4l8t+zmxhDAns2j2HwsCqT
	 YI8Zv1rKvgkcu2phNw/7nMLyIyiVCCFLjzZlEZOtXxqQXKSf58E0OhLyyTuW88kx4lEzu
	 m47INKoz6S9m7dz5b0OjAtGKF7i7hbeXmB/ZUi+23TwpsCT4WHVkhFJzY771oLWwNofhJ
	 1qMH1C/nKI/24yG14Lk6IrD79xVyqDNg7lAP8gVLed90DauOjZGpzz8A+cpT9+RX2qlpU
	 FbWh9bYJdVTIXd97sAz9sChKS9RwjXhjeCPSGZJrPaQ2/2LwGsWpYEykK+QTdA2E9SQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793423603;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=u5L2zxp+GX5GQHMG8PHh7ZAUj1X9e20C7PR8XM88Ikg=;
	b=TSkTUNaKixKNf0Td8KK67DUpU9LpqtfJOllP3KBJtqC+xvhd5TwQyR8e6kNg/qzinut7
	 vPo9Cc1EBdX+LN0/a9C2URsrf2Jxnjmlnk075mUG5e4silWCHRG7TFfFeyWXbgOd1B2Je
	 g/WW6Db7UCX04T5jxPuuaiV00FKushrYsCVsf+tCqlEHgkLxFdq48JBqdwuPVt8Ro8VwK
	 9Tcv1yCbitG9it19x2ORlmJhwFHTlxa5GeePWgG8bHvYxje7hUa/t9YHUoQaZNnKW+/xQ
	 vbtkLWFZuP267IjeoCxmrzIqA62HUcevESwWGL/1pQ+JSDj+DFWxLxR5Wr6NWivR8Ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZkW03YbT;
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82834606A31A
	for <oe-kbuild@lists.linux.dev>; Sat, 31 Oct 2026 05:13:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82834606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZkW03YbT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793423601; x=1824959601;
  h=date:from:to:cc:subject:message-id;
  bh=BePw27LoBisp2ityutXOo1k8M1iTdwoSg4qXPUg/50g=;
  b=ZkW03YbTq26F2RPcv41gfKz1Nza41FWzP3/ixditCsBv+Xi7eeHoXI1J
   f1Qwx3MF4KV0C06speRdBSALFr/LLnpR4sdjm9FWeVqLa4oK9f45KBg1M
   mOc+wVf1qPK2SmqosGLAX0wxOuzp2qSc9iOnW/2vrH8rsX0iqM/aGNDk8
   jjJVHlN+zpU0ysp7Bo3XwVTzPWze/Lap7R+0dbuc2ry6L/9d1GFGDWtGb
   1IS+SV8y6KwIC25hAspbbJQW7kDvjXyaSzHNYiarqHn3T4jAFodhEjXKb
   KNaLUYBC+hwlZaGVojV2mRxKeBqZXYo9azSottNA0xgYLVUg7iKcx9T4h
   g==;
X-CSE-ConnectionGUID: scOOMrc2QeSTqfwgTX05Pg==
X-CSE-MsgGUID: zdSkLZD6RsisOOnmUfmZ1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2090061"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2090061"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 22:13:21 -0700
X-CSE-ConnectionGUID: LV1AEjNHTyOfNQQJXUkH3Q==
X-CSE-MsgGUID: n1ZbtEM0TnOHegpKzW4QYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="7399310"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa012.fm.intel.com with ESMTP; 30 Oct 2026 22:13:20 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xN1P3-000000005s7-3O4R;
	Sat, 31 Oct 2026 05:13:17 +0000
Date: Sat, 31 Oct 2026 06:13:16 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/clk/davinci/da8xx-cfgchip.c:766:18-25: ERROR:
 PTR_ERR applied after initialization to constant on line 747
Message-ID: <202610310610.evnX1sB3-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Rosen Penev <rosenp@gmail.com>
CC: Brian Masney <bmasney@redhat.com>

Hi Rosen,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2a500a04d6f969318c05f46aedb6e73fc1963a00
commit: 551ba775497e93d93bb849f6ee572ca768cbaa3e clk: davinci: add COMPILE_TEST support
date:   8 weeks ago
:::::: branch date: 5 hours ago
:::::: commit date: 8 weeks ago
config: um-randconfig-r2103-20261031 (https://download.01.org/0day-ci/archive/20261031/202610310610.evnX1sB3-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 551ba775497e ("clk: davinci: add COMPILE_TEST support")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202610310610.evnX1sB3-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/clk/davinci/da8xx-cfgchip.c:766:18-25: ERROR: PTR_ERR applied after initialization to constant on line 747

vim +766 drivers/clk/davinci/da8xx-cfgchip.c

1e88a8d64f2212 David Lechner 2018-03-15  741  
1e88a8d64f2212 David Lechner 2018-03-15  742  static int da8xx_cfgchip_probe(struct platform_device *pdev)
1e88a8d64f2212 David Lechner 2018-03-15  743  {
1e88a8d64f2212 David Lechner 2018-03-15  744  	struct device *dev = &pdev->dev;
1e88a8d64f2212 David Lechner 2018-03-15  745  	struct da8xx_cfgchip_clk_platform_data *pdata = dev->platform_data;
1e88a8d64f2212 David Lechner 2018-03-15  746  	da8xx_cfgchip_init clk_init = NULL;
1e88a8d64f2212 David Lechner 2018-03-15 @747  	struct regmap *regmap = NULL;
1e88a8d64f2212 David Lechner 2018-03-15  748  
409c39ec92a35e Rob Herring   2023-10-06  749  	clk_init = device_get_match_data(dev);
409c39ec92a35e Rob Herring   2023-10-06  750  	if (clk_init) {
f9848cfa4bec95 David Hunter  2024-07-20  751  		struct device_node *parent __free(device_node) = of_get_parent(dev->of_node);
1e88a8d64f2212 David Lechner 2018-03-15  752  
1e88a8d64f2212 David Lechner 2018-03-15  753  		regmap = syscon_node_to_regmap(parent);
1e88a8d64f2212 David Lechner 2018-03-15  754  	} else if (pdev->id_entry && pdata) {
1e88a8d64f2212 David Lechner 2018-03-15  755  		clk_init = (void *)pdev->id_entry->driver_data;
1e88a8d64f2212 David Lechner 2018-03-15  756  		regmap = pdata->cfgchip;
1e88a8d64f2212 David Lechner 2018-03-15  757  	}
1e88a8d64f2212 David Lechner 2018-03-15  758  
1e88a8d64f2212 David Lechner 2018-03-15  759  	if (!clk_init) {
1e88a8d64f2212 David Lechner 2018-03-15  760  		dev_err(dev, "unable to find driver data\n");
1e88a8d64f2212 David Lechner 2018-03-15  761  		return -EINVAL;
1e88a8d64f2212 David Lechner 2018-03-15  762  	}
1e88a8d64f2212 David Lechner 2018-03-15  763  
1e88a8d64f2212 David Lechner 2018-03-15  764  	if (IS_ERR_OR_NULL(regmap)) {
1e88a8d64f2212 David Lechner 2018-03-15  765  		dev_err(dev, "no regmap for CFGCHIP syscon\n");
1e88a8d64f2212 David Lechner 2018-03-15 @766  		return regmap ? PTR_ERR(regmap) : -ENOENT;
1e88a8d64f2212 David Lechner 2018-03-15  767  	}
1e88a8d64f2212 David Lechner 2018-03-15  768  
1e88a8d64f2212 David Lechner 2018-03-15  769  	return clk_init(dev, regmap);
1e88a8d64f2212 David Lechner 2018-03-15  770  }
1e88a8d64f2212 David Lechner 2018-03-15  771  

:::::: The code at line 766 was first introduced by commit
:::::: 1e88a8d64f221208801bb279ee7452df0b6d609f clk: davinci: New driver for TI DA8XX CFGCHIP clocks

:::::: TO: David Lechner <david@lechnology.com>
:::::: CC: Stephen Boyd <sboyd@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
