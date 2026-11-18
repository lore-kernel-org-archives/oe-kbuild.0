Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795038408;
	b=Y81VbzfiVf5R/5M4q1icLgMCz7p0KzVZu3RKhfqdHCBVrN16htPi3x7Nj3Rwu5acd0rX
	 ANNaOR+HtBTD5IeAoKbCVWW4SJDuMOZZygR+yRdo7t+ZnNkXKABxQboOvi3qa25+vSBS+
	 u4QMuFv+6ArXb8caQMPUl7SVpgRs5YAWBPTs1HGggKPi51RnDh0NVCtDJxU9IIGq0K04E
	 1DBHnclAPauD2lKE7p2SXFTOy+riydfiLEffiv/+4yM3yCemZRNq/8dttTHuf1Frsg2WF
	 00h/T5XvZEbVkdkct2/mg5uR87ZdLt4TQcwDa0bW4DHrsa4olWyOyuXxX8IbbOiPSQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795038408;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=cG3t3fLXL2/pz7XXFyPoaOAPSl1l0UPqh2zb2OCZklE=;
	b=0WnHWK6jxNPf0AC/f7Li1SM+uQxd6+sEqtl3MjuMNtYGBhkPo7pkbkhy8KQJmNF+CVc5
	 4H2PLpd4z3a2ZnoJjhPBffSeQkUX5qFPGdKndljM7HhwjKCcntI3El0chfIcLC4ltEVet
	 Knf34PKgsQ9MOjYrCtg47ECWccTM+558lQSKZHk4XNRsRaIntSa7PAdBX8jvYYBgojxu0
	 FIqvVHsQTe3L7w3GW8ezxC73L0eGcytAlUbWHANx+r15tuVH3Q4EFUJVIEzsUjaRwHt+K
	 4Py0RPaBsBJpU4v6pcBajZCvhfhiD2JGZTWP8XA6VGDv2F5WSFmw1olJoyXx0cZ3b6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TXAm3+wo;
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23FBB606A31C
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Nov 2026 21:46:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23FBB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TXAm3+wo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795038408; x=1826574408;
  h=date:from:to:cc:subject:message-id;
  bh=fYvNu/kosmScItJk/7LSVOy7KRrb7Ly1MPojinmLN6s=;
  b=TXAm3+woPyGHY6KmMSd/jeG4VPcBvpd6iSbAhKmUqcWGILK+v3ROVQ1H
   j+spO4/Fc8BxAKajJVfm51km2u4kdc/buRB1xgu4sRbuxd/bBJc/XBLkl
   LTniaSPy5x/hy7CYRxMk2UJ9ECQkhmMQTjNu+A8aYUh6FvUNraXK330fh
   QCBGxen5ede42pxfp6P+K5aQCq8erniXhMnY9qxPkhdkpzfjrIPB+dFPS
   2JyUsG4CaGB6LvU3Dz3PFwRXmQIIwYadkhCLo+DAAJt3KaCpXhz2iXlnm
   2apIkBsKPuRORGmAjeXE2nVb5NFmHNVu+da3qGz0L7F3cZFr9bSwSht2u
   w==;
X-CSE-ConnectionGUID: RluyzxsSQKqzKG1WyodArQ==
X-CSE-MsgGUID: 1s6BHLNeTwiuOLMS7unvBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3788570"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3788570"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 13:46:48 -0800
X-CSE-ConnectionGUID: KImu9q40Qteuw4QnvwZZRg==
X-CSE-MsgGUID: nnmPjxB7RZ2zhwBEwJmfqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10258562"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 18 Nov 2026 13:46:47 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTnUK-000000003U5-2Nqu;
	Wed, 18 Nov 2026 21:46:44 +0000
Date: Wed, 18 Nov 2026 22:46:29 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/irqchip/irq-bcm7038-l1.c:411:7-10: ERROR: iterator
 variable bound on line 408 cannot be NULL
Message-ID: <20261118223936.zqFEaXJv-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Johan Hovold <johan@kernel.org>
CC: Thomas Gleixner <tglx@linutronix.de>
CC: Florian Fainelli <florian.fainelli@broadcom.com>

