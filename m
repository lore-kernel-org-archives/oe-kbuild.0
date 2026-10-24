Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792831801;
	b=Rudhh4vbV6WF0raXoe/GCqDUlC+SdnAU1iZXByRnZaQGS01WOcH0QxhjI+jA0iu5HXu7
	 Oq8S/UpdPpUm5yXfCyqUeaGlAEAri1dH9AzNEXQH9JXIkyMMi6vnbKhcEuux9hCeL0kgs
	 KJGEycT0FWVuVTgti4UvLiU74g+aM53LfiPYFRGJf83Ce+0SRszzY5GWKyBkwXx7F4yzo
	 3k+8KzhgdH6J6xVxvShi1tV4xvKO21aiHt5iSw7E0RMn9vpk05rB42WMqyLoeFdm4aYNU
	 kVvr6YBT+lfEFukPULKH9IWWzmaqj5UneXe/OqLzNo19jclJUcfx+wp1MuG4555btWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792831801;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=L41KHJ8l4pfjaEzqYl8a/kSkdBxYhMeMBd+BQwpzsTA=;
	b=NoaSrbxTlbXhdVtJSAvcrWlXAL7emlJBB3W9cX80rg8Cguy0sBnppWIDGxSYbaYDz16y
	 4umeh4AabAVB6JLvht5Pe8fmJ8gBBeXtOtjWP5Reb0u8eXyZX8mWV8NTVvHS/60fweLxr
	 l4uYorDsaWTIOOoakpYjwyAsydKuUJC2XOItLCsua+5uYweFnsUBVoEhoN+BLhj51CIAH
	 quJVRnV6WLc3WsLx+egUs8d0SL8sSttNE9+j+Sq+jWKt7oKHgxXNCzyi2VGNxtUvLgKkg
	 Xoqa5I/3n7YN2Ass68nTLXzONqDx46xPbdLtckr4WySBUJMxd+ty+6jJQTx2oINmD+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eKa6lNeq;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001C3606A31A
	for <oe-kbuild@lists.linux.dev>; Sat, 24 Oct 2026 08:49:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 001C3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eKa6lNeq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792831800; x=1824367800;
  h=date:from:to:cc:subject:message-id;
  bh=LdQc7Kl1RcdGcqryhNhmr2epLZGyKsbISbRqy/nLMT8=;
  b=eKa6lNeqLgE4AmWMfpXwdfVCmYsZtg8OUk+jbdu7HU+gyw+j+yZ3QAOs
   a7aSD2qNepjjazSM7EJLpqVfTj9krU6wuhhkRxC6DPwumV6KOppvFC0B4
   kTsgeG3dDZNzeVIYO7NbuPwoTdc6cgAU8bsqRFkqiYtRHL3MDko8SHfyZ
   I2fpT3BZoF7PnA33ZY9eTr1HH/S/yTRM8vRU67PkTaRURS0wG6dI0Nf6F
   FlYp8VfVxDcWM75ybLtVocIBWeQPSjt66e1cuR3+PxjApjXlk7imrbe4n
   oKq2jOsTtkR353M8hKXaclnVJfpFcSFPm1c9ZoJxSXnphaJtyDvl/M0v1
   w==;
X-CSE-ConnectionGUID: 8+H6Uii+SD2Yu7Kx1YnC3g==
X-CSE-MsgGUID: QqK0Xm4RQJ6xNR7yeXQLTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11944"; a="1682637"
X-IronPort-AV: E=Sophos;i="6.27,176,1787036400"; 
   d="scan'208";a="1682637"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2026 01:49:59 -0700
X-CSE-ConnectionGUID: XVLtK6jbTiWfgzb/mCDwZQ==
X-CSE-MsgGUID: nguXjyirR6+a2rxPBvVS1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,176,1787036400"; 
   d="scan'208";a="3939892"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 24 Oct 2026 01:49:44 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xKXRe-000000003Lb-0gU8;
	Sat, 24 Oct 2026 08:49:42 +0000
Date: Sat, 24 Oct 2026 10:48:52 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/irqchip/irq-econet-en751221.c:477
 econet_intc_of_init() warn: 'res.start' from __request_region() not released
 on lines: 462.
