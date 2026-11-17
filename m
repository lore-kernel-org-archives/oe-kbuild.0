Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794943587;
	b=oXt0Rf7T1Bp/4Di7XfxtR3BnxfEE6kkW4gaElXfZtOBK3UQH4Gd+gMkU0M6ITBs0yRqD
	 K0971uZffbUWYRqSfO/t/LmRSiYFVAiAyTC96S4OmN0MM9FR9JKJzXTOeTMo/oc3HOCZ5
	 3HhM3qyPpiW+J05xyx6H+iaxX/cYunvTpEuWjLuPqDdFyMTkJoSNqPTd9xOD7Pi0dRLek
	 wdvacgXSAFfDzhwIyEmaBEhMbCdB+/BjV51EK9IlOzLk0BSA8SKZDbGBrmE3UyMf8H9dt
	 CzhhH7L1FlXscV41dOjONfXdoUB+KudIl7jaL9glQ/1FY/ZFjr1kFJOh3pTj7imnlyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794943587;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=OLzo8E1e47ZFLEVZ3IjmaMEVw3VjXg9KmzXnWc1pFRk=;
	b=S6i8/XDG3WHqBZYoMhue5mWNNRBAhgsF6siH1L/WEyZbN3TMXpTCL83+lwQvVmI9ms4u
	 Wv0nKlVzKYXradYR3hHA9cr4iOKnA6DU4ebxzlsIChujXOzv8i/yDLEg+Ymb3hOi/Vesk
	 dZv9so5qgOg0LwNdoLaXGAKrgjI3Nop+zUVennnJ25RCphnyj4/KhsOOo5sytmpExoVvw
	 311lU0KxrggtmU5GkjjXWWz/nklWODB0Yaw6jEhUJQbM6x2wkEN4XVYK2vreuNlXOIo+7
	 IbEytisSv8sfoFnRp4E12aL/Obc3+q1sfprsGj4IjyjvVGNMIyecQfLtmfijxL81FEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SQ4mwnmZ;
	arc=none smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F027606A32F
	for <oe-kbuild@lists.linux.dev>; Tue, 17 Nov 2026 19:26:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F027606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SQ4mwnmZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794943587; x=1826479587;
  h=date:from:to:cc:subject:message-id;
  bh=it15u0golUdZEzMxWATpR1BKpRm4EK6LTsQuFJ+8JIY=;
  b=SQ4mwnmZIva6UhC3afnL47yrMVhohf1UkMmRXKkVBX6YBZ4YFwRhD2ul
   4faBNhSFb7FPZ7Lv8E+RYY0IHipOPa+/VBLFo/JH2LTaIAogWNz063BTw
   oUmnA4DbiU3+xUQCH4QPItIpHBtHRp4L5P7pXmxsCtoCGzoP7s41Ym07v
   wteDAnsFxpMIlKnY5LBGnt7AnMVPI2lNSFva3LJYWpGdoQVqOZWJyNV+d
   HCySQfLsb0eCUDlHe0vM7pVJuwbmREHZfTC5yTHbzRU3ONA1qKGcyx4Mk
   As1anUKzWzq0ZMu5VJa43JyrUtXPwHQDvg3dXQM1iPpK7xk8lxp/DvlHv
   Q==;
X-CSE-ConnectionGUID: wYo7tlDaTrOFGZHqRdw2cQ==
X-CSE-MsgGUID: iH3fU+5YTaaO8CQraLDzmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3741720"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3741720"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 11:26:27 -0800
X-CSE-ConnectionGUID: ykgdo4oaQbmvgIQKBt61LQ==
X-CSE-MsgGUID: cL8RaPOqQ3mFtC61vChwyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="11737773"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 17 Nov 2026 11:26:26 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTOox-000000003Bh-3LzN;
	Tue, 17 Nov 2026 19:26:23 +0000
Date: Tue, 17 Nov 2026 20:25:56 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/clk/davinci/da8xx-cfgchip.c:766:18-25: ERROR:
 PTR_ERR applied after initialization to constant on line 747
Message-ID: <20261117201958.Mh5y2e1X-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   666539eecdf4db623f5e3c3e55cf9f2dfad24aa4
commit: 551ba775497e93d93bb849f6ee572ca768cbaa3e clk: davinci: add COMPILE_TEST support
date:   3 months ago
:::::: branch date: 26 hours ago
:::::: commit date: 3 months ago
config: arm64-randconfig-r2109-20261116 (https://download.01.org/0day-ci/archive/20261117/20261117201958.Mh5y2e1X-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 5637411ce5dc86d0b7f87cde0f7ee47406d29db6)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 551ba775497e ("clk: davinci: add COMPILE_TEST support")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/20261117201958.Mh5y2e1X-lkp@intel.com/

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
