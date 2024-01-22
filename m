Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76ADC46524
	for <oe-kbuild@lists.linux.dev>; Mon, 22 Jan 2024 11:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705922342; cv=none; b=eavtYsvHpClCPadU2cyvTOzdZ+CuyhSm5OmPusxyvv104rhHKH6KxMA0/7MC8wffZhXE1+trj+E/fTw60zZ064UOdBipYJPYFI41lA9QupINkG4khu5EQvdGnyxuFudrMl/sN4Kgqw9SJjI6+uRYhqnr+9iuZBl+XhojSEeAqdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705922342; c=relaxed/simple;
	bh=SpGe6KyyE0YRKkrCYaoc50mJMqNtF3fW6y7s9089nfc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kRK3K+nu1oVv14Qbok07Xkybhvu0ZZFAUGBdW2wJ4WRx7JtOfnU52nYuYu4Ts/bAG0YEE2tmQ36eBjBTM0/EJWb67a8DjYJ1yW3UFKz8D2F3N2NUPwJnn0W8UNtREbnNiicTpnT6cO3eWFLBCzeic8EkJscuoffz4VlP5mqAfDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bBkpRXN/; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bBkpRXN/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705922339; x=1737458339;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SpGe6KyyE0YRKkrCYaoc50mJMqNtF3fW6y7s9089nfc=;
  b=bBkpRXN/KI0TJnCaVE//F6gMLkhM0SztaVK9MfaAzEqQlZiDHVRc8eLF
   haNFB1Vv67WYR0EzdxkL/5CQzBBIFljgsdAtBemGhB/UEW5yWyfzli88J
   9Wn3Wo/wUbkDHJmO0ngbQC6bufM+pyv0MBTv4LEdNglpkRAkw2961kAZh
   J12mZRxPJNtT1+gyBVhBXH7jj6bxDxIIE6fb/6hlFxC1mHY1lDusVgzB5
   Y9AE+FbF+jJJvtXXGUicVSR2VCc8MB0HXWl3nC8IwTn8wiQtuE/XDLlWq
   +/s10e7RaxfbaQPoaHv/96ULCxJJVvwerqb8HlzUngbUGAX6meliVl/nK
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="7858796"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="7858796"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2024 03:18:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="1145095"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 22 Jan 2024 03:18:48 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rRsKD-0006Zc-2Q;
	Mon, 22 Jan 2024 11:18:45 +0000
Date: Mon, 22 Jan 2024 19:18:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 139/1036]
 drivers/gpu/drm/etnaviv/etnaviv_drv.c:614:3-14: ERROR: probable double put.