Message-ID: <202610241045.m7Gq1xEm-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Caleb James DeLisle <cjd@cjdns.fr>
CC: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5b0764a53235d3c77e1ed674e836e1b3fe1a4b1f
commit: 8ae6e79ee0ce7a533c005d12c9a230b273f32ef1 mips: econet: add multi-vpe capability to EN751221
date:   3 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 3 months ago
config: mips-randconfig-r2201-20261024 (https://download.01.org/0day-ci/archive/20261024/202610241045.m7Gq1xEm-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project a808f8ea7fdc61ead417bfe55e8ef5f728776aeb)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 8ae6e79ee0ce ("mips: econet: add multi-vpe capability to EN751221")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610241045.m7Gq1xEm-lkp@intel.com/

New smatch warnings:
drivers/irqchip/irq-econet-en751221.c:477 econet_intc_of_init() warn: 'res.start' from __request_region() not released on lines: 462.

Old smatch warnings:
drivers/irqchip/irq-econet-en751221.c:299 get_shadow_interrupts() error: buffer overflow 'econet_intc.interrupt_shadows' 40 <= 40
drivers/irqchip/irq-econet-en751221.c:306 get_shadow_interrupts() error: buffer overflow 'econet_intc.interrupt_shadows' 40 <= 40

vim +477 drivers/irqchip/irq-econet-en751221.c

2ee2a685ee838f Caleb James DeLisle 2026-04-30  405  
1902a59cf5f9d8 Caleb James DeLisle 2025-03-30  406  static int __init econet_intc_of_init(struct device_node *node, struct device_node *parent)
1902a59cf5f9d8 Caleb James DeLisle 2025-03-30  407  {
1902a59cf5f9d8 Caleb James DeLisle 2025-03-30  408  	struct irq_domain *domain;
1902a59cf5f9d8 Caleb James DeLisle 2025-03-30  409  	struct resource res;
1902a59cf5f9d8 Caleb James DeLisle 2025-03-30  410  	int ret, irq;
1902a59cf5f9d8 Caleb James DeLisle 2025-03-30  411  
1902a59cf5f9d8 Caleb James DeLisle 2025-03-30  412  	ret = get_shadow_interrupts(node);
1902a59cf5f9d8 Caleb James DeLisle 2025-03-30  413  	if (ret)
1902a59cf5f9d8 Caleb James DeLisle 2025-03-30  414  		return ret;
1902a59cf5f9d8 Caleb James DeLisle 2025-03-30  415  
1902a59cf5f9d8 Caleb James DeLisle 2025-03-30  416  	irq = irq_of_parse_and_map(node, 0);
1902a59cf5f9d8 Caleb James DeLisle 2025-03-30  417  	if (!irq) {
1902a59cf5f9d8 Caleb James DeLisle 2025-03-30  418  		pr_err("%pOF: DT: Failed to get IRQ from 'interrupts'\n", node);
1902a59cf5f9d8 Caleb James DeLisle 2025-03-30  419  		return -EINVAL;
1902a59cf5f9d8 Caleb James DeLisle 2025-03-30  420  	}
1902a59cf5f9d8 Caleb James DeLisle 2025-03-30  421  
1902a59cf5f9d8 Caleb James DeLisle 2025-03-30  422  	if (of_address_to_resource(node, 0, &res)) {
1902a59cf5f9d8 Caleb James DeLisle 2025-03-30  423  		pr_err("%pOF: DT: Failed to get 'reg'\n", node);
1902a59cf5f9d8 Caleb James DeLisle 2025-03-30  424  		ret = -EINVAL;
1902a59cf5f9d8 Caleb James DeLisle 2025-03-30  425  		goto err_dispose_mapping;
1902a59cf5f9d8 Caleb James DeLisle 2025-03-30  426  	}
1902a59cf5f9d8 Caleb James DeLisle 2025-03-30  427  
1902a59cf5f9d8 Caleb James DeLisle 2025-03-30  428  	if (!request_mem_region(res.start, resource_size(&res), res.name)) {
1902a59cf5f9d8 Caleb James DeLisle 2025-03-30  429  		pr_err("%pOF: Failed to request memory\n", node);
1902a59cf5f9d8 Caleb James DeLisle 2025-03-30  430  		ret = -EBUSY;
1902a59cf5f9d8 Caleb James DeLisle 2025-03-30  431  		goto err_dispose_mapping;
1902a59cf5f9d8 Caleb James DeLisle 2025-03-30  432  	}
1902a59cf5f9d8 Caleb James DeLisle 2025-03-30  433  
1902a59cf5f9d8 Caleb James DeLisle 2025-03-30  434  	econet_intc.membase = ioremap(res.start, resource_size(&res));
1902a59cf5f9d8 Caleb James DeLisle 2025-03-30  435  	if (!econet_intc.membase) {
1902a59cf5f9d8 Caleb James DeLisle 2025-03-30  436  		pr_err("%pOF: Failed to remap membase\n", node);
1902a59cf5f9d8 Caleb James DeLisle 2025-03-30  437  		ret = -ENOMEM;
1902a59cf5f9d8 Caleb James DeLisle 2025-03-30  438  		goto err_release;
1902a59cf5f9d8 Caleb James DeLisle 2025-03-30  439  	}
1902a59cf5f9d8 Caleb James DeLisle 2025-03-30  440  
1902a59cf5f9d8 Caleb James DeLisle 2025-03-30  441  	econet_mask_all();
1902a59cf5f9d8 Caleb James DeLisle 2025-03-30  442  
96a8cb6d28cebd Jiri Slaby (SUSE    2025-05-13  443) 	domain = irq_domain_create_linear(of_fwnode_handle(node), IRQ_COUNT,
85cf5c63d32f39 Thomas Gleixner     2025-05-06  444  					  &econet_domain_ops, NULL);
1902a59cf5f9d8 Caleb James DeLisle 2025-03-30  445  	if (!domain) {
1902a59cf5f9d8 Caleb James DeLisle 2025-03-30  446  		pr_err("%pOF: Failed to add irqdomain\n", node);
1902a59cf5f9d8 Caleb James DeLisle 2025-03-30  447  		ret = -ENOMEM;
1902a59cf5f9d8 Caleb James DeLisle 2025-03-30  448  		goto err_unmap;
1902a59cf5f9d8 Caleb James DeLisle 2025-03-30  449  	}
1902a59cf5f9d8 Caleb James DeLisle 2025-03-30  450  
2ee2a685ee838f Caleb James DeLisle 2026-04-30  451  	/*
2ee2a685ee838f Caleb James DeLisle 2026-04-30  452  	 * 34K Manual (MD00534) Section 6.3.1.3 rev 1.13 page 136:
2ee2a685ee838f Caleb James DeLisle 2026-04-30  453  	 * In VEIC mode, IP2 ... IP7 are repurposed as Interrupt Priority Level. The controller
2ee2a685ee838f Caleb James DeLisle 2026-04-30  454  	 * will filter incoming interrupts whose priority is lower than the IPL number. Therefore
2ee2a685ee838f Caleb James DeLisle 2026-04-30  455  	 * we must not set any of these bits. We avoid setting IP2 by not actually chaining this
2ee2a685ee838f Caleb James DeLisle 2026-04-30  456  	 * intc to the CPU intc.
2ee2a685ee838f Caleb James DeLisle 2026-04-30  457  	 */
2ee2a685ee838f Caleb James DeLisle 2026-04-30  458  	if (cpu_has_veic) {
2ee2a685ee838f Caleb James DeLisle 2026-04-30  459  		ret = econet_cpu_init(node);
2ee2a685ee838f Caleb James DeLisle 2026-04-30  460  
2ee2a685ee838f Caleb James DeLisle 2026-04-30  461  		if (ret)
2ee2a685ee838f Caleb James DeLisle 2026-04-30  462  			return ret;
2ee2a685ee838f Caleb James DeLisle 2026-04-30  463  	} else {
1902a59cf5f9d8 Caleb James DeLisle 2025-03-30  464  		irq_set_chained_handler_and_data(irq, econet_intc_from_parent, domain);
2ee2a685ee838f Caleb James DeLisle 2026-04-30  465  	}
2ee2a685ee838f Caleb James DeLisle 2026-04-30  466  
2ee2a685ee838f Caleb James DeLisle 2026-04-30  467  	econet_intc.domain = domain;
1902a59cf5f9d8 Caleb James DeLisle 2025-03-30  468  
1902a59cf5f9d8 Caleb James DeLisle 2025-03-30  469  	return 0;
1902a59cf5f9d8 Caleb James DeLisle 2025-03-30  470  
1902a59cf5f9d8 Caleb James DeLisle 2025-03-30  471  err_unmap:
1902a59cf5f9d8 Caleb James DeLisle 2025-03-30  472  	iounmap(econet_intc.membase);
1902a59cf5f9d8 Caleb James DeLisle 2025-03-30  473  err_release:
1902a59cf5f9d8 Caleb James DeLisle 2025-03-30  474  	release_mem_region(res.start, resource_size(&res));
1902a59cf5f9d8 Caleb James DeLisle 2025-03-30  475  err_dispose_mapping:
1902a59cf5f9d8 Caleb James DeLisle 2025-03-30  476  	irq_dispose_mapping(irq);
1902a59cf5f9d8 Caleb James DeLisle 2025-03-30 @477  	return ret;
1902a59cf5f9d8 Caleb James DeLisle 2025-03-30  478  }
1902a59cf5f9d8 Caleb James DeLisle 2025-03-30  479  

:::::: The code at line 477 was first introduced by commit
:::::: 1902a59cf5f9d8b99ecf0cb8f122cb00ef7a3f13 irqchip: Add EcoNet EN751221 INTC

:::::: TO: Caleb James DeLisle <cjd@cjdns.fr>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
