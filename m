Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794823889;
	b=upoxVlB653TnOeV/iBjkMFMxpqdzY4MjR8+JWNxk45CjRtpgXbeCBgU8CCphTcejTXFI
	 StM6e1wgIcr2jjI1uDfIZJsJ4fSYE2lZ2Dm6GssOZ5zmGuUi4+xY0r139d4veVeY2Smhr
	 8mMsOPn/6nx4MoyE0DZRY9rfb8VVlPW9Hkr0xD70v1D/wyLtUjLld29IQkp4+0M+i10sW
	 DhatLJvVKK009DGdPnIDxv21WtKlAU+xUnIs/xg4+aW07WOiyyrdMA5czC2nubxv2i1RQ
	 wbWoLMjJdMFAKlv93XSf8yr3DPuFE8988qfTUCdrexbidlYKF1kuhJBVe4XirUVKGQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794823889;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=u5cUyyz9nywf57cVdxEkWPnwBs5YfF3wmStyayLNPF0=;
	b=1g3/Txv423w0sB4ZWR5nevCeY6J869yyyDYXBSoIfqeMRg9I8nUNlB1A2k7UKUOwNI9H
	 LZfi73exDz+nwJKSigAjGsE4vMPgOQ0np+18LZraKQuCSkw1sD4278/qv6vGLITcNd5+O
	 m7zvgsTbgeSYRS8zqSBWVCHXiZ2ZPms7aKJlned33CjZmWSIy7lXkqKSMcctKKgyrkCEm
	 E31EtH/62itIXINHkoZKP0yP0rAmfQBN6qAjOH89ajsWmUD31l/QyCuNXEms7K+MSzFVn
	 kmhop2rfAZlopHb4cXOG/HjjsfWLSMYSAz5iFnFhexxb0q3LzmgvFMcR0nB53xV38Mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NPM7OxAq;
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06016606A329
	for <oe-kbuild@lists.linux.dev>; Mon, 16 Nov 2026 10:11:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06016606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NPM7OxAq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794823888; x=1826359888;
  h=date:from:to:cc:subject:message-id;
  bh=tJ8R0kR0140eQkvYx6Qty1H5BfdoA0wdmEo4KdrS7m8=;
  b=NPM7OxAq208om1sjTR9tLaE+pZLilRSfJkfk3BBtox73fnTlkJnvBRZh
   +fQ6F6wsj/aqAvcno3mXukkC6FOK7eLyQsxUQtdxwrsOjoTpn7jGUaeLq
   Q7EJ5muFM6qDd0/T+mpZlQ9VEPIwpXA3uVaGD6/62g6odSP/TYXK9HTDX
   irQAFQMiH8hhYmUfq58puIJYJYTiJJ8tdS2vWgm1W6Cek5EcDe6/MGlKj
   PZPQdPvL/UkiCBtkxz3Smrtaf0IrUzjbxPHRa3FMr+EsU/t5LAqvUrU5U
   qqUgEz0QQcPRVmwdIggQybb4IN1UR6ePQGu42E5BxTJwUqfT9z/VlQzwq
   Q==;
X-CSE-ConnectionGUID: qKGcT4ThSQCg1SY6zSakRg==
X-CSE-MsgGUID: 81U5Lxh8Ra209H9sZPE6QA==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3542446"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3542446"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 02:11:27 -0800
X-CSE-ConnectionGUID: km6Ifxu8TGqs0oVBKFWGhQ==
X-CSE-MsgGUID: DN34H6ubTE2lF74dkenluQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="9355551"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 16 Nov 2026 02:11:26 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xStgJ-000000002f9-3nPj;
	Mon, 16 Nov 2026 10:11:23 +0000
Date: Mon, 16 Nov 2026 11:11:12 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/irqchip/irq-bcm7038-l1.c:411:7-10: ERROR: iterator
 variable bound on line 408 cannot be NULL
Message-ID: <202611161146.Vhc0nZBL-lkp@intel.com>
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
head:   aebb7274476403040d582c61478df8f4a7bf9cd3
commit: 1230fbb225abf3f04c64697c6b0f8dfb473b3790 irqchip: Enable compile testing of Broadcom drivers
date:   1 year, 1 month ago
:::::: branch date: 12 hours ago
:::::: commit date: 1 year, 1 month ago
config: arm64-randconfig-r2107-20261115 (https://download.01.org/0day-ci/archive/20261116/202611161146.Vhc0nZBL-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project c0693becb96c1610aeb87445a50df00d58a823cd)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 1230fbb225ab ("irqchip: Enable compile testing of Broadcom drivers")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202611161146.Vhc0nZBL-lkp@intel.com/

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
