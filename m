Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F09C6207A22
	for <oe-kbuild@lists.linux.dev>; Wed,  6 Aug 2025 10:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754475930; cv=none; b=d13l7dQwPfZ1TV2gxFehiYsVOFNnRCQ5LFCI6KSaZA1GLzA86Xpn7mUl6dJ+kSeimSjkGQxzjTgksTfZ5k2q4h3eZhRgTF+Gdy05Mm1x6YzwypHIWYfX0cYalRitDaQnQ297p0oNwbU3k7hUvQp5nisxf7Zn3h3KgYw2ywrliTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754475930; c=relaxed/simple;
	bh=WzppdGYj5Wf0nMpGLgkrhcMnTCqDq4QUHqkPjtkk0D8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cWGoXb/mDlrc2YwmmXy0aZQebnVAHM+d1ZbLzj+k7SCCIQWSKQ4IGB/kzvKbDpI9vXYEvcZL30RKLt/p0crfKAVyEZqjISis4JLmxiX4wiUQMFlRsOOALZ+ub7kx2qgZL3uITllMZTglfd7PDG+ljGY8PleVcg4hkYNs1/97k5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nNMJ/04p; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nNMJ/04p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754475929; x=1786011929;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WzppdGYj5Wf0nMpGLgkrhcMnTCqDq4QUHqkPjtkk0D8=;
  b=nNMJ/04pX6Lw3uyk7Q2zu/kp8nVUT/zlPoawdTq350XikgbhWM9ANbbm
   PrjUz/sXbD9eV+6csO2d01uEqaj0hg2cCRb05QdK+Uyn8cn/rW/6GC1pW
   9down8gh3Nxj0rGpFSVtkFy97ob1CRZJ18lOWxjGVHSrXYSV8otjimxql
   JlfT09skDWJd8tj6a1abB7hTJ05h3DfaAkEI4WByVmWmZ0jENtpuzt/aU
   Hp4+TlIniPUBVvYQPGLA2RTIgDqs7W3XtVgl0uBLYI0RIzGgOf8O95/cO
   viPEvsymGCWoo25B+8cjJ8PqL8c8o6jXwGbyK3u8mlp5Qau9rep2Bru91
   g==;
X-CSE-ConnectionGUID: 9XHNQ/yWTpupNJXdvtfojg==
X-CSE-MsgGUID: ps+Tg9K/SluD3s/J92nRgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="56925979"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="56925979"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2025 03:25:28 -0700
X-CSE-ConnectionGUID: e7k73ilVQXCSEBmdCisKLw==
X-CSE-MsgGUID: u7GYXBbbSgqcMzU+tfD51g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="163960235"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 06 Aug 2025 03:25:27 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujbKe-0001Xg-0B;
	Wed, 06 Aug 2025 10:25:18 +0000
Date: Wed, 6 Aug 2025 18:24:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/irqchip/irq-gic-v5-its.c:267:17-18: WARNING: Unsigned
 expression compared with zero: i >= 0
Message-ID: <202508061850.WjGnJml3-lkp@intel.com>
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
TO: Lorenzo Pieralisi <lpieralisi@kernel.org>
CC: Marc Zyngier <maz@kernel.org>

