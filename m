Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18316199FA4
	for <oe-kbuild@lists.linux.dev>; Mon, 23 Dec 2024 13:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734959632; cv=none; b=WcrZhlv0NV0JN0I6Pr+BfOKvLlFGl1Mg0xXZ2WO5/ZWz9RsfHa/Ar8OxY05TECDzF61s8uYIubkz931ZmNds6DlBlcbqgQipjR+NHH31ODUIxnFjuIDfT18yGqNYpqkqWcs996n6+QUqZHC+dDgWzgr9UJYQHRsXmssirWkYzZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734959632; c=relaxed/simple;
	bh=SStVc9/zYh8ZXpD5HGLNVE4eb2yP8kxU7kY9Umvr4iY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m9DLYYFnDXwhbMCsRamoM1mX4RHAkrpib4X7tjZo8xQjDV9OvkoOxHqTqJ6UXqTbxyF0BufRBJ9P6phxvAxXAmBQGPJfQvgipnEsVtAge9868M7509FWIybiLN6aUqNIDr3JyeCWNoQXipcUzN4dxgMI7HwGDKU8aGDBMVq5IJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=htAYg+aY; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="htAYg+aY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734959630; x=1766495630;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SStVc9/zYh8ZXpD5HGLNVE4eb2yP8kxU7kY9Umvr4iY=;
  b=htAYg+aYPRDTBkbcWxtdPk/OQz6X+Ncpp31J7vNiegJVoDg3OnLmgyam
   Wp9sI9K+e+3eFEGJtLXdb8s1m5yZZfHGmZhPC7JF9bCz9LVB5EoBxySEf
   XGU/IWtk+WseCqU34mUjjodhjsA4RoGEJ7J438Esr/hVmVrfuCNhpdthF
   w60WKtne3VEkIzjNx6Nja+uKUn5PzXIwvcs7TLKTRgcyioW6E1Dc0twiV
   NN/QWGjhBUvmSahqT8cjl7dTmOR6t+1NvKBZjZDT4qVN6UCMQxhy55qfg
   jDc70rggPyfYFYaxHhu1/7e5VTG2ubb5Chw6Iu35lfSuuXCd0xEuE7fAC
   A==;
X-CSE-ConnectionGUID: IM5BzOwZQqmrnTwdIsTpFg==
X-CSE-MsgGUID: a+GmQosETle6/7yps+v8fQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="35561053"
X-IronPort-AV: E=Sophos;i="6.12,257,1728975600"; 
   d="scan'208";a="35561053"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2024 05:13:49 -0800
X-CSE-ConnectionGUID: MrgQZaCFSUuYfIfp4d7YMQ==
X-CSE-MsgGUID: Oh/HU9ncQMWkvo6K/JltMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,257,1728975600"; 
   d="scan'208";a="104184710"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 23 Dec 2024 05:13:49 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPiFm-0003bv-0G;
	Mon, 23 Dec 2024 13:13:46 +0000
Date: Mon, 23 Dec 2024 21:13:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] [v1] spi: spi-mtk-nor: Modify the clock architecture of
 nor controller
Message-ID: <202412232136.cWvRuwoD-lkp@intel.com>
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
In-Reply-To: <20241212092206.14071-1-Cloud.Zhang@mediatek.com>
References: <20241212092206.14071-1-Cloud.Zhang@mediatek.com>
TO: mtk22730 <Cloud.Zhang@mediatek.com>
TO: Mark Brown <broonie@kernel.org>
TO: Matthias Brugger <matthias.bgg@gmail.com>
TO: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: linux-spi@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-mediatek@lists.infradead.org
CC: Project_Global_Chrome_Upstream_Group@mediatek.com
CC: Cloud Zhang <cloud.zhang@mediatek.com>

