Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A7F2D0C94
	for <oe-kbuild@lists.linux.dev>; Tue,  6 Oct 2026 21:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791323982; cv=none; b=mzDU+HKmO3b92hJddbb7GSJtyJNYR7lNJNfO9RZJNxuQ2uL3hJEJB6qqAByF/25Tl7YFHwA06oYpPdwpHG7asUzbrqjwJazQQpfKCQx+2mcQz4FUFtNgQa3i9+EeI97TM6CwB0Kz93a1rfyx3v+/+wdOAyd0jXdaH8kywcO0ZgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791323982; c=relaxed/simple;
	bh=mwAopCjL1avVBp38PDN4DGpxXgyCTZSNs8XYktoKDlI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=F/dQ8eOVcka8ILzjvzNDdDCPgw7Istr8uDKK3chKBizvvAceEbT8JjYGtlrKuIwt312Wh9kmW7PunKYDgd9wMM2O07ABHahNkwNhdYCRP6cgQn8ngCXqlhbEr7ySj0nFthauM3/SiTjVp/qncPzgNVHR14IMtnu2SsWxyCUCL7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eF4D4OKH; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eF4D4OKH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791323981; x=1822859981;
  h=date:from:to:cc:subject:message-id;
  bh=mwAopCjL1avVBp38PDN4DGpxXgyCTZSNs8XYktoKDlI=;
  b=eF4D4OKH3wLy0oJMjYKdpDlVAx/q22xYdeqclyKUlM9SlS7khYT8kN3c
   DJ5kkN7CzeUsHNrRbdmdPeW1U0KvES8pnHZ4VLG7WfoxY04+XQ5GpE2pt
   dpzS5UFtUtPQxpFvESLb8buPS1vUWiliy2QxMevMj3dpFZLQg/oD1CxUc
   pLUUSJ7ep6GFWVpK5OjekR8hVLyQ0r8HRnfjCm/6xODhMhnah/OWfYE2H
   w2UjofTr3h/WQ9SRmDu9so6vQPxJE6Jb4FmlJPjlZpBwqdG7FoePa8enM
   hQy1/znU9JMnyGjO6am8CHbr1SgaEbx/c1INirPOF7V2sWkQxnHSMJEh9
   Q==;
X-CSE-ConnectionGUID: t+2GkVcUSFqncK3eApu0SQ==
X-CSE-MsgGUID: YEnVhEv7RKamf21/CWrHcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="84597"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="84597"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 14:59:40 -0700
X-CSE-ConnectionGUID: apAORF0hRBW3/uAD0s6AKg==
X-CSE-MsgGUID: FI05aNN/Q7euxJSaWvFGVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="305232179"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 06 Oct 2026 14:59:39 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEDCD-000000001sD-0JkC;
	Tue, 06 Oct 2026 21:59:37 +0000
Date: Tue, 06 Oct 2026 23:59:31 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 14132/14724]
 drivers/dma/dw-edma/dw-edma-core.c:367 dw_edma_device_config() error: we
 previously assumed 'dw_config' could be null (see line 345)