Hi Johan,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4405c18c95d2d0f99f6c581ef0ee8591a1aa6ccd
commit: 1230fbb225abf3f04c64697c6b0f8dfb473b3790 irqchip: Enable compile testing of Broadcom drivers
date:   1 year, 1 month ago
:::::: branch date: 4 hours ago
:::::: commit date: 1 year, 1 month ago
config: arm64-randconfig-r2107-20261115 (https://download.01.org/0day-ci/archive/20261118/20261118223936.zqFEaXJv-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project c0693becb96c1610aeb87445a50df00d58a823cd)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 1230fbb225ab ("irqchip: Enable compile testing of Broadcom drivers")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/20261118223936.zqFEaXJv-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/irqchip/irq-bcm7038-l1.c:411:7-10: ERROR: iterator variable bound on line 408 cannot be NULL

vim +411 drivers/irqchip/irq-bcm7038-l1.c

5f7f0317ed28b86 Kevin Cernekee    2014-12-25  396  
1e3e330c07076a0 Johan Hovold      2025-10-13  397  static int bcm7038_l1_probe(struct platform_device *pdev, struct device_node *parent)
5f7f0317ed28b86 Kevin Cernekee    2014-12-25  398  {
1e3e330c07076a0 Johan Hovold      2025-10-13  399  	struct device_node *dn = pdev->dev.of_node;
5f7f0317ed28b86 Kevin Cernekee    2014-12-25  400  	struct bcm7038_l1_chip *intc;
5f7f0317ed28b86 Kevin Cernekee    2014-12-25  401  	int idx, ret;
5f7f0317ed28b86 Kevin Cernekee    2014-12-25  402  
5f7f0317ed28b86 Kevin Cernekee    2014-12-25  403  	intc = kzalloc(sizeof(*intc), GFP_KERNEL);
5f7f0317ed28b86 Kevin Cernekee    2014-12-25  404  	if (!intc)
5f7f0317ed28b86 Kevin Cernekee    2014-12-25  405  		return -ENOMEM;
5f7f0317ed28b86 Kevin Cernekee    2014-12-25  406  
5f7f0317ed28b86 Kevin Cernekee    2014-12-25  407  	raw_spin_lock_init(&intc->lock);
5f7f0317ed28b86 Kevin Cernekee    2014-12-25 @408  	for_each_possible_cpu(idx) {
5f7f0317ed28b86 Kevin Cernekee    2014-12-25  409  		ret = bcm7038_l1_init_one(dn, idx, intc);
5f7f0317ed28b86 Kevin Cernekee    2014-12-25  410  		if (ret < 0) {
5f7f0317ed28b86 Kevin Cernekee    2014-12-25 @411  			if (idx)
5f7f0317ed28b86 Kevin Cernekee    2014-12-25  412  				break;
5f7f0317ed28b86 Kevin Cernekee    2014-12-25  413  			pr_err("failed to remap intc L1 registers\n");
5f7f0317ed28b86 Kevin Cernekee    2014-12-25  414  			goto out_free;
5f7f0317ed28b86 Kevin Cernekee    2014-12-25  415  		}
5f7f0317ed28b86 Kevin Cernekee    2014-12-25  416  	}
5f7f0317ed28b86 Kevin Cernekee    2014-12-25  417  
affdc0d1bdfa544 Jiri Slaby (SUSE  2025-03-19  418) 	intc->domain = irq_domain_create_linear(of_fwnode_handle(dn), IRQS_PER_WORD * intc->n_words,
5f7f0317ed28b86 Kevin Cernekee    2014-12-25  419  					     &bcm7038_l1_domain_ops,
5f7f0317ed28b86 Kevin Cernekee    2014-12-25  420  					     intc);
5f7f0317ed28b86 Kevin Cernekee    2014-12-25  421  	if (!intc->domain) {
5f7f0317ed28b86 Kevin Cernekee    2014-12-25  422  		ret = -ENOMEM;
5f7f0317ed28b86 Kevin Cernekee    2014-12-25  423  		goto out_unmap;
5f7f0317ed28b86 Kevin Cernekee    2014-12-25  424  	}
5f7f0317ed28b86 Kevin Cernekee    2014-12-25  425  

:::::: The code at line 411 was first introduced by commit
:::::: 5f7f0317ed28b86bdae9baf65bb72d405b6f79ee IRQCHIP: Add new driver for BCM7038-style level 1 interrupt controllers

:::::: TO: Kevin Cernekee <cernekee@gmail.com>
:::::: CC: Ralf Baechle <ralf@linux-mips.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
