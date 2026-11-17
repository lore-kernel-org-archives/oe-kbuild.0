Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794918587;
	b=X4YyIxnvXPf5QjBaPOLxQxsYAen2rnMN5vn94U/vpTg4SMMqrvmD81Cm5Ea2Q4IkaKl9
	 utJvmSBeNFngAFeI6fvTi1Zz8Ub37FERIw02iocMWXvVf1DE87qZd4SS0ASEFxxjAtFMn
	 aS2WnO1czQy1Qvl5lTA3/FEA2DFPhiXoZHqyrgDcubcy3S37cpyNLZAXIVgU7vITJL8tA
	 2FFaQAjjCRopDTazgimTk3CYir5/d47RvYI09PWZ0Uuvgj9Q6Zdek1DDpgu+7RLIofspE
	 W3XpIjLCqyYTZy/+t40yaWNv2EAgVfPWRH/MT6GhQORe2zQytXsyHUZz5zutQwqX9qA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794918587;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=rusvfkWTn6ixAFdl6fzEDS5asMWn8omfUwiJL2b9WYg=;
	b=4BGAVXYzh9NixV0uaR0hdg1dnEipOdALYWoRy2EOaCVyXCMWa7h/kmy1thFEohvsnh40
	 gB2UURYy9M9HDZri5BsubdC3gG5QaM8HkAHXGwkOayu//C+Pb/RKtA6MuEXK6AveJn2vP
	 0YMaI+YUbwrB1V9/vNxmo77iXgRE19IGrZ2Th89TlyafuwnN6qiOj60ZGtBZZEbiMbvSI
	 o245QKVTmjrEbdja+Poo7lsWXzpILn504FbKFeanHkzBuhpCpa0YW9hTBPLRWsTjcC5wp
	 ttpHNr0y/6utti7EQ3FXT0DMnSSeGFNargfNgYMAEjrOAIKKN3eA+Lgs51Sjye2QfMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hZmGv0cZ;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6620A606A31C
	for <oe-kbuild@lists.linux.dev>; Tue, 17 Nov 2026 12:29:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6620A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hZmGv0cZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794918587; x=1826454587;
  h=date:from:to:cc:subject:message-id;
  bh=mviRSS5lr9fcwK3XIqq7Q2vDbowJLG0pyB70AQpljX0=;
  b=hZmGv0cZE9AShMl1TiCmDFyi+EMGzyQ4Vf7mk/kP1Gp7Pe0JFMn8gymw
   uKHmA3pndLkLQyRDZncHzH89OzEtNh/XiFDFYHURgTvGWbqD1KTfaUCdt
   KqjWFXROfq39OQjG0htDDLQLdlkanlB9nN74ZqmmEem+dSMrQO+vibg/i
   +WMukm5tLUkhbsu0dY9q/nuKIFCzO8W/DtcynrkKaHhwcDusLViO+xbpD
   loBk1lVviGs+8hIMTCak3spr8FP/7n/t76q3tnY5raCLoOZIL4YzUR0Uv
   +KctbnRjRfTWMsPNNcW0Gol5mFsNnB8SNJyQ1+sQls5t6YHZiItP4cHix
   Q==;
X-CSE-ConnectionGUID: WPtGazbvT6e4ctEwgB32hg==
X-CSE-MsgGUID: osJu13f+RY22uqOqLS/iOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3679326"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3679326"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 04:29:47 -0800
X-CSE-ConnectionGUID: 7+ny7SD5RBqenY+0lH1k7g==
X-CSE-MsgGUID: nGhWk+J4TGSNmkglFG4Bpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="11756270"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa013.fm.intel.com with ESMTP; 17 Nov 2026 04:29:46 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTIJj-00000000370-2weK;
	Tue, 17 Nov 2026 12:29:43 +0000
Date: Tue, 17 Nov 2026 13:29:36 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/irqchip/irq-bcm7038-l1.c:411:7-10: ERROR: iterator
 variable bound on line 408 cannot be NULL
Message-ID: <20261117131927.IHtEpxWQ-lkp@intel.com>
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
head:   666539eecdf4db623f5e3c3e55cf9f2dfad24aa4
commit: 1230fbb225abf3f04c64697c6b0f8dfb473b3790 irqchip: Enable compile testing of Broadcom drivers
date:   1 year, 1 month ago
:::::: branch date: 19 hours ago
:::::: commit date: 1 year, 1 month ago
config: arm64-randconfig-r2107-20261115 (https://download.01.org/0day-ci/archive/20261117/20261117131927.IHtEpxWQ-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project c0693becb96c1610aeb87445a50df00d58a823cd)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 1230fbb225ab ("irqchip: Enable compile testing of Broadcom drivers")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/20261117131927.IHtEpxWQ-lkp@intel.com/

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
