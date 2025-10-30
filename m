Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DAA722B5AD
	for <oe-kbuild@lists.linux.dev>; Thu, 30 Oct 2025 02:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761790749; cv=none; b=IynaWshaOTa/Kbmn/yGH/UVmytpUg4e5IL8Ig/KlQMyULWVN7t23bHMzuYt59PjB5D3A8a3CGk8l+MuZ9dZtnT6i3I8icI91/pdYx+9zO8s9GSmxiJ5m1sTsvWvmfZzBgwNaYmOr5BthJhANJWltsuG8TazU8SOXhe8LwW9PpLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761790749; c=relaxed/simple;
	bh=DqCFJ5pCBaqME1Yz/3NNALCZPdpvBXRFLTHWYTKegjk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RMQatnZLxgR1G+aAyV43JHuIpkFD3ewEG/UaHic6/kxTyOEWqtux3FV1BzTao88b3jez5lDwrdQn7uWQp7+gj0JdWh+SMcqsMs3Xgu2nB0grWOjuqoK+G0y99tAHtTKxz0Iph9vOsf7iiTYG0WJl/0iZenjrGHCftDIiLEVKlno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MJ+hKHcX; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MJ+hKHcX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761790747; x=1793326747;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DqCFJ5pCBaqME1Yz/3NNALCZPdpvBXRFLTHWYTKegjk=;
  b=MJ+hKHcXdFfZvwENqd4Ut3AQYCO560r0lv/k1Bl3UG12CmfYeEgS5Kxn
   w50OtNHMDRfNHP1XRQzcC32tMEWzBPK3f053bk9hMV0phZITpyBqf1Tnz
   SuH67I7FG9biViyjxxBoUFT38hO0ASaymlNU+SFEfg+YklELsuq81wuQ5
   5feJ8GjSZbyA2F6EYuCAfPQeylFWkfFnWJPZH0+eQcvY0EISuz2lH3N7v
   a7+rsKjR+LI5lYQ2PqLpyNPUhXe68OW8x+BP54BNzHJkFEFtheWNX3fvY
   Ia9KLmBw6Q+gqIsg3pWXhOmza5iT/C7yVDyUFT+yeguOaFPfBxLlu2+in
   g==;
X-CSE-ConnectionGUID: Hy/1hmt1QIy6K7aEgwFVTg==
X-CSE-MsgGUID: knxjvxKDThK8MANFdJxH5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="75045102"
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; 
   d="scan'208";a="75045102"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 19:19:04 -0700
X-CSE-ConnectionGUID: 7SThXFmHTpGJjwC3Ghgw+A==
X-CSE-MsgGUID: wCC78F6BTeWXM/zrgKsn/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; 
   d="scan'208";a="185708369"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 29 Oct 2025 19:19:02 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEIFf-000LN0-38;
	Thu, 30 Oct 2025 02:18:59 +0000
Date: Thu, 30 Oct 2025 10:14:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/clocksource/timer-econet-en751221.c:179:61-68: WARNING:
 Consider using %pe to print PTR_ERR()