Message-ID: <202610062331.3dnyLwz7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Koichiro Den <den@valinux.co.jp>
CC: Vinod Koul <vkoul@kernel.org>
CC: Frank Li <Frank.Li@nxp.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   eea3fef32a9cf36abcb5975a5a594e4135a6b026
commit: 9d31ad3b331d5d78bd6a247a9d35f35a6a9bbd59 [14132/14724] dmaengine: dw-edma: Configure remote interrupt routing
:::::: branch date: 10 hours ago
:::::: commit date: 32 hours ago
config: openrisc-randconfig-r2200-20261006 (https://download.01.org/0day-ci/archive/20261006/202610062331.3dnyLwz7-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.4.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610062331.3dnyLwz7-lkp@intel.com/

smatch warnings:
drivers/dma/dw-edma/dw-edma-core.c:367 dw_edma_device_config() error: we previously assumed 'dw_config' could be null (see line 345)

vim +/dw_config +367 drivers/dma/dw-edma/dw-edma-core.c

9d31ad3b331d5d Koichiro Den     2026-09-13  335  
e63d79d1ffcd22 Gustavo Pimentel 2019-06-04  336  static int dw_edma_device_config(struct dma_chan *dchan,
e63d79d1ffcd22 Gustavo Pimentel 2019-06-04  337  				 struct dma_slave_config *config)
e63d79d1ffcd22 Gustavo Pimentel 2019-06-04  338  {
9d31ad3b331d5d Koichiro Den     2026-09-13  339  	const struct dw_edma_chan_config *dw_config = config->peripheral_config;
e63d79d1ffcd22 Gustavo Pimentel 2019-06-04  340  	struct dw_edma_chan *chan = dchan2dw_edma_chan(dchan);
9d31ad3b331d5d Koichiro Den     2026-09-13  341  	bool non_ll = false;
9d31ad3b331d5d Koichiro Den     2026-09-13  342  	u32 flags = 0;
9d31ad3b331d5d Koichiro Den     2026-09-13  343  	int ret;
9d31ad3b331d5d Koichiro Den     2026-09-13  344  
9d31ad3b331d5d Koichiro Den     2026-09-13 @345  	if (dw_config) {
9d31ad3b331d5d Koichiro Den     2026-09-13  346  		if (config->peripheral_size != sizeof(*dw_config) ||
9d31ad3b331d5d Koichiro Den     2026-09-13  347  		    dw_config->flags & ~(DW_EDMA_CH_CONFIG_NON_LL |
9d31ad3b331d5d Koichiro Den     2026-09-13  348  					 DW_EDMA_CH_CONFIG_IRQ_MODE))
b7560798466a07 Devendra K Verma 2026-03-18  349  			return -EINVAL;
9d31ad3b331d5d Koichiro Den     2026-09-13  350  		flags = dw_config->flags;
b7560798466a07 Devendra K Verma 2026-03-18  351  	}
b7560798466a07 Devendra K Verma 2026-03-18  352  
b7560798466a07 Devendra K Verma 2026-03-18  353  	/*
b7560798466a07 Devendra K Verma 2026-03-18  354  	 * When there is no valid LLP base address available then the
b7560798466a07 Devendra K Verma 2026-03-18  355  	 * default DMA ops will use the non-LL mode.
b7560798466a07 Devendra K Verma 2026-03-18  356  	 *
9d31ad3b331d5d Koichiro Den     2026-09-13  357  	 * When LL mode is the default, clients can request non-LL mode
9d31ad3b331d5d Koichiro Den     2026-09-13  358  	 * through DW_EDMA_CH_CONFIG_NON_LL.
b7560798466a07 Devendra K Verma 2026-03-18  359  	 */
9d31ad3b331d5d Koichiro Den     2026-09-13  360  	non_ll = chan->dw->chip->mf == EDMA_MF_HDMA_NATIVE &&
9d31ad3b331d5d Koichiro Den     2026-09-13  361  		 chan->dw->chip->cfg_non_ll;
b7560798466a07 Devendra K Verma 2026-03-18  362  
9d31ad3b331d5d Koichiro Den     2026-09-13  363  	if (flags & DW_EDMA_CH_CONFIG_NON_LL) {
9d31ad3b331d5d Koichiro Den     2026-09-13  364  		if (chan->dw->chip->mf != EDMA_MF_HDMA_NATIVE)
9d31ad3b331d5d Koichiro Den     2026-09-13  365  			return -EINVAL;
9d31ad3b331d5d Koichiro Den     2026-09-13  366  
9d31ad3b331d5d Koichiro Den     2026-09-13 @367  		if (chan->dw->chip->cfg_non_ll && !dw_config->non_ll) {
b7560798466a07 Devendra K Verma 2026-03-18  368  			dev_err(dchan->device->dev, "invalid configuration\n");
b7560798466a07 Devendra K Verma 2026-03-18  369  			return -EINVAL;
b7560798466a07 Devendra K Verma 2026-03-18  370  		}
9d31ad3b331d5d Koichiro Den     2026-09-13  371  
9d31ad3b331d5d Koichiro Den     2026-09-13  372  		non_ll = dw_config->non_ll;
b7560798466a07 Devendra K Verma 2026-03-18  373  	}
b7560798466a07 Devendra K Verma 2026-03-18  374  
9d31ad3b331d5d Koichiro Den     2026-09-13  375  	if (flags & DW_EDMA_CH_CONFIG_IRQ_MODE) {
9d31ad3b331d5d Koichiro Den     2026-09-13  376  		ret = dw_edma_device_config_irq_mode(chan, dw_config->irq_mode);
9d31ad3b331d5d Koichiro Den     2026-09-13  377  		if (ret)
9d31ad3b331d5d Koichiro Den     2026-09-13  378  			return ret;
b7560798466a07 Devendra K Verma 2026-03-18  379  	}
e63d79d1ffcd22 Gustavo Pimentel 2019-06-04  380  
9d31ad3b331d5d Koichiro Den     2026-09-13  381  	chan->non_ll = non_ll;
e63d79d1ffcd22 Gustavo Pimentel 2019-06-04  382  	memcpy(&chan->config, config, sizeof(*config));
e63d79d1ffcd22 Gustavo Pimentel 2019-06-04  383  	chan->configured = true;
e63d79d1ffcd22 Gustavo Pimentel 2019-06-04  384  
e63d79d1ffcd22 Gustavo Pimentel 2019-06-04  385  	return 0;
e63d79d1ffcd22 Gustavo Pimentel 2019-06-04  386  }
e63d79d1ffcd22 Gustavo Pimentel 2019-06-04  387  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