Hi Lorenzo,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7881cd6886a89eda848192d3f5759ce08672e084
commit: 53bb952a625fd3247647c7a28366ce990a579415 arm64: Kconfig: Enable GICv5
date:   4 weeks ago
:::::: branch date: 8 hours ago
:::::: commit date: 4 weeks ago
config: arm64-randconfig-r052-20250806 (https://download.01.org/0day-ci/archive/20250806/202508061850.WjGnJml3-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202508061850.WjGnJml3-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/irqchip/irq-gic-v5-its.c:267:17-18: WARNING: Unsigned expression compared with zero: i >= 0

vim +267 drivers/irqchip/irq-gic-v5-its.c

57d72196dfc850 Lorenzo Pieralisi 2025-07-03  181  
57d72196dfc850 Lorenzo Pieralisi 2025-07-03  182  /*
57d72196dfc850 Lorenzo Pieralisi 2025-07-03  183   * Allocate a two-level ITT. All ITT entries are allocated in one go, unlike
57d72196dfc850 Lorenzo Pieralisi 2025-07-03  184   * with the device table. Span may be used to limit the second level table
57d72196dfc850 Lorenzo Pieralisi 2025-07-03  185   * size, where possible.
57d72196dfc850 Lorenzo Pieralisi 2025-07-03  186   */
57d72196dfc850 Lorenzo Pieralisi 2025-07-03  187  static int gicv5_its_create_itt_two_level(struct gicv5_its_chip_data *its,
57d72196dfc850 Lorenzo Pieralisi 2025-07-03  188  					  struct gicv5_its_dev *its_dev,
57d72196dfc850 Lorenzo Pieralisi 2025-07-03  189  					  unsigned int event_id_bits,
57d72196dfc850 Lorenzo Pieralisi 2025-07-03  190  					  unsigned int itt_l2sz,
57d72196dfc850 Lorenzo Pieralisi 2025-07-03  191  					  unsigned int num_events)
57d72196dfc850 Lorenzo Pieralisi 2025-07-03  192  {
57d72196dfc850 Lorenzo Pieralisi 2025-07-03  193  	unsigned int l1_bits, l2_bits, span, events_per_l2_table;
57d72196dfc850 Lorenzo Pieralisi 2025-07-03  194  	unsigned int i, complete_tables, final_span, num_ents;
57d72196dfc850 Lorenzo Pieralisi 2025-07-03  195  	__le64 *itt_l1, *itt_l2, **l2ptrs;
57d72196dfc850 Lorenzo Pieralisi 2025-07-03  196  	int ret;
57d72196dfc850 Lorenzo Pieralisi 2025-07-03  197  	u64 val;
57d72196dfc850 Lorenzo Pieralisi 2025-07-03  198  
57d72196dfc850 Lorenzo Pieralisi 2025-07-03  199  	ret = gicv5_its_l2sz_to_l2_bits(itt_l2sz);
57d72196dfc850 Lorenzo Pieralisi 2025-07-03  200  	if (ret >= event_id_bits) {
57d72196dfc850 Lorenzo Pieralisi 2025-07-03  201  		pr_debug("Incorrect l2sz (0x%x) for %u EventID bits. Cannot allocate ITT\n",
57d72196dfc850 Lorenzo Pieralisi 2025-07-03  202  			 itt_l2sz, event_id_bits);
57d72196dfc850 Lorenzo Pieralisi 2025-07-03  203  		return -EINVAL;
57d72196dfc850 Lorenzo Pieralisi 2025-07-03  204  	}
57d72196dfc850 Lorenzo Pieralisi 2025-07-03  205  
57d72196dfc850 Lorenzo Pieralisi 2025-07-03  206  	l2_bits = ret;
57d72196dfc850 Lorenzo Pieralisi 2025-07-03  207  
57d72196dfc850 Lorenzo Pieralisi 2025-07-03  208  	l1_bits = event_id_bits - l2_bits;
57d72196dfc850 Lorenzo Pieralisi 2025-07-03  209  
57d72196dfc850 Lorenzo Pieralisi 2025-07-03  210  	num_ents = BIT(l1_bits);
57d72196dfc850 Lorenzo Pieralisi 2025-07-03  211  
57d72196dfc850 Lorenzo Pieralisi 2025-07-03  212  	itt_l1 = kcalloc(num_ents, sizeof(*itt_l1), GFP_KERNEL);
57d72196dfc850 Lorenzo Pieralisi 2025-07-03  213  	if (!itt_l1)
57d72196dfc850 Lorenzo Pieralisi 2025-07-03  214  		return -ENOMEM;
57d72196dfc850 Lorenzo Pieralisi 2025-07-03  215  
57d72196dfc850 Lorenzo Pieralisi 2025-07-03  216  	l2ptrs = kcalloc(num_ents, sizeof(*l2ptrs), GFP_KERNEL);
57d72196dfc850 Lorenzo Pieralisi 2025-07-03  217  	if (!l2ptrs) {
57d72196dfc850 Lorenzo Pieralisi 2025-07-03  218  		kfree(itt_l1);
57d72196dfc850 Lorenzo Pieralisi 2025-07-03  219  		return -ENOMEM;
57d72196dfc850 Lorenzo Pieralisi 2025-07-03  220  	}
57d72196dfc850 Lorenzo Pieralisi 2025-07-03  221  
57d72196dfc850 Lorenzo Pieralisi 2025-07-03  222  	its_dev->itt_cfg.l2.l2ptrs = l2ptrs;
57d72196dfc850 Lorenzo Pieralisi 2025-07-03  223  
57d72196dfc850 Lorenzo Pieralisi 2025-07-03  224  	its_dev->itt_cfg.l2.l2sz = itt_l2sz;
57d72196dfc850 Lorenzo Pieralisi 2025-07-03  225  	its_dev->itt_cfg.l2.l1itt = itt_l1;
57d72196dfc850 Lorenzo Pieralisi 2025-07-03  226  	its_dev->itt_cfg.l2.num_l1_ents = num_ents;
57d72196dfc850 Lorenzo Pieralisi 2025-07-03  227  	its_dev->itt_cfg.l2itt = true;
57d72196dfc850 Lorenzo Pieralisi 2025-07-03  228  	its_dev->itt_cfg.event_id_bits = event_id_bits;
57d72196dfc850 Lorenzo Pieralisi 2025-07-03  229  
57d72196dfc850 Lorenzo Pieralisi 2025-07-03  230  	/*
57d72196dfc850 Lorenzo Pieralisi 2025-07-03  231  	 * Need to determine how many entries there are per L2 - this is based
57d72196dfc850 Lorenzo Pieralisi 2025-07-03  232  	 * on the number of bits in the table.
57d72196dfc850 Lorenzo Pieralisi 2025-07-03  233  	 */
57d72196dfc850 Lorenzo Pieralisi 2025-07-03  234  	events_per_l2_table = BIT(l2_bits);
57d72196dfc850 Lorenzo Pieralisi 2025-07-03  235  	complete_tables = num_events / events_per_l2_table;
57d72196dfc850 Lorenzo Pieralisi 2025-07-03  236  	final_span = order_base_2(num_events % events_per_l2_table);
57d72196dfc850 Lorenzo Pieralisi 2025-07-03  237  
57d72196dfc850 Lorenzo Pieralisi 2025-07-03  238  	for (i = 0; i < num_ents; i++) {
57d72196dfc850 Lorenzo Pieralisi 2025-07-03  239  		size_t l2sz;
57d72196dfc850 Lorenzo Pieralisi 2025-07-03  240  
57d72196dfc850 Lorenzo Pieralisi 2025-07-03  241  		span = i == complete_tables ? final_span : l2_bits;
57d72196dfc850 Lorenzo Pieralisi 2025-07-03  242  
57d72196dfc850 Lorenzo Pieralisi 2025-07-03  243  		itt_l2 = kcalloc(BIT(span), sizeof(*itt_l2), GFP_KERNEL);
57d72196dfc850 Lorenzo Pieralisi 2025-07-03  244  		if (!itt_l2) {
57d72196dfc850 Lorenzo Pieralisi 2025-07-03  245  			ret = -ENOMEM;
57d72196dfc850 Lorenzo Pieralisi 2025-07-03  246  			goto out_free;
57d72196dfc850 Lorenzo Pieralisi 2025-07-03  247  		}
57d72196dfc850 Lorenzo Pieralisi 2025-07-03  248  
57d72196dfc850 Lorenzo Pieralisi 2025-07-03  249  		its_dev->itt_cfg.l2.l2ptrs[i] = itt_l2;
57d72196dfc850 Lorenzo Pieralisi 2025-07-03  250  
57d72196dfc850 Lorenzo Pieralisi 2025-07-03  251  		l2sz = BIT(span) * sizeof(*itt_l2);
57d72196dfc850 Lorenzo Pieralisi 2025-07-03  252  
57d72196dfc850 Lorenzo Pieralisi 2025-07-03  253  		gicv5_its_dcache_clean(its, itt_l2, l2sz);
57d72196dfc850 Lorenzo Pieralisi 2025-07-03  254  
57d72196dfc850 Lorenzo Pieralisi 2025-07-03  255  		val = (virt_to_phys(itt_l2) & GICV5_ITTL1E_L2_ADDR_MASK) |
57d72196dfc850 Lorenzo Pieralisi 2025-07-03  256  		       FIELD_PREP(GICV5_ITTL1E_SPAN, span)		 |
57d72196dfc850 Lorenzo Pieralisi 2025-07-03  257  		       FIELD_PREP(GICV5_ITTL1E_VALID, 0x1);
57d72196dfc850 Lorenzo Pieralisi 2025-07-03  258  
57d72196dfc850 Lorenzo Pieralisi 2025-07-03  259  		WRITE_ONCE(itt_l1[i], cpu_to_le64(val));
57d72196dfc850 Lorenzo Pieralisi 2025-07-03  260  	}
57d72196dfc850 Lorenzo Pieralisi 2025-07-03  261  
57d72196dfc850 Lorenzo Pieralisi 2025-07-03  262  	gicv5_its_dcache_clean(its, itt_l1, num_ents * sizeof(*itt_l1));
57d72196dfc850 Lorenzo Pieralisi 2025-07-03  263  
57d72196dfc850 Lorenzo Pieralisi 2025-07-03  264  	return 0;
57d72196dfc850 Lorenzo Pieralisi 2025-07-03  265  
57d72196dfc850 Lorenzo Pieralisi 2025-07-03  266  out_free:
57d72196dfc850 Lorenzo Pieralisi 2025-07-03 @267  	for (i = i - 1; i >= 0; i--)
57d72196dfc850 Lorenzo Pieralisi 2025-07-03  268  		kfree(its_dev->itt_cfg.l2.l2ptrs[i]);
57d72196dfc850 Lorenzo Pieralisi 2025-07-03  269  
57d72196dfc850 Lorenzo Pieralisi 2025-07-03  270  	kfree(its_dev->itt_cfg.l2.l2ptrs);
57d72196dfc850 Lorenzo Pieralisi 2025-07-03  271  	kfree(itt_l1);
57d72196dfc850 Lorenzo Pieralisi 2025-07-03  272  	return ret;
57d72196dfc850 Lorenzo Pieralisi 2025-07-03  273  }
57d72196dfc850 Lorenzo Pieralisi 2025-07-03  274  

:::::: The code at line 267 was first introduced by commit
:::::: 57d72196dfc8502b7e376ecdffb11c4f8766f26d irqchip/gic-v5: Add GICv5 ITS support

:::::: TO: Lorenzo Pieralisi <lpieralisi@kernel.org>
:::::: CC: Marc Zyngier <maz@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