Message-ID: <202510301041.0usfnzHG-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Caleb James DeLisle <cjd@cjdns.fr>
CC: Daniel Lezcano <daniel.lezcano@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e53642b87a4f4b03a8d7e5f8507fc3cd0c595ea6
commit: 3b4c33ac87d0d11308f4445ecec2a124e2e77724 clocksource/drivers: Add EcoNet Timer HPT driver
date:   6 months ago
:::::: branch date: 25 hours ago
:::::: commit date: 6 months ago
config: powerpc-randconfig-r054-20251029 (https://download.01.org/0day-ci/archive/20251030/202510301041.0usfnzHG-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202510301041.0usfnzHG-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/clocksource/timer-econet-en751221.c:179:61-68: WARNING: Consider using %pe to print PTR_ERR()

vim +179 drivers/clocksource/timer-econet-en751221.c

3b4c33ac87d0d1 Caleb James DeLisle 2025-05-07  170  
3b4c33ac87d0d1 Caleb James DeLisle 2025-05-07  171  static int __init timer_init(struct device_node *np)
3b4c33ac87d0d1 Caleb James DeLisle 2025-05-07  172  {
3b4c33ac87d0d1 Caleb James DeLisle 2025-05-07  173  	int num_blocks = DIV_ROUND_UP(num_possible_cpus(), 2);
3b4c33ac87d0d1 Caleb James DeLisle 2025-05-07  174  	struct clk *clk;
3b4c33ac87d0d1 Caleb James DeLisle 2025-05-07  175  	int ret;
3b4c33ac87d0d1 Caleb James DeLisle 2025-05-07  176  
3b4c33ac87d0d1 Caleb James DeLisle 2025-05-07  177  	clk = of_clk_get(np, 0);
3b4c33ac87d0d1 Caleb James DeLisle 2025-05-07  178  	if (IS_ERR(clk)) {
3b4c33ac87d0d1 Caleb James DeLisle 2025-05-07 @179  		pr_err("%pOFn: Failed to get CPU clock from DT %ld\n", np, PTR_ERR(clk));
3b4c33ac87d0d1 Caleb James DeLisle 2025-05-07  180  		return PTR_ERR(clk);
3b4c33ac87d0d1 Caleb James DeLisle 2025-05-07  181  	}
3b4c33ac87d0d1 Caleb James DeLisle 2025-05-07  182  
3b4c33ac87d0d1 Caleb James DeLisle 2025-05-07  183  	econet_timer.freq_hz = clk_get_rate(clk);
3b4c33ac87d0d1 Caleb James DeLisle 2025-05-07  184  
3b4c33ac87d0d1 Caleb James DeLisle 2025-05-07  185  	for (int i = 0; i < num_blocks; i++) {
3b4c33ac87d0d1 Caleb James DeLisle 2025-05-07  186  		econet_timer.membase[i] = of_iomap(np, i);
3b4c33ac87d0d1 Caleb James DeLisle 2025-05-07  187  		if (!econet_timer.membase[i]) {
3b4c33ac87d0d1 Caleb James DeLisle 2025-05-07  188  			pr_err("%pOFn: failed to map register [%d]\n", np, i);
3b4c33ac87d0d1 Caleb James DeLisle 2025-05-07  189  			return -ENXIO;
3b4c33ac87d0d1 Caleb James DeLisle 2025-05-07  190  		}
3b4c33ac87d0d1 Caleb James DeLisle 2025-05-07  191  	}
3b4c33ac87d0d1 Caleb James DeLisle 2025-05-07  192  
3b4c33ac87d0d1 Caleb James DeLisle 2025-05-07  193  	/* For clocksource purposes always read clock zero, whatever the CPU */
3b4c33ac87d0d1 Caleb James DeLisle 2025-05-07  194  	ret = clocksource_mmio_init(reg_count(0), np->name,
3b4c33ac87d0d1 Caleb James DeLisle 2025-05-07  195  				    econet_timer.freq_hz, 301, ECONET_BITS,
3b4c33ac87d0d1 Caleb James DeLisle 2025-05-07  196  				    clocksource_mmio_readl_up);
3b4c33ac87d0d1 Caleb James DeLisle 2025-05-07  197  	if (ret) {
3b4c33ac87d0d1 Caleb James DeLisle 2025-05-07  198  		pr_err("%pOFn: clocksource_mmio_init failed: %d", np, ret);
3b4c33ac87d0d1 Caleb James DeLisle 2025-05-07  199  		return ret;
3b4c33ac87d0d1 Caleb James DeLisle 2025-05-07  200  	}
3b4c33ac87d0d1 Caleb James DeLisle 2025-05-07  201  
3b4c33ac87d0d1 Caleb James DeLisle 2025-05-07  202  	ret = cevt_init(np);
3b4c33ac87d0d1 Caleb James DeLisle 2025-05-07  203  	if (ret < 0)
3b4c33ac87d0d1 Caleb James DeLisle 2025-05-07  204  		return ret;
3b4c33ac87d0d1 Caleb James DeLisle 2025-05-07  205  
3b4c33ac87d0d1 Caleb James DeLisle 2025-05-07  206  	sched_clock_register(sched_clock_read, ECONET_BITS,
3b4c33ac87d0d1 Caleb James DeLisle 2025-05-07  207  			     econet_timer.freq_hz);
3b4c33ac87d0d1 Caleb James DeLisle 2025-05-07  208  
3b4c33ac87d0d1 Caleb James DeLisle 2025-05-07  209  	pr_info("%pOFn: using %u.%03u MHz high precision timer\n", np,
3b4c33ac87d0d1 Caleb James DeLisle 2025-05-07  210  		econet_timer.freq_hz / 1000000,
3b4c33ac87d0d1 Caleb James DeLisle 2025-05-07  211  		(econet_timer.freq_hz / 1000) % 1000);
3b4c33ac87d0d1 Caleb James DeLisle 2025-05-07  212  
3b4c33ac87d0d1 Caleb James DeLisle 2025-05-07  213  	return 0;
3b4c33ac87d0d1 Caleb James DeLisle 2025-05-07  214  }
3b4c33ac87d0d1 Caleb James DeLisle 2025-05-07  215  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
