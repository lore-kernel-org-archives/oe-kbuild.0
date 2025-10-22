Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EBBF2F99AA
	for <oe-kbuild@lists.linux.dev>; Wed, 22 Oct 2025 09:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761124787; cv=none; b=KmZ+ip3n8tMmMxqS+GeGeMIviklrlmI05uhT2DIYkyFHDFSdNtQO3dNJeWEE0SaEMMsVkSSgcnoNG0ums/LYuFwxuzeOeSoXaeq/F33iuxdXiZx/EedB9LPKmMphIZQ008mXuLDN9RnSS8xzcUgPcCgnyBKUECqbWlRjlZ8v+6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761124787; c=relaxed/simple;
	bh=9b66tYU8wTlqJf2R7fMUCWYo9ZNSvBDdx74HadFw810=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GaPULcu6pQU12rVH8Zy5uzTGJb15O0nx4W5VoMIecaqXqy0qk74iV9VI7QWFrIxM0drTcOcuLHgOokSsE+4/zwXWhZjyMiyMepkQs38CF0ZMnBMzbPZwDOWWVXRQ3S+fXTuyGiE9Gk90vmCOuszsuP5oqPxFa8YqEiBrpcu0Paw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gzHnoNPb; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gzHnoNPb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761124786; x=1792660786;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9b66tYU8wTlqJf2R7fMUCWYo9ZNSvBDdx74HadFw810=;
  b=gzHnoNPbKdROMkDoGbGzPp3C92vG9DMGmh6D5lOUEai79ZXP6RFgHDN1
   gT6y7jbcnsQEuys9x2mJfoUN6yAHuUGpO9Pdb7+p94bxr6kNs1V+qxwlA
   mmO+sTZQ6tp3DlRRLytzPi2NBBYhM1tPuy+/vl80Txusv7YjF+GMXJCih
   eILtFtGi/YDOZx5ij+GFfPeVnZO2bq/TBU0Q9l/q8yxBKYzBmYcsS9+FL
   qNDM+QhdyR0rwt7Ze1UdMUVTFf9nLo2fZdw+n9ERN2uOkcLjWdnzxjHyx
   RnRfhQmaeUtJrPNP8B9TwYVn823IqeT1Kss9LUXjlz/Tn5siXxBo1BtIg
   w==;
X-CSE-ConnectionGUID: SWWcQJ9JSumykdj7ZosfZg==
X-CSE-MsgGUID: /SooSukhTGylCxgkFM80mQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63306886"
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="63306886"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 02:19:45 -0700
X-CSE-ConnectionGUID: RliZWbwtTPSJOA/OYLbeRw==
X-CSE-MsgGUID: nlDUuxK9QOSK5Jh4MooZag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="188231184"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 22 Oct 2025 02:19:44 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBV0P-000CBh-28;
	Wed, 22 Oct 2025 09:19:41 +0000
Date: Wed, 22 Oct 2025 17:18:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v4 2/2] dmaengine: dw-axi-dmac: add reset control support
Message-ID: <202510221508.PY6fB9CB-lkp@intel.com>
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
In-Reply-To: <20251017102950.206443-3-a.shimko.dev@gmail.com>
References: <20251017102950.206443-3-a.shimko.dev@gmail.com>
TO: Artem Shimko <a.shimko.dev@gmail.com>
TO: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
TO: Vinod Koul <vkoul@kernel.org>
TO: Philipp Zabel <p.zabel@pengutronix.de>
CC: Artem Shimko <a.shimko.dev@gmail.com>
CC: dmaengine@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi Artem,

kernel test robot noticed the following build warnings:

[auto build test WARNING on vkoul-dmaengine/next]
[also build test WARNING on pza/reset/next linus/master v6.18-rc2 next-20251021]
[cannot apply to pza/imx-drm/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Artem-Shimko/dmaengine-dw-axi-dmac-simplify-PM-functions-and-use-modern-macros/20251017-183103
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git next
patch link:    https://lore.kernel.org/r/20251017102950.206443-3-a.shimko.dev%40gmail.com
patch subject: [PATCH v4 2/2] dmaengine: dw-axi-dmac: add reset control support
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: loongarch-randconfig-r072-20251019 (https://download.01.org/0day-ci/archive/20251022/202510221508.PY6fB9CB-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202510221508.PY6fB9CB-lkp@intel.com/

New smatch warnings:
drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c:1355 axi_dma_resume() warn: 'chip->core_clk' from clk_prepare_enable() not released on lines: 1350.

Old smatch warnings:
drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c:1237 dma_chan_pause() warn: inconsistent indenting
drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c:1284 axi_chan_resume() warn: inconsistent indenting
drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c:1355 axi_dma_resume() warn: 'chip->cfgr_clk' from clk_prepare_enable() not released on lines: 1346,1350.

vim +1355 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c

1fe20f1b84548bb Eugeniy Paltsev 2018-03-06  1334  
45fdf99125b2bf7 Artem Shimko    2025-10-17  1335  static int axi_dma_resume(struct device *dev)
1fe20f1b84548bb Eugeniy Paltsev 2018-03-06  1336  {
1fe20f1b84548bb Eugeniy Paltsev 2018-03-06  1337  	int ret;
45fdf99125b2bf7 Artem Shimko    2025-10-17  1338  	struct axi_dma_chip *chip = dev_get_drvdata(dev);
1fe20f1b84548bb Eugeniy Paltsev 2018-03-06  1339  
1fe20f1b84548bb Eugeniy Paltsev 2018-03-06  1340  	ret = clk_prepare_enable(chip->cfgr_clk);
1fe20f1b84548bb Eugeniy Paltsev 2018-03-06  1341  	if (ret < 0)
1fe20f1b84548bb Eugeniy Paltsev 2018-03-06  1342  		return ret;
1fe20f1b84548bb Eugeniy Paltsev 2018-03-06  1343  
1fe20f1b84548bb Eugeniy Paltsev 2018-03-06  1344  	ret = clk_prepare_enable(chip->core_clk);
1fe20f1b84548bb Eugeniy Paltsev 2018-03-06  1345  	if (ret < 0)
1fe20f1b84548bb Eugeniy Paltsev 2018-03-06  1346  		return ret;
1fe20f1b84548bb Eugeniy Paltsev 2018-03-06  1347  
9c360f02c387f93 Artem Shimko    2025-10-17  1348  	ret = reset_control_deassert(chip->resets);
9c360f02c387f93 Artem Shimko    2025-10-17  1349  	if (ret)
9c360f02c387f93 Artem Shimko    2025-10-17  1350  		return ret;
9c360f02c387f93 Artem Shimko    2025-10-17  1351  
1fe20f1b84548bb Eugeniy Paltsev 2018-03-06  1352  	axi_dma_enable(chip);
1fe20f1b84548bb Eugeniy Paltsev 2018-03-06  1353  	axi_dma_irq_enable(chip);
1fe20f1b84548bb Eugeniy Paltsev 2018-03-06  1354  
1fe20f1b84548bb Eugeniy Paltsev 2018-03-06 @1355  	return 0;
1fe20f1b84548bb Eugeniy Paltsev 2018-03-06  1356  }
1fe20f1b84548bb Eugeniy Paltsev 2018-03-06  1357  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