Message-ID: <202401221903.GjEKVu8R-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Sui Jingfeng <suijingfeng@loongson.cn>
CC: Lucas Stach <l.stach@pengutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   319fbd8fc6d339e0a1c7b067eed870c518a13a02
commit: 56df40c804fa40712239478355abe265aeda2197 [139/1036] drm/etnaviv: Add a helper to get the first available GPU device node
:::::: branch date: 10 hours ago
:::::: commit date: 3 months ago
config: x86_64-randconfig-102-20240122 (https://download.01.org/0day-ci/archive/20240122/202401221903.GjEKVu8R-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202401221903.GjEKVu8R-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/etnaviv/etnaviv_drv.c:614:3-14: ERROR: probable double put.

vim +614 drivers/gpu/drm/etnaviv/etnaviv_drv.c

a8c21a5451d831 The etnaviv authors 2015-12-03  597  
a8c21a5451d831 The etnaviv authors 2015-12-03  598  static int etnaviv_pdev_probe(struct platform_device *pdev)
a8c21a5451d831 The etnaviv authors 2015-12-03  599  {
a8c21a5451d831 The etnaviv authors 2015-12-03  600  	struct device *dev = &pdev->dev;
0ea057a9cb2be4 Michael Walle       2021-09-07  601  	struct device_node *first_node = NULL;
a8c21a5451d831 The etnaviv authors 2015-12-03  602  	struct component_match *match = NULL;
a8c21a5451d831 The etnaviv authors 2015-12-03  603  
246774d17fc05a Lucas Stach         2018-01-24  604  	if (!dev->platform_data) {
a8c21a5451d831 The etnaviv authors 2015-12-03  605  		struct device_node *core_node;
a8c21a5451d831 The etnaviv authors 2015-12-03  606  
246774d17fc05a Lucas Stach         2018-01-24  607  		for_each_compatible_node(core_node, NULL, "vivante,gc") {
246774d17fc05a Lucas Stach         2018-01-24  608  			if (!of_device_is_available(core_node))
246774d17fc05a Lucas Stach         2018-01-24  609  				continue;
a8c21a5451d831 The etnaviv authors 2015-12-03  610  
97ac0e47aed5f6 Russell King        2016-10-19  611  			drm_of_component_match_add(&pdev->dev, &match,
0a522394202f1f Yong Wu             2022-02-14  612  						   component_compare_of, core_node);
56df40c804fa40 Sui Jingfeng        2023-10-02  613  
56df40c804fa40 Sui Jingfeng        2023-10-02 @614  			of_node_put(core_node);
a8c21a5451d831 The etnaviv authors 2015-12-03  615  		}
246774d17fc05a Lucas Stach         2018-01-24  616  	} else {
a8c21a5451d831 The etnaviv authors 2015-12-03  617  		char **names = dev->platform_data;
a8c21a5451d831 The etnaviv authors 2015-12-03  618  		unsigned i;
a8c21a5451d831 The etnaviv authors 2015-12-03  619  
a8c21a5451d831 The etnaviv authors 2015-12-03  620  		for (i = 0; names[i]; i++)
0a522394202f1f Yong Wu             2022-02-14  621  			component_match_add(dev, &match, component_compare_dev_name, names[i]);
a8c21a5451d831 The etnaviv authors 2015-12-03  622  	}
a8c21a5451d831 The etnaviv authors 2015-12-03  623  
f5be833dc86f49 Michael Walle       2021-09-07  624  	/*
f5be833dc86f49 Michael Walle       2021-09-07  625  	 * PTA and MTLB can have 40 bit base addresses, but
f5be833dc86f49 Michael Walle       2021-09-07  626  	 * unfortunately, an entry in the MTLB can only point to a
f5be833dc86f49 Michael Walle       2021-09-07  627  	 * 32 bit base address of a STLB. Moreover, to initialize the
f5be833dc86f49 Michael Walle       2021-09-07  628  	 * MMU we need a command buffer with a 32 bit address because
f5be833dc86f49 Michael Walle       2021-09-07  629  	 * without an MMU there is only an indentity mapping between
f5be833dc86f49 Michael Walle       2021-09-07  630  	 * the internal 32 bit addresses and the bus addresses.
f5be833dc86f49 Michael Walle       2021-09-07  631  	 *
f5be833dc86f49 Michael Walle       2021-09-07  632  	 * To make things easy, we set the dma_coherent_mask to 32
f5be833dc86f49 Michael Walle       2021-09-07  633  	 * bit to make sure we are allocating the command buffers and
f5be833dc86f49 Michael Walle       2021-09-07  634  	 * TLBs in the lower 4 GiB address space.
f5be833dc86f49 Michael Walle       2021-09-07  635  	 */
f5be833dc86f49 Michael Walle       2021-09-07  636  	if (dma_set_mask(&pdev->dev, DMA_BIT_MASK(40)) ||
f5be833dc86f49 Michael Walle       2021-09-07  637  	    dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(32))) {
f5be833dc86f49 Michael Walle       2021-09-07  638  		dev_dbg(&pdev->dev, "No suitable DMA available\n");
f5be833dc86f49 Michael Walle       2021-09-07  639  		return -ENODEV;
f5be833dc86f49 Michael Walle       2021-09-07  640  	}
f5be833dc86f49 Michael Walle       2021-09-07  641  
0ea057a9cb2be4 Michael Walle       2021-09-07  642  	/*
0ea057a9cb2be4 Michael Walle       2021-09-07  643  	 * Apply the same DMA configuration to the virtual etnaviv
0ea057a9cb2be4 Michael Walle       2021-09-07  644  	 * device as the GPU we found. This assumes that all Vivante
0ea057a9cb2be4 Michael Walle       2021-09-07  645  	 * GPUs in the system share the same DMA constraints.
0ea057a9cb2be4 Michael Walle       2021-09-07  646  	 */
56df40c804fa40 Sui Jingfeng        2023-10-02  647  	first_node = etnaviv_of_first_available_node();
56df40c804fa40 Sui Jingfeng        2023-10-02  648  	if (first_node) {
0ea057a9cb2be4 Michael Walle       2021-09-07  649  		of_dma_configure(&pdev->dev, first_node, true);
56df40c804fa40 Sui Jingfeng        2023-10-02  650  		of_node_put(first_node);
56df40c804fa40 Sui Jingfeng        2023-10-02  651  	}
0ea057a9cb2be4 Michael Walle       2021-09-07  652  
a8c21a5451d831 The etnaviv authors 2015-12-03  653  	return component_master_add_with_match(dev, &etnaviv_master_ops, match);
a8c21a5451d831 The etnaviv authors 2015-12-03  654  }
a8c21a5451d831 The etnaviv authors 2015-12-03  655  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
