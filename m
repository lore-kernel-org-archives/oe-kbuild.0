Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877BADDC5
	for <oe-kbuild@lists.linux.dev>; Sun, 19 Oct 2025 23:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760916726; cv=none; b=T/MdaMf6Dxcyup1zm3AvTfOGgzeXtQx2uTYZy402O+oz1Dc0K4EHLg3neskgoQuKnmr9mysiHwtE1jh67pWMA0nR/Prp4nbOP+tiaH60Dq2zI9Y48H4NAqds6scljdTCwe/YPhhgKEHN6AkCdnytNljpu7pIC7PvFCvZ86K+Vg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760916726; c=relaxed/simple;
	bh=rAfaUL/EUZOAuOdkXQJVTgG7rFweqmnJQE23UaanBuc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rggxLRpVTUmfkZ7lxdIoTAEDvpqijaq8OlLOPS8L/KtqX/Pd6jrwz3KsPJ5ii9SAWRmnvsgU8dq9M+1Ao6Lh3W+IC/iN+7sm53DeE3l3IjpZcJRyHme+Zu4eyAqa94WTzDU8igP6D0lo2VPrpJ73obfJDH3ZYB47dtoFYUuJxQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AmBW9Ly3; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AmBW9Ly3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760916725; x=1792452725;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rAfaUL/EUZOAuOdkXQJVTgG7rFweqmnJQE23UaanBuc=;
  b=AmBW9Ly32eQj6lFVuCV6NPxgHzJe1i4O9rNDBKNhRz2DELoFScaSFZAf
   fl1EhgZYcTMPeQj3HGUUFLaDHhKB/cpkFDV9m5sgrr2p+YDoZGdVa/gXi
   EPo+QUTo3OGWY2KuVIXICX1k+kJ1VClfU1k9SW0RW3cMkChWmfCg+5ZBc
   txuxZ5w9CqGbNDk/QFdRDRF9gLk4Dj3KpTmqkuCsao5Z6k+scHOiqaY9T
   1FCeygRDQqf6eXO8YBc47WXc48KNasKSUTfagNU4oi1aJ7YLx+zGAqTPk
   tpjDruX0W4wY6XHG1OK9jwxFHktuciY/LEgqkYQ/Gde16vNvyHPDjapeQ
   A==;
X-CSE-ConnectionGUID: 0g893DqkQjCQgs49N5iC3A==
X-CSE-MsgGUID: anREqYKLRcmnRBNXkT27jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62945899"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="62945899"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2025 16:32:03 -0700
X-CSE-ConnectionGUID: D27keziRT+qZwlaMy1IIgg==
X-CSE-MsgGUID: Q625yB3VReeYFRYPSBwxGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,241,1754982000"; 
   d="scan'208";a="182748178"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 19 Oct 2025 16:32:02 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vAcsZ-0009MP-1r;
	Sun, 19 Oct 2025 23:31:59 +0000
Date: Mon, 20 Oct 2025 07:31:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v4 2/2] dmaengine: dw-axi-dmac: add reset control support
Message-ID: <202510200644.cublciW5-lkp@intel.com>
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
[also build test WARNING on pza/reset/next linus/master v6.18-rc1 next-20251017]
[cannot apply to pza/imx-drm/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Artem-Shimko/dmaengine-dw-axi-dmac-simplify-PM-functions-and-use-modern-macros/20251017-183103
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git next
patch link:    https://lore.kernel.org/r/20251017102950.206443-3-a.shimko.dev%40gmail.com
patch subject: [PATCH v4 2/2] dmaengine: dw-axi-dmac: add reset control support
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: loongarch-randconfig-r072-20251019 (https://download.01.org/0day-ci/archive/20251020/202510200644.cublciW5-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202510200644.cublciW5-lkp@intel.com/

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
