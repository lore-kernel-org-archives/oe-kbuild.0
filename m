Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B5122FDE6
	for <oe-kbuild@lists.linux.dev>; Sun,  4 Oct 2026 19:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791143517; cv=none; b=s2fCs5S+ZWJ0jcLc/PKTm8kdJElf3DqsOOMTnLOW40mtmEaRTODMv3iu9tBPdsDIl/50gLPV9nUcexKgNpnwa4ZeBR1pRMfRhtX5wZznp9KexTPhYe6DScIWDlx6tLPq1T5AR/zaIlLMXqvHUExAtDyb06Tvxr/vuuKg7aTYBug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791143517; c=relaxed/simple;
	bh=h1XNflJshoahAz65J1PQC503lKCeZmhp/N0tG87ptDk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AOx9PZRd844TVsULzU2yNnhFD2DjwI3zhjXe3aBOjDfZRlP240Xv65RTWTAF6TwYLOQxdcs0GO7CkmMBHE+hDcMpycDifJQY3V2hHgHfXrNBYa5A2lO7z50RNpJqyZJxMs1EABwvfX7ZIRkVPU4BdDCzonchfCsRC4w3eUKWG/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L2X3npI0; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L2X3npI0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791143514; x=1822679514;
  h=date:from:to:cc:subject:message-id;
  bh=h1XNflJshoahAz65J1PQC503lKCeZmhp/N0tG87ptDk=;
  b=L2X3npI0KJv+Ng7V6ipQKNgPlzFELoA4RUBYpoePcM5uVd9hF80qfvbP
   uMFitxcSjQmUKNz8KCL1Ns5lTPSrC8SaSv/wy1RXuazU2RgCcZQK8HPAp
   PoAiIYeTTrX1omt22XzwSElDot4vEHlKJOqf1n1EOuZoXapv+E91YOx8e
   O6Hou68UyqBKkT/4AMPLt+wyy51OiMuNCl9OrCiVRQCd4jtrDcEjotqev
   HdoTdjS5DTLFO5+p4cibhNQ3RSxt+NAnKE83iMmnSBYPoZdPydWRJ7bkI
   LRnxh4xGUVxetwK1I4QlXolmEG02BIr7epdON4tJ5uZeklaoHw6a9vfWz
   Q==;
X-CSE-ConnectionGUID: 6AVQMeu6R0uS1X2XJoc/9Q==
X-CSE-MsgGUID: F//ZcXAKTL+dGPaE7oAwhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11925"; a="90879719"
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; 
   d="scan'208";a="90879719"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2026 12:51:54 -0700
X-CSE-ConnectionGUID: snLZu/3YTOGf/TAjs91MrA==
X-CSE-MsgGUID: m+Cw+w0BQHe864whbF090A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; 
   d="scan'208";a="280402461"
Received: from igk-lkp-server01.igk.intel.com (HELO 3a02ec7efc9f) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 04 Oct 2026 12:51:53 -0700
Received: from kbuild by 3a02ec7efc9f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDSFR-000000000Ot-0tLi;
	Sun, 04 Oct 2026 19:51:49 +0000
Date: Sun, 04 Oct 2026 21:50:58 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/irqchip/irq-bcm7038-l1.c:411:7-10: ERROR: iterator
 variable bound on line 408 cannot be NULL
Message-ID: <202610042107.ut2qzh64-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Johan Hovold <johan@kernel.org>
CC: Thomas Gleixner <tglx@linutronix.de>
CC: Florian Fainelli <florian.fainelli@broadcom.com>

