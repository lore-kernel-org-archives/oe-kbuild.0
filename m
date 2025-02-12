Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12EC520CCD0
	for <oe-kbuild@lists.linux.dev>; Wed, 12 Feb 2025 12:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739364294; cv=none; b=TQ2iVCvt3GXuH+Bdd0ZI9H3VI1in9H7gNawcS/st9Qz8FQudGTBlIc/YEh7OjUPyKXl6yyvwXazOulciEiZ+Msbq1SqL4Wqv15EblRhuDxBWf8bM1IqYhfzcP0HKFq6PvHB7gcHk0GqQGsdkeB/OzY1fJi6xvrlcTG412ct9sEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739364294; c=relaxed/simple;
	bh=DhHhvGKc9amNsSKTE7Pl2iATEiiT+abQrztvYSCwCzE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JJSnYJwX0WYg43SPiG7j9IvdIdP3UcTAjddSIxA6N499egIbBaiQQNyDxakEbyQK5yQz/X86qqQwcGDUF+9/GqvnP6aM+1WwkYNU9xvexH4xrL59J+BFu8Z8f9Kdxx/yit4Rk+B871JjW7yj3iMOjQpSoFUU0O2MdmE6FEfZmYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BJlzJlqG; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BJlzJlqG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739364292; x=1770900292;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=DhHhvGKc9amNsSKTE7Pl2iATEiiT+abQrztvYSCwCzE=;
  b=BJlzJlqGgxKk9ydU2hg3saG+wFQFbi77B1CFd4vRYnGE7NR4tHiIUM6L
   /twGKwjBWGACXcG7ZlppXfqL+mWi7DxTIZ1EE0vFI+8RR+Lb+LgXR9Rml
   gtdb8DRY3AYnMmwRg0QDqQz9Ut2WpIec6XghH+fGeSG0X9gA9OCp9Ghxi
   Vry1Z04bWwQTTTnotrdPceBwtfhdjaNGWJzKVeIKRGPhGUqifrggzMp/t
   Kmx5AJaKiTQ4oROo5jlDSYo9T0/EE+GvL0zijDcmm7vIMamv9L1ESf5vf
   KWh4OoH/Bneub6+j/A0TTAvs7Z+xqBGPGyGdsypI+orSUN0kdAgWWtrYd
   A==;
X-CSE-ConnectionGUID: DdEh5GF5Sfqp6vJTWLUXpA==
X-CSE-MsgGUID: e3V0OYZVRtGFb2k/5pjYUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="39721480"
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; 
   d="scan'208";a="39721480"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 04:44:51 -0800
X-CSE-ConnectionGUID: MowZNqiCT2GW6PG8AVkUJg==
X-CSE-MsgGUID: 3dYkpcacQOaeTM31HH93Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; 
   d="scan'208";a="117821591"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 12 Feb 2025 04:44:50 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tiC6i-0015c5-0O;
	Wed, 12 Feb 2025 12:44:48 +0000
Date: Wed, 12 Feb 2025 20:44:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/dma/sun4i-dma.c:463 __execute_vchan_pending() warn: can
 'promise' even be NULL?
