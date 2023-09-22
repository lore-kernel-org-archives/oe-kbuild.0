Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A0822F00
	for <oe-kbuild@lists.linux.dev>; Fri, 22 Sep 2023 20:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695415291; x=1726951291;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=qdTelI4kIvEplQQE8lz+1rDsinKhmfK6FQLE22Zw6fs=;
  b=Tlis2UO+UMUGpyH1tngjRlIQp8z4qAu2EMtd51F0T8dOpQuyZgBqUtuC
   ZDlzdrgCJw9fwLkKLB0rEVKwVM8/HhJr/DPLUtMh8ZDrj9ZJ/dc+ztlY3
   AYlCud9OV4saoo3GdKkqiH2af4CtAAhduuAdNZD9jLjiyO4BBF0z5Xtpf
   xHpIUPM7aJiL7UuHW3WO/Es2HRQnOumT4CqNgcafsoKt37clNR+0mYvkI
   eOS36pTwxv4VmxtCxrPlpituxBrcg4e/ydx5OI6ob83ehCRCynoZhs5x8
   8ZKNm4keOWDrdYpWi8JfDhImgbgQveamyDPmBkPMTg1GKPkV4vkA7LkqJ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="361184162"
X-IronPort-AV: E=Sophos;i="6.03,169,1694761200"; 
   d="scan'208";a="361184162"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2023 13:41:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="837897086"
X-IronPort-AV: E=Sophos;i="6.03,169,1694761200"; 
   d="scan'208";a="837897086"
Received: from lkp-server02.sh.intel.com (HELO 493f6c7fed5d) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 22 Sep 2023 13:41:29 -0700
Received: from kbuild by 493f6c7fed5d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qjmxq-0001Hl-2u;
	Fri, 22 Sep 2023 20:41:26 +0000
Date: Sat, 23 Sep 2023 04:41:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/host1x/dev.c:417 host1x_iommu_attach() warn: passing
 zero to 'ERR_PTR'
