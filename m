Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F69480343
	for <oe-kbuild@lists.linux.dev>; Wed,  3 Jun 2026 22:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780525229; cv=none; b=uqF89rLGjZeFcQN57+3DXRGzk32Qwd5XOBlNB4QSarpj7rbx8EtajhHepocT9mB2n0LBUBE1bgBEH6ULBeyuWIuWUVKrGhf6jcWKVjDEaKVi1moMUQjUUq38xdxbAw+3lFF45B3CIQneC4KSoirQvbtw1eItLkoqKGJdpC6PCzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780525229; c=relaxed/simple;
	bh=Qd/eePZPQFjJeCLGenUK9bDcveVWRlXMdL7q5Vazm6A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=s3mEFPWPyF4WZVWkANmGvkzT5z7RW8AbNJ+puqRmO2zwlrfbpvvgzDwmopKtYSgTG1imetc4RpaQ4iZf4cZISY7U4XXIoNWj67/9yqOd1DDYZEvgxrG+UEuB8UsErOuRwaj+2NbM/nzt2w/QSzDZ8iYvrwf/Ck7uXmwH9L9yxBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QLYwMNh0; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QLYwMNh0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780525228; x=1812061228;
  h=date:from:to:cc:subject:message-id;
  bh=Qd/eePZPQFjJeCLGenUK9bDcveVWRlXMdL7q5Vazm6A=;
  b=QLYwMNh0DlJ0v8sjVaTdttchCSASbu1CF/eukxez4hi9F0soIWf3ZvfL
   LJKPAfAVtXhV9Q1Z/i0EHLo3B5DWoUu4ybt3+EHJzj0j1khENeKhCLcej
   wnsao5Yu/iEpWfvCwuz5VdeaZfxLYU6oo8OO+JCGzglxhU9kJaH0ipAdh
   PVnOiFt59K6lIriYzwHIi0lap4+V6dYyrNsYNjBoJje4ZhZi8rGHHOajU
   Osf7eEA+MnHOMUKEvnp+fqpRZfM5BxdZvZ0HDQJoaRGH+53GXr7hcX1ue
   yhQIU6l4JqPyp1XA3wD349A0gFn3K3mfbT1+/8ciNelfFaH5mNlffbXog
   A==;
X-CSE-ConnectionGUID: 6GH1up9HQf+HkbA+SFMAyg==
X-CSE-MsgGUID: IBBFbkOeQ/OkFtwHISpwoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11806"; a="80489717"
X-IronPort-AV: E=Sophos;i="6.24,186,1774335600"; 
   d="scan'208";a="80489717"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 15:20:27 -0700
X-CSE-ConnectionGUID: XhKUXRFQTi+s5SwWrdR2Cg==
X-CSE-MsgGUID: KO7qcwWwSAunPZkboySGSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,186,1774335600"; 
   d="scan'208";a="248314243"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 03 Jun 2026 15:20:26 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wUtwl-00000000Dwk-0Pvc;
	Wed, 03 Jun 2026 22:20:23 +0000
Date: Thu, 04 Jun 2026 06:19:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/irqchip/irq-bcm7038-l1.c:411:7-10: ERROR: iterator
 variable bound on line 408 cannot be NULL
Message-ID: <202606040634.oNltyWVH-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ba3e43a9e601636f5edb54e259a74f96ca3b8fd8
commit: 1230fbb225abf3f04c64697c6b0f8dfb473b3790 irqchip: Enable compile testing of Broadcom drivers
date:   8 months ago
:::::: branch date: 28 hours ago
:::::: commit date: 8 months ago
config: loongarch-randconfig-r064-20260604 (https://download.01.org/0day-ci/archive/20260604/202606040634.oNltyWVH-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 1230fbb225ab ("irqchip: Enable compile testing of Broadcom drivers")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202606040634.oNltyWVH-lkp@intel.com/

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