Message-ID: <202502122038.cr09r8Ef-lkp@intel.com>
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
TO: Mesih Kilinc <mesihkilinc@gmail.com>
CC: Vinod Koul <vkoul@kernel.org>
CC: "Csókás Bence" <csokas.bence@prolan.hu>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   09fbf3d502050282bf47ab3babe1d4ed54dd1fd8
commit: 6faf1ccadad6718957753d6cda2281416b288bde dma-engine: sun4i: Add support for Allwinner suniv F1C100s
date:   9 weeks ago
:::::: branch date: 18 hours ago
:::::: commit date: 9 weeks ago
config: arm-randconfig-r073-20250212 (https://download.01.org/0day-ci/archive/20250212/202502122038.cr09r8Ef-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250212/202502122038.cr09r8Ef-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202502122038.cr09r8Ef-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm/kernel/head.o: in function `__mmap_switched':
>> (.init.text+0x20): relocation truncated to fit: R_ARM_PC24 against symbol `__memset' defined in .text section in arch/arm/lib/memset.o
   arch/arm/kernel/entry-armv.o: in function `__irq_svc':
>> (.entry.text+0x138): relocation truncated to fit: R_ARM_PC24 against symbol `generic_handle_arch_irq' defined in .noinstr.text section in kernel/irq/handle.o
>> (.entry.text+0x144): relocation truncated to fit: R_ARM_PC24 against symbol `call_with_stack' defined in .text section in arch/arm/lib/call_with_stack.o
   arch/arm/kernel/entry-armv.o: in function `svc_preempt':
>> (.entry.text+0x184): relocation truncated to fit: R_ARM_PC24 against symbol `preempt_schedule_irq' defined in .sched.text section in kernel/sched/core.o
   arch/arm/kernel/entry-armv.o: in function `__irq_usr':
   (.entry.text+0x480): relocation truncated to fit: R_ARM_PC24 against symbol `call_with_stack' defined in .text section in arch/arm/lib/call_with_stack.o
   arch/arm/kernel/traps.o: in function `dump_backtrace_stm':
   traps.c:(.text+0x60): relocation truncated to fit: R_ARM_PC24 against symbol `sprintf' defined in .text section in lib/vsprintf.o
   arch/arm/kernel/traps.o: in function `die':
   traps.c:(.text+0x148): relocation truncated to fit: R_ARM_PC24 against symbol `report_bug' defined in .text section in lib/bug.o
   traps.c:(.text+0x308): relocation truncated to fit: R_ARM_PC24 against symbol `warn_bogus_irq_restore' defined in .noinstr.text section in kernel/locking/irqflag-debug.o
   arch/arm/kernel/traps.o: in function `register_undef_hook':
   traps.c:(.text+0x50c): relocation truncated to fit: R_ARM_PC24 against symbol `preempt_schedule' defined in .sched.text section in kernel/sched/core.o
   traps.c:(.text+0x534): relocation truncated to fit: R_ARM_PC24 against symbol `warn_bogus_irq_restore' defined in .noinstr.text section in kernel/locking/irqflag-debug.o
   arch/arm/kernel/traps.o: in function `unregister_undef_hook':
   traps.c:(.text+0x5dc): additional relocation overflows omitted from the output

smatch warnings:
drivers/dma/sun4i-dma.c:463 __execute_vchan_pending() warn: can 'promise' even be NULL?

vim +/promise +463 drivers/dma/sun4i-dma.c

b096c1377d1e50 Emilio López   2015-07-26  400  
023069ba3f4407 Lee Jones      2020-07-14  401  /*
b096c1377d1e50 Emilio López   2015-07-26  402   * Execute pending operations on a vchan
b096c1377d1e50 Emilio López   2015-07-26  403   *
b096c1377d1e50 Emilio López   2015-07-26  404   * When given a vchan, this function will try to acquire a suitable
b096c1377d1e50 Emilio López   2015-07-26  405   * pchan and, if successful, will configure it to fulfill a promise
b096c1377d1e50 Emilio López   2015-07-26  406   * from the next pending contract.
b096c1377d1e50 Emilio López   2015-07-26  407   *
b096c1377d1e50 Emilio López   2015-07-26  408   * This function must be called with &vchan->vc.lock held.
b096c1377d1e50 Emilio López   2015-07-26  409   */
b096c1377d1e50 Emilio López   2015-07-26  410  static int __execute_vchan_pending(struct sun4i_dma_dev *priv,
b096c1377d1e50 Emilio López   2015-07-26  411  				   struct sun4i_dma_vchan *vchan)
b096c1377d1e50 Emilio López   2015-07-26  412  {
b096c1377d1e50 Emilio López   2015-07-26  413  	struct sun4i_dma_promise *promise = NULL;
b096c1377d1e50 Emilio López   2015-07-26  414  	struct sun4i_dma_contract *contract = NULL;
b096c1377d1e50 Emilio López   2015-07-26  415  	struct sun4i_dma_pchan *pchan;
b096c1377d1e50 Emilio López   2015-07-26  416  	struct virt_dma_desc *vd;
b096c1377d1e50 Emilio López   2015-07-26  417  	int ret;
b096c1377d1e50 Emilio López   2015-07-26  418  
b096c1377d1e50 Emilio López   2015-07-26  419  	lockdep_assert_held(&vchan->vc.lock);
b096c1377d1e50 Emilio López   2015-07-26  420  
b096c1377d1e50 Emilio López   2015-07-26  421  	/* We need a pchan to do anything, so secure one if available */
b096c1377d1e50 Emilio López   2015-07-26  422  	pchan = find_and_use_pchan(priv, vchan);
b096c1377d1e50 Emilio López   2015-07-26  423  	if (!pchan)
b096c1377d1e50 Emilio López   2015-07-26  424  		return -EBUSY;
b096c1377d1e50 Emilio López   2015-07-26  425  
b096c1377d1e50 Emilio López   2015-07-26  426  	/*
b096c1377d1e50 Emilio López   2015-07-26  427  	 * Channel endpoints must not be repeated, so if this vchan
b096c1377d1e50 Emilio López   2015-07-26  428  	 * has already submitted some work, we can't do anything else
b096c1377d1e50 Emilio López   2015-07-26  429  	 */
b096c1377d1e50 Emilio López   2015-07-26  430  	if (vchan->processing) {
b096c1377d1e50 Emilio López   2015-07-26  431  		dev_dbg(chan2dev(&vchan->vc.chan),
b096c1377d1e50 Emilio López   2015-07-26  432  			"processing something to this endpoint already\n");
b096c1377d1e50 Emilio López   2015-07-26  433  		ret = -EBUSY;
b096c1377d1e50 Emilio López   2015-07-26  434  		goto release_pchan;
b096c1377d1e50 Emilio López   2015-07-26  435  	}
b096c1377d1e50 Emilio López   2015-07-26  436  
b096c1377d1e50 Emilio López   2015-07-26  437  	do {
b096c1377d1e50 Emilio López   2015-07-26  438  		/* Figure out which contract we're working with today */
b096c1377d1e50 Emilio López   2015-07-26  439  		vd = vchan_next_desc(&vchan->vc);
b096c1377d1e50 Emilio López   2015-07-26  440  		if (!vd) {
b096c1377d1e50 Emilio López   2015-07-26  441  			dev_dbg(chan2dev(&vchan->vc.chan),
b096c1377d1e50 Emilio López   2015-07-26  442  				"No pending contract found");
b096c1377d1e50 Emilio López   2015-07-26  443  			ret = 0;
b096c1377d1e50 Emilio López   2015-07-26  444  			goto release_pchan;
b096c1377d1e50 Emilio López   2015-07-26  445  		}
b096c1377d1e50 Emilio López   2015-07-26  446  
b096c1377d1e50 Emilio López   2015-07-26  447  		contract = to_sun4i_dma_contract(vd);
b096c1377d1e50 Emilio López   2015-07-26  448  		if (list_empty(&contract->demands)) {
b096c1377d1e50 Emilio López   2015-07-26  449  			/* The contract has been completed so mark it as such */
b096c1377d1e50 Emilio López   2015-07-26  450  			list_del(&contract->vd.node);
b096c1377d1e50 Emilio López   2015-07-26  451  			vchan_cookie_complete(&contract->vd);
b096c1377d1e50 Emilio López   2015-07-26  452  			dev_dbg(chan2dev(&vchan->vc.chan),
b096c1377d1e50 Emilio López   2015-07-26  453  				"Empty contract found and marked complete");
b096c1377d1e50 Emilio López   2015-07-26  454  		}
b096c1377d1e50 Emilio López   2015-07-26  455  	} while (list_empty(&contract->demands));
b096c1377d1e50 Emilio López   2015-07-26  456  
b096c1377d1e50 Emilio López   2015-07-26  457  	/* Now find out what we need to do */
b096c1377d1e50 Emilio López   2015-07-26  458  	promise = list_first_entry(&contract->demands,
b096c1377d1e50 Emilio López   2015-07-26  459  				   struct sun4i_dma_promise, list);
b096c1377d1e50 Emilio López   2015-07-26  460  	vchan->processing = promise;
b096c1377d1e50 Emilio López   2015-07-26  461  
b096c1377d1e50 Emilio López   2015-07-26  462  	/* ... and make it reality */
b096c1377d1e50 Emilio López   2015-07-26 @463  	if (promise) {
b096c1377d1e50 Emilio López   2015-07-26  464  		vchan->contract = contract;
b096c1377d1e50 Emilio López   2015-07-26  465  		vchan->pchan = pchan;
a94a098a21c678 Samuel Holland 2022-06-20  466  		set_pchan_interrupt(priv, pchan, contract->use_half_int, 1);
b096c1377d1e50 Emilio López   2015-07-26  467  		configure_pchan(pchan, promise);
b096c1377d1e50 Emilio López   2015-07-26  468  	}
b096c1377d1e50 Emilio López   2015-07-26  469  
b096c1377d1e50 Emilio López   2015-07-26  470  	return 0;
b096c1377d1e50 Emilio López   2015-07-26  471  
b096c1377d1e50 Emilio López   2015-07-26  472  release_pchan:
b096c1377d1e50 Emilio López   2015-07-26  473  	release_pchan(priv, pchan);
b096c1377d1e50 Emilio López   2015-07-26  474  	return ret;
b096c1377d1e50 Emilio López   2015-07-26  475  }
b096c1377d1e50 Emilio López   2015-07-26  476  

:::::: The code at line 463 was first introduced by commit
:::::: b096c1377d1e50cea91d1db13bca8e7802199a67 dmaengine: sun4i: Add support for the DMA engine on sun[457]i SoCs

:::::: TO: Emilio López <emilio@elopez.com.ar>
:::::: CC: Vinod Koul <vinod.koul@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