Hi mtk22730,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-spi/for-next]
[also build test WARNING on linus/master v6.13-rc4 next-20241220]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/mtk22730/spi-spi-mtk-nor-Modify-the-clock-architecture-of-nor-controller/20241212-172704
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next
patch link:    https://lore.kernel.org/r/20241212092206.14071-1-Cloud.Zhang%40mediatek.com
patch subject: [PATCH] [v1] spi: spi-mtk-nor: Modify the clock architecture of nor controller
:::::: branch date: 11 days ago
:::::: commit date: 11 days ago
config: parisc-randconfig-r073-20241223 (https://download.01.org/0day-ci/archive/20241223/202412232136.cWvRuwoD-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412232136.cWvRuwoD-lkp@intel.com/

smatch warnings:
drivers/spi/spi-mtk-nor.c:746 mtk_nor_parse_clk() warn: impossible condition '(cnt == -22) => (1-255 == (-22))'

vim +746 drivers/spi/spi-mtk-nor.c

87d65a23444841 Cloud Zhang   2024-12-12  737  
87d65a23444841 Cloud Zhang   2024-12-12  738  static int mtk_nor_parse_clk(struct device *dev, struct mtk_nor *sp)
87d65a23444841 Cloud Zhang   2024-12-12  739  {
87d65a23444841 Cloud Zhang   2024-12-12  740  	struct device_node *np = dev->of_node;
87d65a23444841 Cloud Zhang   2024-12-12  741  	int ret;
87d65a23444841 Cloud Zhang   2024-12-12  742  	const char *name;
87d65a23444841 Cloud Zhang   2024-12-12  743  	u8 cnt, i;
87d65a23444841 Cloud Zhang   2024-12-12  744  
87d65a23444841 Cloud Zhang   2024-12-12  745  	cnt = of_property_count_strings(np, "clock-names");
87d65a23444841 Cloud Zhang   2024-12-12 @746  	if (!cnt || (cnt == -EINVAL)) {
87d65a23444841 Cloud Zhang   2024-12-12  747  		dev_err(dev, "Unable to find clocks\n");
87d65a23444841 Cloud Zhang   2024-12-12  748  		ret = -EINVAL;
87d65a23444841 Cloud Zhang   2024-12-12  749  		goto out;
87d65a23444841 Cloud Zhang   2024-12-12  750  	} else if (cnt < 0) {
87d65a23444841 Cloud Zhang   2024-12-12  751  		dev_err(dev, "Count clock strings failed, err %d\n", cnt);
87d65a23444841 Cloud Zhang   2024-12-12  752  		ret = cnt;
87d65a23444841 Cloud Zhang   2024-12-12  753  		goto out;
87d65a23444841 Cloud Zhang   2024-12-12  754  	} else if (cnt > MAX_CLOCK_CNT) {
87d65a23444841 Cloud Zhang   2024-12-12  755  		ret = -EINVAL;
87d65a23444841 Cloud Zhang   2024-12-12  756  		goto out;
87d65a23444841 Cloud Zhang   2024-12-12  757  	}
87d65a23444841 Cloud Zhang   2024-12-12  758  
87d65a23444841 Cloud Zhang   2024-12-12  759  	sp->clock_cnt = cnt;
87d65a23444841 Cloud Zhang   2024-12-12  760  
87d65a23444841 Cloud Zhang   2024-12-12  761  	for (i = 0; i < cnt; i++) {
87d65a23444841 Cloud Zhang   2024-12-12  762  		ret = of_property_read_string_index(np, "clock-names", i,
87d65a23444841 Cloud Zhang   2024-12-12  763  				       &name);
58b0a653b8dac4 Guochun Mao   2022-01-18  764  		if (ret) {
87d65a23444841 Cloud Zhang   2024-12-12  765  			dev_err(dev, "failed to get clock string\n");
58b0a653b8dac4 Guochun Mao   2022-01-18  766  			return ret;
58b0a653b8dac4 Guochun Mao   2022-01-18  767  		}
58b0a653b8dac4 Guochun Mao   2022-01-18  768  
87d65a23444841 Cloud Zhang   2024-12-12  769  		sp->clocks[i].name = name;
87d65a23444841 Cloud Zhang   2024-12-12  770  		sp->clocks[i].clki = devm_clk_get(dev, sp->clocks[i].name);
87d65a23444841 Cloud Zhang   2024-12-12  771  		if (IS_ERR(sp->clocks[i].clki)) {
87d65a23444841 Cloud Zhang   2024-12-12  772  			dev_err(dev, "get clock %s fail\n", sp->clocks[i].name);
87d65a23444841 Cloud Zhang   2024-12-12  773  			return PTR_ERR(sp->clocks[i].clki);
87d65a23444841 Cloud Zhang   2024-12-12  774  		}
87d65a23444841 Cloud Zhang   2024-12-12  775  	}
87d65a23444841 Cloud Zhang   2024-12-12  776  
87d65a23444841 Cloud Zhang   2024-12-12  777  out:
87d65a23444841 Cloud Zhang   2024-12-12  778  	return ret;
881d1ee9fe81ff Chuanhong Guo 2020-03-06  779  }
881d1ee9fe81ff Chuanhong Guo 2020-03-06  780  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