Hi Johan,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7704c4c5bb127673b4f0ead839919db573559e38
commit: 1230fbb225abf3f04c64697c6b0f8dfb473b3790 irqchip: Enable compile testing of Broadcom drivers
date:   12 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 12 months ago
config: um-randconfig-r2104-20261004 (https://download.01.org/0day-ci/archive/20261004/202610042107.ut2qzh64-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project d7e4505dd447d115d85fdea45cd71030ac1d86ee)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 1230fbb225ab ("irqchip: Enable compile testing of Broadcom drivers")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202610042107.ut2qzh64-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/irqchip/irq-bcm7038-l1.c:411:7-10: ERROR: iterator variable bound on line 408 cannot be NULL

vim +411 drivers/irqchip/irq-bcm7038-l1.c

5f7f0317ed28b8 Kevin Cernekee    2014-12-25  396  
1e3e330c07076a Johan Hovold      2025-10-13  397  static int bcm7038_l1_probe(struct platform_device *pdev, struct device_node *parent)
5f7f0317ed28b8 Kevin Cernekee    2014-12-25  398  {
1e3e330c07076a Johan Hovold      2025-10-13  399  	struct device_node *dn = pdev->dev.of_node;
5f7f0317ed28b8 Kevin Cernekee    2014-12-25  400  	struct bcm7038_l1_chip *intc;
5f7f0317ed28b8 Kevin Cernekee    2014-12-25  401  	int idx, ret;
5f7f0317ed28b8 Kevin Cernekee    2014-12-25  402  
5f7f0317ed28b8 Kevin Cernekee    2014-12-25  403  	intc = kzalloc(sizeof(*intc), GFP_KERNEL);
5f7f0317ed28b8 Kevin Cernekee    2014-12-25  404  	if (!intc)
5f7f0317ed28b8 Kevin Cernekee    2014-12-25  405  		return -ENOMEM;
5f7f0317ed28b8 Kevin Cernekee    2014-12-25  406  
5f7f0317ed28b8 Kevin Cernekee    2014-12-25  407  	raw_spin_lock_init(&intc->lock);
5f7f0317ed28b8 Kevin Cernekee    2014-12-25 @408  	for_each_possible_cpu(idx) {
5f7f0317ed28b8 Kevin Cernekee    2014-12-25  409  		ret = bcm7038_l1_init_one(dn, idx, intc);
5f7f0317ed28b8 Kevin Cernekee    2014-12-25  410  		if (ret < 0) {
5f7f0317ed28b8 Kevin Cernekee    2014-12-25 @411  			if (idx)
5f7f0317ed28b8 Kevin Cernekee    2014-12-25  412  				break;
5f7f0317ed28b8 Kevin Cernekee    2014-12-25  413  			pr_err("failed to remap intc L1 registers\n");
5f7f0317ed28b8 Kevin Cernekee    2014-12-25  414  			goto out_free;
5f7f0317ed28b8 Kevin Cernekee    2014-12-25  415  		}
5f7f0317ed28b8 Kevin Cernekee    2014-12-25  416  	}
5f7f0317ed28b8 Kevin Cernekee    2014-12-25  417  
affdc0d1bdfa54 Jiri Slaby (SUSE  2025-03-19  418) 	intc->domain = irq_domain_create_linear(of_fwnode_handle(dn), IRQS_PER_WORD * intc->n_words,
5f7f0317ed28b8 Kevin Cernekee    2014-12-25  419  					     &bcm7038_l1_domain_ops,
5f7f0317ed28b8 Kevin Cernekee    2014-12-25  420  					     intc);
5f7f0317ed28b8 Kevin Cernekee    2014-12-25  421  	if (!intc->domain) {
5f7f0317ed28b8 Kevin Cernekee    2014-12-25  422  		ret = -ENOMEM;
5f7f0317ed28b8 Kevin Cernekee    2014-12-25  423  		goto out_unmap;
5f7f0317ed28b8 Kevin Cernekee    2014-12-25  424  	}
5f7f0317ed28b8 Kevin Cernekee    2014-12-25  425  

:::::: The code at line 411 was first introduced by commit
:::::: 5f7f0317ed28b86bdae9baf65bb72d405b6f79ee IRQCHIP: Add new driver for BCM7038-style level 1 interrupt controllers

:::::: TO: Kevin Cernekee <cernekee@gmail.com>
:::::: CC: Ralf Baechle <ralf@linux-mips.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