Message-ID: <202309230418.gPqTmsee-lkp@intel.com>
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
TO: "Christian König" <christian.koenig@amd.com>
CC: Thierry Reding <treding@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   dc912ba91b7e2fa74650a0fc22cccf0e0d50f371
commit: f75d19827b731c6f24930ef77e5a46cf2242bc68 drm/tegra: Allow compile test on !ARM v2
date:   6 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 6 months ago
config: csky-randconfig-r071-20230917 (https://download.01.org/0day-ci/archive/20230923/202309230418.gPqTmsee-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230923/202309230418.gPqTmsee-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309230418.gPqTmsee-lkp@intel.com/

New smatch warnings:
drivers/gpu/host1x/dev.c:417 host1x_iommu_attach() warn: passing zero to 'ERR_PTR'

Old smatch warnings:
drivers/gpu/host1x/dev.c:520 host1x_probe() error: uninitialized symbol 'syncpt_irq'.

vim +/ERR_PTR +417 drivers/gpu/host1x/dev.c

d5185965c3b590 Dmitry Osipenko 2021-12-04  359  
06867a362de08f Thierry Reding  2019-10-28  360  	/*
4010e729349fca Thierry Reding  2020-03-25  361  	 * We may not always want to enable IOMMU support (for example if the
4010e729349fca Thierry Reding  2020-03-25  362  	 * host1x firewall is already enabled and we don't support addressing
4010e729349fca Thierry Reding  2020-03-25  363  	 * more than 32 bits of physical memory), so check for that first.
4010e729349fca Thierry Reding  2020-03-25  364  	 *
4010e729349fca Thierry Reding  2020-03-25  365  	 * Similarly, if host1x is already attached to an IOMMU (via the DMA
4010e729349fca Thierry Reding  2020-03-25  366  	 * API), don't try to attach again.
06867a362de08f Thierry Reding  2019-10-28  367  	 */
4010e729349fca Thierry Reding  2020-03-25  368  	if (!host1x_wants_iommu(host) || domain)
06867a362de08f Thierry Reding  2019-10-28  369  		return domain;
06867a362de08f Thierry Reding  2019-10-28  370  
06867a362de08f Thierry Reding  2019-10-28  371  	host->group = iommu_group_get(host->dev);
06867a362de08f Thierry Reding  2019-10-28  372  	if (host->group) {
06867a362de08f Thierry Reding  2019-10-28  373  		struct iommu_domain_geometry *geometry;
06867a362de08f Thierry Reding  2019-10-28  374  		dma_addr_t start, end;
06867a362de08f Thierry Reding  2019-10-28  375  		unsigned long order;
06867a362de08f Thierry Reding  2019-10-28  376  
06867a362de08f Thierry Reding  2019-10-28  377  		err = iova_cache_get();
06867a362de08f Thierry Reding  2019-10-28  378  		if (err < 0)
06867a362de08f Thierry Reding  2019-10-28  379  			goto put_group;
06867a362de08f Thierry Reding  2019-10-28  380  
06867a362de08f Thierry Reding  2019-10-28  381  		host->domain = iommu_domain_alloc(&platform_bus_type);
06867a362de08f Thierry Reding  2019-10-28  382  		if (!host->domain) {
06867a362de08f Thierry Reding  2019-10-28  383  			err = -ENOMEM;
06867a362de08f Thierry Reding  2019-10-28  384  			goto put_cache;
06867a362de08f Thierry Reding  2019-10-28  385  		}
06867a362de08f Thierry Reding  2019-10-28  386  
06867a362de08f Thierry Reding  2019-10-28  387  		err = iommu_attach_group(host->domain, host->group);
06867a362de08f Thierry Reding  2019-10-28  388  		if (err) {
06867a362de08f Thierry Reding  2019-10-28  389  			if (err == -ENODEV)
06867a362de08f Thierry Reding  2019-10-28  390  				err = 0;
06867a362de08f Thierry Reding  2019-10-28  391  
06867a362de08f Thierry Reding  2019-10-28  392  			goto free_domain;
06867a362de08f Thierry Reding  2019-10-28  393  		}
06867a362de08f Thierry Reding  2019-10-28  394  
06867a362de08f Thierry Reding  2019-10-28  395  		geometry = &host->domain->geometry;
06867a362de08f Thierry Reding  2019-10-28  396  		start = geometry->aperture_start & host->info->dma_mask;
06867a362de08f Thierry Reding  2019-10-28  397  		end = geometry->aperture_end & host->info->dma_mask;
06867a362de08f Thierry Reding  2019-10-28  398  
06867a362de08f Thierry Reding  2019-10-28  399  		order = __ffs(host->domain->pgsize_bitmap);
06867a362de08f Thierry Reding  2019-10-28  400  		init_iova_domain(&host->iova, 1UL << order, start >> order);
06867a362de08f Thierry Reding  2019-10-28  401  		host->iova_end = end;
06867a362de08f Thierry Reding  2019-10-28  402  
06867a362de08f Thierry Reding  2019-10-28  403  		domain = host->domain;
06867a362de08f Thierry Reding  2019-10-28  404  	}
06867a362de08f Thierry Reding  2019-10-28  405  
06867a362de08f Thierry Reding  2019-10-28  406  	return domain;
06867a362de08f Thierry Reding  2019-10-28  407  
06867a362de08f Thierry Reding  2019-10-28  408  free_domain:
06867a362de08f Thierry Reding  2019-10-28  409  	iommu_domain_free(host->domain);
06867a362de08f Thierry Reding  2019-10-28  410  	host->domain = NULL;
06867a362de08f Thierry Reding  2019-10-28  411  put_cache:
06867a362de08f Thierry Reding  2019-10-28  412  	iova_cache_put();
06867a362de08f Thierry Reding  2019-10-28  413  put_group:
06867a362de08f Thierry Reding  2019-10-28  414  	iommu_group_put(host->group);
06867a362de08f Thierry Reding  2019-10-28  415  	host->group = NULL;
06867a362de08f Thierry Reding  2019-10-28  416  
06867a362de08f Thierry Reding  2019-10-28 @417  	return ERR_PTR(err);
06867a362de08f Thierry Reding  2019-10-28  418  }
06867a362de08f Thierry Reding  2019-10-28  419  

:::::: The code at line 417 was first introduced by commit
:::::: 06867a362de08ff94fb573d84fd213795fbb3922 gpu: host1x: Set DMA mask based on IOMMU setup

:::::: TO: Thierry Reding <treding@nvidia.com>
:::::: CC: Thierry Reding <treding@nvidia.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
